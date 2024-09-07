// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_summary_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VitalSummaryRequest _$VitalSummaryRequestFromJson(Map<String, dynamic> json) =>
    VitalSummaryRequest(
      personId: json['personId'] as String,
      patientId: json['patientId'] as String?,
    );

Map<String, dynamic> _$VitalSummaryRequestToJson(
        VitalSummaryRequest instance) =>
    <String, dynamic>{
      'personId': instance.personId,
      'patientId': instance.patientId,
    };
