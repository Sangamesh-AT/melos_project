// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_vital_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BpVitalData _$BpVitalDataFromJson(Map<String, dynamic> json) => BpVitalData(
      vitalData:
          BPValueUnit.fromJson(json['vitalData'] as Map<String, dynamic>),
      interpretation:
          $enumDecode(_$BPInterpretationEnumMap, json['interpretation']),
      insights: BpInsights.fromJson(json['insights'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BpVitalDataToJson(BpVitalData instance) =>
    <String, dynamic>{
      'vitalData': instance.vitalData.toJson(),
      'interpretation': _$BPInterpretationEnumMap[instance.interpretation]!,
      'insights': instance.insights.toJson(),
    };

const _$BPInterpretationEnumMap = {
  BPInterpretation.veryHigh: 'very-high',
  BPInterpretation.high: 'high',
  BPInterpretation.normal: 'normal',
  BPInterpretation.low: 'low',
  BPInterpretation.veryLow: 'very-low',
};
