import 'dart:async';
import 'dart:developer';

import 'package:app_logger/app_logger.dart';
import 'package:dio/dio.dart';

import '../exceptions/api_exception.dart';
import '../helper/constants.dart';
import '../interceptors/gzip_interceptor.dart';
import '../interceptors/token_interceptor.dart';
import '../models/enums.dart';
import '../models/refresh_token_request.dart';
import '../models/refresh_token_response.dart';
import '../services/secure_storage.dart';
import 'api_client.dart';

class AhcApiClient extends ApiClient {
  late Dio _dio;

  AhcApiClient.dev({List<String>? gzipUrls}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://dev-api.example.com',
        contentType: Headers.jsonContentType,
        connectTimeout: const Duration(seconds: 120),
        receiveTimeout: const Duration(seconds: 120),
        sendTimeout: const Duration(seconds: 120),
      ),
    );
    dio.interceptors.add(TokenInterceptor());
    if (gzipUrls != null) {
      dio.interceptors.add(GzipInterceptor(gzipUrls));
    }
    _dio = dio;
  }

  AhcApiClient.prod({List<String>? gzipUrls}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.example.com',
        contentType: Headers.jsonContentType,
        connectTimeout: const Duration(seconds: 120),
        receiveTimeout: const Duration(seconds: 120),
        sendTimeout: const Duration(seconds: 120),
      ),
    );
    dio.interceptors.add(TokenInterceptor());
    if (gzipUrls != null) {
      dio.interceptors.add(GzipInterceptor(gzipUrls));
    }
    _dio = dio;
  }

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool extractData = true,
  }) async {
    _checkTokenExpiration();

    try {
      logDebug('GET $path ${queryParameters ?? ''}');

      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      logDebug('SUCCESS GET $path ${queryParameters ?? ''} ${response.data}');

      return extractData ? response.data['data'] : response.data;
    } on DioException catch (e) {
      logError(
        'GET ERROR | PATH: $path - QUERY PARAMS: $queryParameters - MESSAGE: ${e.message} - RESPONSE DATA: ${e.response?.data}',
        e.error,
      );

      _handleDioException(
        e,
        path: path,
        method: ApiMethod.get,
        queryParams: queryParameters,
        extractData: extractData,
      );
    }
  }

  @override
  Future<dynamic> post(
    String path,
    Object? data, {
    bool extractData = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      log('POST $path $data');

      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType:
              data is FormData ? 'multipart/form-data' : 'application/json',
        ),
      );

      logDebug('SUCCESS GET $path ${queryParameters ?? ''} ${response.data}');

      return extractData ? response.data['data'] : response.data;
    } on DioException catch (e) {
      logError(
        'POST ERROR | PATH: $path - MESSAGE: ${e.message} - RESPONSE DATA: ${e.response?.data}',
        e.error,
      );

      _handleDioException(
        e,
        path: path,
        method: ApiMethod.post,
        requestData: data,
        queryParams: queryParameters,
        extractData: extractData,
      );
    }
  }

  @override
  Future<dynamic> put(
    String path,
    Object? data, {
    bool extractData = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      log('PUT $path $data');

      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType:
              data is FormData ? 'multipart/form-data' : 'application/json',
        ),
      );

      logDebug('SUCCESS GET $path ${queryParameters ?? ''} ${response.data}');

      return extractData ? response.data['data'] : response.data;
    } on DioException catch (e) {
      logError(
        'PUT ERROR | PATH: $path - MESSAGE: ${e.message} - RESPONSE DATA: ${e.response?.data}',
        e.error,
      );

      _handleDioException(
        e,
        path: path,
        method: ApiMethod.put,
        requestData: data,
        queryParams: queryParameters,
        extractData: extractData,
      );
    }
  }

  @override
  Future<dynamic> patch(
    String path,
    Object? data, {
    bool extractData = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      log('PATCH $path $data');

      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType:
              data is FormData ? 'multipart/form-data' : 'application/json',
        ),
      );

      logDebug('SUCCESS GET $path ${queryParameters ?? ''} ${response.data}');

      return extractData ? response.data['data'] : response.data;
    } on DioException catch (e) {
      logError(
        'PATCH ERROR | PATH: $path - MESSAGE: ${e.message} - RESPONSE DATA: ${e.response?.data}',
        e.error,
      );

      _handleDioException(
        e,
        path: path,
        method: ApiMethod.patch,
        requestData: data,
        queryParams: queryParameters,
        extractData: extractData,
      );
    }
  }

  Future<void> _handleDioException(
    DioException e, {
    required String path,
    required ApiMethod method,
    Object? requestData,
    Map<String, dynamic>? queryParams,
    required bool extractData,
  }) async {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      throw TimeoutException(e.message);
    }

    if (e.type == DioExceptionType.badResponse) {
      if (e.response?.statusCode == 102) {
        throw ApiException(
          code: e.response?.statusCode,
          path: path,
          method: method,
          requestData: requestData,
          queryParams: queryParams,
        );
      }

      if (e.response?.statusCode == 401) {
        if (await _refreshToken()) {
          return await _retryRequest(
            path,
            method,
            requestData: requestData,
            queryParams: queryParams,
            extractData: extractData,
          );
        }

        throw ApiException(
          code: e.response?.statusCode,
          path: path,
          method: method,
          requestData: requestData,
          queryParams: queryParams,
        );
      }

      if (e.response?.statusCode == 502) {
        throw ApiException(
          code: e.response?.statusCode,
          path: path,
          method: method,
          requestData: requestData,
          queryParams: queryParams,
        );
      }

      if (e.response?.data is Map<String, dynamic>) {
        throw ApiException(
          code: e.response?.statusCode,
          path: path,
          method: method,
          requestData: requestData,
          queryParams: queryParams,
          message: e.response?.data['message'] ?? e.response?.statusMessage,
        );
      }
    }

    throw ApiException(
      code: e.response?.statusCode,
      message: e.response?.data is Map<String, dynamic>
          ? e.response?.data['message'] ??
              e.response?.statusMessage ??
              e.message
          : e.response?.statusMessage ?? e.message,
      path: path,
      method: method,
      requestData: requestData,
      queryParams: queryParams,
    );
  }

  Future<bool> _refreshToken() async {
    final refreshToken = await SecureStorage().read(
      SecureStorageKeys.refreshToken,
    );

    if (refreshToken == null) return false;

    try {
      final response = await post(
        'api/refresh-token',
        RefreshTokenRequest(refreshToken),
      );

      final newAccessToken = RefreshTokenResponse.fromJson(response);

      await SecureStorage().write(
        SecureStorageKeys.accessToken,
        newAccessToken.accessToken,
      );
      await SecureStorage().write(
        SecureStorageKeys.refreshToken,
        newAccessToken.refreshToken,
      );
      await SecureStorage().write(
        SecureStorageKeys.tokenExpiry,
        newAccessToken.expiresAt,
      );

      return true;
    } catch (e) {
      logError('TOKEN REFRESH FAILED: ${e.toString()}');
      return false;
    }
  }

  Future<dynamic> _retryRequest(
    String path,
    ApiMethod method, {
    Object? requestData,
    Map<String, dynamic>? queryParams,
    required bool extractData,
  }) async {
    logDebug('RETRYING $method $path');

    switch (method) {
      case ApiMethod.get:
        return await get(
          path,
          queryParameters: queryParams,
          extractData: extractData,
        );
      case ApiMethod.post:
        return await post(
          path,
          requestData,
          queryParameters: queryParams,
          extractData: extractData,
        );
      case ApiMethod.put:
        return await put(
          path,
          requestData,
          queryParameters: queryParams,
          extractData: extractData,
        );
      case ApiMethod.patch:
        return await patch(
          path,
          requestData,
          queryParameters: queryParams,
          extractData: extractData,
        );
    }
  }

  Future<void> _checkTokenExpiration() async {
    final expiry = await SecureStorage().read(SecureStorageKeys.tokenExpiry);
    if (expiry != null && _isTokenExpired(expiry)) {
      await _refreshToken();
    }
  }

  bool _isTokenExpired(String expiry) {
    final expiryDate = DateTime.parse(expiry);
    return expiryDate.isBefore(DateTime.now());
  }
}
