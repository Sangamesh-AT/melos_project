import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class GzipInterceptor extends InterceptorsWrapper {
  GzipInterceptor(this.gzipEndpoints);
  final List<String> gzipEndpoints;

  final GZipCodec gZipCodec = GZipCodec();

  bool _shouldCompress(String path) {
    return gzipEndpoints.any((endpoint) => path.contains(endpoint));
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_shouldCompress(options.path)) {
      final jsonData = jsonEncode(options.data);
      final compressedData = gZipCodec.encode(utf8.encode(jsonData));
      options.data = compressedData;
      options.headers['Content-Encoding'] = 'gzip';
      options.headers['Accept-Encoding'] = 'gzip';
      options.headers['Content-Type'] = 'application/json';
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
