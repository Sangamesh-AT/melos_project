import 'package:api_client/api_client.dart';
import 'package:auth_client/src/helper/api_constant.dart';
import 'package:auth_client/src/models/vital_summary_req.dart';
import 'package:auth_client/src/models/vital_summary_res.dart';

class AuthClient {
  final ApiClient _apiClient;

  AuthClient(String baseUrl, {List<String>? gzipUrls})
      : _apiClient = ApiClient(baseUrl, gzipUrls: gzipUrls);

  Future<VitalSummaryResponse> fetchVitalSummaryData(
    VitalSummaryRequest data,
  ) async {
    final response = await _apiClient.post(
      ApiConstant.getVitalsSummary,
      data.toJson(),
    );

    return VitalSummaryResponse.fromJson(response);
  }
}
