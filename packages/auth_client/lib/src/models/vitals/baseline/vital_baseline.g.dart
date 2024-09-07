// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_baseline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VitalBaseline _$VitalBaselineFromJson(Map<String, dynamic> json) =>
    VitalBaseline(
      unit: json['unit'] as String?,
      range: json['range'] == null
          ? null
          : Range.fromJson(json['range'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VitalBaselineToJson(VitalBaseline instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'range': instance.range?.toJson(),
    };
