// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_insights.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BpInsights _$BpInsightsFromJson(Map<String, dynamic> json) => BpInsights(
      baseline: json['baseline'] == null
          ? null
          : BpBaseline.fromJson(json['baseline'] as Map<String, dynamic>),
      instruction: VitalInstruction.fromJson(
          json['instruction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BpInsightsToJson(BpInsights instance) =>
    <String, dynamic>{
      'baseline': instance.baseline?.toJson(),
      'instruction': instance.instruction.toJson(),
    };
