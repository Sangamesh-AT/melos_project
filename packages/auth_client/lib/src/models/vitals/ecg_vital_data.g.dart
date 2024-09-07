// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecg_vital_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcgVitalData _$EcgVitalDataFromJson(Map<String, dynamic> json) => EcgVitalData(
      interpretation:
          $enumDecode(_$ECGInterpretationEnumMap, json['interpretation']),
      insights:
          VitalInsights.fromJson(json['insights'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EcgVitalDataToJson(EcgVitalData instance) =>
    <String, dynamic>{
      'interpretation': _$ECGInterpretationEnumMap[instance.interpretation]!,
      'insights': instance.insights.toJson(),
    };

const _$ECGInterpretationEnumMap = {
  ECGInterpretation.normal: 'normal',
  ECGInterpretation.abnormal: 'abnormal',
  ECGInterpretation.irregular: 'irregular',
};
