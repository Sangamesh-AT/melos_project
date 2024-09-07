import 'dart:async';

import 'package:api_client/src/core/ahc_http_client.dart';

class ApiClient {
  final AhcHttpClient _httpClient;

  ApiClient(String baseUrl, List<String> gzipUrls)
      : _httpClient = AhcHttpClient(baseUrl, gzipUrls);

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool extractData = true,
  }) async {
    return await _httpClient.get(
      path,
      queryParameters: queryParameters,
      extractData: extractData,
    );
  }

  Future<dynamic> post(
    String path,
    Object? data, {
    bool extractData = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _httpClient.post(
      path,
      data,
      extractData: extractData,
      queryParameters: queryParameters,
    );
  }

  Future<dynamic> put(
    String path,
    Object? data, {
    bool extractData = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _httpClient.put(
      path,
      data,
      extractData: extractData,
      queryParameters: queryParameters,
    );
  }

  Future<dynamic> patch(
    String path,
    Object? data, {
    bool extractData = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _httpClient.patch(
      path,
      data,
      extractData: extractData,
      queryParameters: queryParameters,
    );
  }
}
