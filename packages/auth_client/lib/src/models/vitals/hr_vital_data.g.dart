// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hr_vital_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HrVitalData _$HrVitalDataFromJson(Map<String, dynamic> json) => HrVitalData(
      vitalData:
          DoubleValueUnit.fromJson(json['vitalData'] as Map<String, dynamic>),
      interpretation:
          $enumDecode(_$HRInterpretationEnumMap, json['interpretation']),
      insights:
          VitalInsights.fromJson(json['insights'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HrVitalDataToJson(HrVitalData instance) =>
    <String, dynamic>{
      'vitalData': instance.vitalData.toJson(),
      'interpretation': _$HRInterpretationEnumMap[instance.interpretation]!,
      'insights': instance.insights.toJson(),
    };

const _$HRInterpretationEnumMap = {
  HRInterpretation.veryHigh: 'very-high',
  HRInterpretation.high: 'high',
  HRInterpretation.normal: 'normal',
  HRInterpretation.low: 'low',
  HRInterpretation.veryLow: 'very-low',
};
