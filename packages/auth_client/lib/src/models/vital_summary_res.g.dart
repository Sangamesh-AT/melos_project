// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_summary_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VitalSummaryResponse _$VitalSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    VitalSummaryResponse(
      summary: Summary.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VitalSummaryResponseToJson(
        VitalSummaryResponse instance) =>
    <String, dynamic>{
      'summary': instance.summary.toJson(),
    };

VitalDetails _$VitalDetailsFromJson(Map<String, dynamic> json) => VitalDetails(
      weight: json['weight'] == null
          ? null
          : DoubleValueUnit.fromJson(json['weight'] as Map<String, dynamic>),
      height: json['height'] == null
          ? null
          : DoubleValueUnit.fromJson(json['height'] as Map<String, dynamic>),
      bmi: json['bmi'] == null
          ? null
          : DoubleValueUnit.fromJson(json['bmi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VitalDetailsToJson(VitalDetails instance) =>
    <String, dynamic>{
      'weight': instance.weight?.toJson(),
      'height': instance.height?.toJson(),
      'bmi': instance.bmi?.toJson(),
    };

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
      interpretation:
          $enumDecode(_$VitalsInterpretationEnumMap, json['interpretation']),
      vitalsData:
          VitalsData.fromJson(json['vitalsData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
      'interpretation': _$VitalsInterpretationEnumMap[instance.interpretation]!,
      'vitalsData': instance.vitalsData.toJson(),
    };

const _$VitalsInterpretationEnumMap = {
  VitalsInterpretation.normal: 'normal',
  VitalsInterpretation.abnormal: 'abnormal',
};

VitalsData _$VitalsDataFromJson(Map<String, dynamic> json) => VitalsData(
      bp: json['bp'] == null
          ? null
          : BpVitalData.fromJson(json['bp'] as Map<String, dynamic>),
      hr: json['hr'] == null
          ? null
          : HrVitalData.fromJson(json['hr'] as Map<String, dynamic>),
      rr: json['rr'] == null
          ? null
          : RrVitalData.fromJson(json['rr'] as Map<String, dynamic>),
      spo2: json['spo2'] == null
          ? null
          : Spo2VitalData.fromJson(json['spo2'] as Map<String, dynamic>),
      ecg: json['ecg'] == null
          ? null
          : EcgVitalData.fromJson(json['ecg'] as Map<String, dynamic>),
      temperature: json['temperature'] == null
          ? null
          : TemperatureVitalData.fromJson(
              json['temperature'] as Map<String, dynamic>),
      weight: json['weight'] == null
          ? null
          : VitalData.fromJson(json['weight'] as Map<String, dynamic>),
      height: json['height'] == null
          ? null
          : VitalData.fromJson(json['height'] as Map<String, dynamic>),
      bmi: json['bmi'] == null
          ? null
          : VitalData.fromJson(json['bmi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VitalsDataToJson(VitalsData instance) =>
    <String, dynamic>{
      'bp': instance.bp?.toJson(),
      'hr': instance.hr?.toJson(),
      'rr': instance.rr?.toJson(),
      'spo2': instance.spo2?.toJson(),
      'ecg': instance.ecg?.toJson(),
      'temperature': instance.temperature?.toJson(),
      'weight': instance.weight?.toJson(),
      'height': instance.height?.toJson(),
      'bmi': instance.bmi?.toJson(),
    };

VitalData _$VitalDataFromJson(Map<String, dynamic> json) => VitalData(
      vitalData: ValueUnit.fromJson(json['vitalData'] as Map<String, dynamic>),
      interpretation: json['interpretation'] as String?,
      insights: json['insights'] == null
          ? null
          : Insights.fromJson(json['insights'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VitalDataToJson(VitalData instance) => <String, dynamic>{
      'vitalData': instance.vitalData.toJson(),
      'interpretation': instance.interpretation,
      'insights': instance.insights?.toJson(),
    };

EcgVitalData _$EcgVitalDataFromJson(Map<String, dynamic> json) => EcgVitalData(
      ecgPackets: (json['ecgPackets'] as List<dynamic>?)
          ?.map((e) => EcgPacket.fromJson(e as Map<String, dynamic>))
          .toList(),
      interpretation:
          $enumDecode(_$ECGInterpretationEnumMap, json['interpretation']),
      insights: json['insights'] == null
          ? null
          : Insights.fromJson(json['insights'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EcgVitalDataToJson(EcgVitalData instance) =>
    <String, dynamic>{
      'ecgPackets': instance.ecgPackets?.map((e) => e.toJson()).toList(),
      'interpretation': _$ECGInterpretationEnumMap[instance.interpretation]!,
      'insights': instance.insights?.toJson(),
    };

const _$ECGInterpretationEnumMap = {
  ECGInterpretation.normal: 'normal',
  ECGInterpretation.abnormal: 'abnormal',
  ECGInterpretation.irregular: 'irregular',
};

ValueUnit _$ValueUnitFromJson(Map<String, dynamic> json) => ValueUnit(
      value: json['value'],
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$ValueUnitToJson(ValueUnit instance) => <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };

Insights _$InsightsFromJson(Map<String, dynamic> json) => Insights(
      baseline: json['baseline'] == null
          ? null
          : Baseline.fromJson(json['baseline'] as Map<String, dynamic>),
      instruction: json['instruction'] == null
          ? null
          : VitalInstruction.fromJson(
              json['instruction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InsightsToJson(Insights instance) => <String, dynamic>{
      'baseline': instance.baseline?.toJson(),
      'instruction': instance.instruction?.toJson(),
    };

Baseline _$BaselineFromJson(Map<String, dynamic> json) => Baseline(
      unit: json['unit'] as String,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      excessiveRange:
          Range.fromJson(json['excessiveRange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaselineToJson(Baseline instance) => <String, dynamic>{
      'unit': instance.unit,
      'range': instance.range.toJson(),
      'excessiveRange': instance.excessiveRange.toJson(),
    };

Range _$RangeFromJson(Map<String, dynamic> json) => Range(
      low: (json['low'] as num).toDouble(),
      high: (json['high'] as num).toDouble(),
    );

Map<String, dynamic> _$RangeToJson(Range instance) => <String, dynamic>{
      'low': instance.low,
      'high': instance.high,
    };

VitalInstruction _$VitalInstructionFromJson(Map<String, dynamic> json) =>
    VitalInstruction(
      list: (json['list'] as List<dynamic>?)?.map((e) => e as String).toList(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$VitalInstructionToJson(VitalInstruction instance) =>
    <String, dynamic>{
      'list': instance.list,
      'text': instance.text,
    };
