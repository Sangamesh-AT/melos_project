import 'dart:async';

import 'package:app_logger/app_logger.dart';
import 'package:dio/dio.dart';

import '../exceptions/api_exception.dart';
import '../models/enums.dart';
import 'api_client.dart';

class WeatherApiClient implements ApiClient {
  final Dio _dio;

  WeatherApiClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://api.weatherapi.com',
            contentType: Headers.jsonContentType,
            headers: {'accept': 'application/json'},
            connectTimeout: const Duration(seconds: 120),
            receiveTimeout: const Duration(seconds: 120),
            sendTimeout: const Duration(seconds: 120),
          ),
        );

  @override
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

  @override
  Future post(
    String path,
    Object? data, {
    bool extractData = true,
    Map<String, dynamic>? queryParameters,
  }) {
    throw UnimplementedError();
  }

  @override
  Future put(
    String path,
    Object? data, {
    bool extractData = true,
    Map<String, dynamic>? queryParameters,
  }) {
    throw UnimplementedError();
  }

  @override
  Future patch(
    String path,
    Object? data, {
    bool extractData = true,
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement patch
    throw UnimplementedError();
  }
}
