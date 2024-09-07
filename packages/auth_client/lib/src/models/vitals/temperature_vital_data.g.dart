// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_vital_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureVitalData _$TemperatureVitalDataFromJson(
        Map<String, dynamic> json) =>
    TemperatureVitalData(
      vitalData:
          DoubleValueUnit.fromJson(json['vitalData'] as Map<String, dynamic>),
      interpretation: $enumDecode(
          _$TemperatureInterpretationEnumMap, json['interpretation']),
      insights:
          VitalInsights.fromJson(json['insights'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemperatureVitalDataToJson(
        TemperatureVitalData instance) =>
    <String, dynamic>{
      'vitalData': instance.vitalData.toJson(),
      'interpretation':
          _$TemperatureInterpretationEnumMap[instance.interpretation]!,
      'insights': instance.insights.toJson(),
    };

const _$TemperatureInterpretationEnumMap = {
  TemperatureInterpretation.veryHigh: 'very-high',
  TemperatureInterpretation.high: 'high',
  TemperatureInterpretation.normal: 'normal',
  TemperatureInterpretation.low: 'low',
  TemperatureInterpretation.veryLow: 'very-low',
};
