import 'package:dio/dio.dart';

import '../helper/constants.dart';
import '../services/secure_storage.dart';

class TokenInterceptor extends InterceptorsWrapper {
  TokenInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await SecureStorage().read(
      SecureStorageKeys.accessToken,
    );
    if (await SecureStorage().read(SecureStorageKeys.accessToken) != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }
}
