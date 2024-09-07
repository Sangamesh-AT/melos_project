import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_type.g.dart';

@JsonSerializable()
class RequestType extends Equatable {
  const RequestType({required this.mock});

  final bool mock;

  @override
  List<Object> get props => [mock];

  factory RequestType.fromJson(Map<String, dynamic> json) =>
      _$RequestTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTypeToJson(this);
}
