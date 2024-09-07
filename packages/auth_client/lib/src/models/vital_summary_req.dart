import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vital_summary_req.g.dart';

@JsonSerializable()
class VitalSummaryRequest extends Equatable {
  final String personId;
  final String? patientId;

  const VitalSummaryRequest({required this.personId, this.patientId});

  factory VitalSummaryRequest.fromJson(Map<String, dynamic> json) =>
      _$VitalSummaryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VitalSummaryRequestToJson(this);

  @override
  List<Object?> get props => [personId, patientId];
}
