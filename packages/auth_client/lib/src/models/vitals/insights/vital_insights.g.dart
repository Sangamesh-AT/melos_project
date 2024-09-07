// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_insights.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VitalInsights _$VitalInsightsFromJson(Map<String, dynamic> json) =>
    VitalInsights(
      baseline: json['baseline'] == null
          ? null
          : VitalBaseline.fromJson(json['baseline'] as Map<String, dynamic>),
      instruction: VitalInstruction.fromJson(
          json['instruction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VitalInsightsToJson(VitalInsights instance) =>
    <String, dynamic>{
      'baseline': instance.baseline?.toJson(),
      'instruction': instance.instruction.toJson(),
    };
