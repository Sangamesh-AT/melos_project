// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rr_vital_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RrVitalData _$RrVitalDataFromJson(Map<String, dynamic> json) => RrVitalData(
      vitalData:
          DoubleValueUnit.fromJson(json['vitalData'] as Map<String, dynamic>),
      interpretation:
          $enumDecode(_$RRInterpretationEnumMap, json['interpretation']),
      insights:
          VitalInsights.fromJson(json['insights'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RrVitalDataToJson(RrVitalData instance) =>
    <String, dynamic>{
      'vitalData': instance.vitalData.toJson(),
      'interpretation': _$RRInterpretationEnumMap[instance.interpretation]!,
      'insights': instance.insights.toJson(),
    };

const _$RRInterpretationEnumMap = {
  RRInterpretation.veryHigh: 'very-high',
  RRInterpretation.high: 'high',
  RRInterpretation.normal: 'normal',
  RRInterpretation.low: 'low',
  RRInterpretation.veryLow: 'very-low',
};
