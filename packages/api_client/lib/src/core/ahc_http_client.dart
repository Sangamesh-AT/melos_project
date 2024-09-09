import 'dart:async';
import 'dart:developer';

import 'package:api_client/src/helper/gzip_interceptor.dart';
import 'package:api_client/src/helper/logger.dart';
import 'package:api_client/src/models/api_exception.dart';
import 'package:api_client/src/models/enums.dart';
import 'package:dio/dio.dart';

class AhcHttpClient {
  late Dio _dio;

  AhcHttpClient(
    String baseUrl, {
    List<String>? gzipUrls,
    Map<String, String>? headers,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: Headers.jsonContentType,
        headers: headers,
        connectTimeout: const Duration(seconds: 120),
        receiveTimeout: const Duration(seconds: 120),
        sendTimeout: const Duration(seconds: 120),
      ),
    )..interceptors.add(GzipInterceptor(gzipUrls ?? []));
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool extractData = true,
  }) async {
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
      );
    }
  }

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
      );
    }
  }

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
      );
    }
  }

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
      );
    }
  }

  void _handleDioException(
    DioException e, {
    required String path,
    required ApiMethod method,
    Object? requestData,
    Map<String, dynamic>? queryParams,
  }) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      throw TimeoutException(
        e.message,
      );
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
}
