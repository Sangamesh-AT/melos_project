import 'package:api_client/src/core/ahc_http_client.dart';

class WeatherApiClient {
  final AhcHttpClient _httpClient;

  WeatherApiClient(String baseUrl, {List<String>? gzipUrls})
      : _httpClient = AhcHttpClient(
          baseUrl,
          gzipUrls: gzipUrls,
          headers: {'accept': 'application/json'},
        );

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
}
