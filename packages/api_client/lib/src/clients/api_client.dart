abstract class ApiClient {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool extractData = true,
  });

  Future<dynamic> post(
    String path,
    Object? data, {
    bool extractData = true,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> put(
    String path,
    Object? data, {
    bool extractData = true,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> patch(
    String path,
    Object? data, {
    bool extractData = true,
    Map<String, dynamic>? queryParameters,
  });
}
