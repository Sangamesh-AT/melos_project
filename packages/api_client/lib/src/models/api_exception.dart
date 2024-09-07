import 'package:api_client/src/models/enums.dart';
import 'package:equatable/equatable.dart';

class ApiException extends Equatable implements Exception {
  final int? code;
  final String? message;
  final String? path;
  final ApiMethod? method;
  final Object? requestData;
  final Map<String, dynamic>? queryParams;

  const ApiException({
    this.code,
    this.message,
    this.path,
    this.method,
    this.requestData,
    this.queryParams,
  });

  @override
  String toString() =>
      'ApiException(code: $code, message: $message), path: $path, method: ${method?.value}, requestData: $requestData, queryParams: $queryParams';

  @override
  List<Object?> get props => [
        code,
        message,
        path,
        method,
        requestData,
        queryParams,
      ];
}
