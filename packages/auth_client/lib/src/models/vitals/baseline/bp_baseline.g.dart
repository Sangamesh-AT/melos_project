// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_baseline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BpBaseline _$BpBaselineFromJson(Map<String, dynamic> json) => BpBaseline(
      systolic: json['systolic'] == null
          ? null
          : VitalBaseline.fromJson(json['systolic'] as Map<String, dynamic>),
      diastolic: json['diastolic'] == null
          ? null
          : VitalBaseline.fromJson(json['diastolic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BpBaselineToJson(BpBaseline instance) =>
    <String, dynamic>{
      'systolic': instance.systolic?.toJson(),
      'diastolic': instance.diastolic?.toJson(),
    };
