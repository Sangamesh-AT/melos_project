// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spo2_vital_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spo2VitalData _$Spo2VitalDataFromJson(Map<String, dynamic> json) =>
    Spo2VitalData(
      vitalData:
          DoubleValueUnit.fromJson(json['vitalData'] as Map<String, dynamic>),
      interpretation:
          $enumDecode(_$SPO2InterpretationEnumMap, json['interpretation']),
      insights:
          VitalInsights.fromJson(json['insights'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Spo2VitalDataToJson(Spo2VitalData instance) =>
    <String, dynamic>{
      'vitalData': instance.vitalData.toJson(),
      'interpretation': _$SPO2InterpretationEnumMap[instance.interpretation]!,
      'insights': instance.insights.toJson(),
    };

const _$SPO2InterpretationEnumMap = {
  SPO2Interpretation.normal: 'normal',
  SPO2Interpretation.low: 'low',
  SPO2Interpretation.veryLow: 'very-low',
};
