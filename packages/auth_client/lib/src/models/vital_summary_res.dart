import 'package:auth_client/src/models/double_value_unit.dart';
import 'package:auth_client/src/models/vitals/bp_vital_data.dart';
import 'package:auth_client/src/models/vitals/ecg_packet.dart';
import 'package:auth_client/src/models/vitals/hr_vital_data.dart';
import 'package:auth_client/src/models/vitals/rr_vital_data.dart';
import 'package:auth_client/src/models/vitals/spo2_vital_data.dart';
import 'package:auth_client/src/models/vitals/temperature_vital_data.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'vital_summary_res.g.dart';

@JsonSerializable()
class VitalSummaryResponse extends Equatable {
  final Summary summary;

  const VitalSummaryResponse({
    required this.summary,
  });

  factory VitalSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$VitalSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VitalSummaryResponseToJson(this);

  @override
  List<Object?> get props => [summary];
}

@JsonSerializable()
class VitalDetails extends Equatable {
  final DoubleValueUnit? weight;
  final DoubleValueUnit? height;
  final DoubleValueUnit? bmi;

  const VitalDetails({
    required this.weight,
    required this.height,
    required this.bmi,
  });

  factory VitalDetails.fromJson(Map<String, dynamic> json) =>
      _$VitalDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$VitalDetailsToJson(this);

  @override
  List<Object?> get props => [weight, height, bmi];
}

@JsonSerializable()
class Summary extends Equatable {
  final VitalsInterpretation interpretation;
  final VitalsData vitalsData;

  const Summary({
    required this.interpretation,
    required this.vitalsData,
  });

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryToJson(this);

  @override
  List<Object?> get props => [interpretation, vitalsData];
}

@JsonSerializable()
class VitalsData extends Equatable {
  final BpVitalData? bp;
  final HrVitalData? hr;
  final RrVitalData? rr;
  final Spo2VitalData? spo2;
  final EcgVitalData? ecg;
  final TemperatureVitalData? temperature;
  final VitalData? weight;
  final VitalData? height;
  final VitalData? bmi;

  const VitalsData({
    required this.bp,
    required this.hr,
    required this.rr,
    required this.spo2,
    required this.ecg,
    required this.temperature,
    required this.weight,
    required this.height,
    required this.bmi,
  });

  factory VitalsData.fromJson(Map<String, dynamic> json) =>
      _$VitalsDataFromJson(json);

  Map<String, dynamic> toJson() => _$VitalsDataToJson(this);

  @override
  List<Object?> get props =>
      [bp, hr, rr, spo2, ecg, temperature, weight, height, bmi];
}

@JsonSerializable()
class VitalData extends Equatable {
  final ValueUnit vitalData;
  final String? interpretation;
  final Insights? insights;

  const VitalData({
    required this.vitalData,
    required this.interpretation,
    this.insights,
  });

  factory VitalData.fromJson(Map<String, dynamic> json) =>
      _$VitalDataFromJson(json);

  Map<String, dynamic> toJson() => _$VitalDataToJson(this);

  @override
  List<Object?> get props => [vitalData, interpretation, insights];
}

@JsonSerializable()
class EcgVitalData extends Equatable {
  final List<EcgPacket>? ecgPackets;
  final ECGInterpretation interpretation;
  final Insights? insights;

  const EcgVitalData({
    required this.ecgPackets,
    required this.interpretation,
    this.insights,
  });

  factory EcgVitalData.fromJson(Map<String, dynamic> json) =>
      _$EcgVitalDataFromJson(json);

  Map<String, dynamic> toJson() => _$EcgVitalDataToJson(this);

  @override
  List<Object?> get props => [ecgPackets, interpretation, insights];
}

@JsonSerializable()
class ValueUnit extends Equatable {
  final dynamic value;
  final String unit;

  const ValueUnit({
    required this.value,
    required this.unit,
  });

  factory ValueUnit.fromJson(Map<String, dynamic> json) =>
      _$ValueUnitFromJson(json);

  Map<String, dynamic> toJson() => _$ValueUnitToJson(this);

  @override
  List<Object?> get props => [value, unit];
}

@JsonSerializable()
class Insights extends Equatable {
  final Baseline? baseline;
  final VitalInstruction? instruction;

  const Insights({
    this.baseline,
    this.instruction,
  });

  factory Insights.fromJson(Map<String, dynamic> json) =>
      _$InsightsFromJson(json);

  Map<String, dynamic> toJson() => _$InsightsToJson(this);

  @override
  List<Object?> get props => [baseline, instruction];
}

@JsonSerializable()
class Baseline extends Equatable {
  final String unit;
  final Range range;
  final Range excessiveRange;

  const Baseline({
    required this.unit,
    required this.range,
    required this.excessiveRange,
  });

  factory Baseline.fromJson(Map<String, dynamic> json) =>
      _$BaselineFromJson(json);

  Map<String, dynamic> toJson() => _$BaselineToJson(this);

  @override
  List<Object?> get props => [unit, range, excessiveRange];
}

@JsonSerializable()
class Range extends Equatable {
  final double low;
  final double high;

  const Range({
    required this.low,
    required this.high,
  });

  factory Range.fromJson(Map<String, dynamic> json) => _$RangeFromJson(json);

  Map<String, dynamic> toJson() => _$RangeToJson(this);

  @override
  List<Object?> get props => [low, high];
}

@JsonSerializable()
class VitalInstruction extends Equatable {
  final List<String>? list;
  final String text;

  const VitalInstruction({
    this.list,
    required this.text,
  });

  factory VitalInstruction.fromJson(Map<String, dynamic> json) =>
      _$VitalInstructionFromJson(json);

  Map<String, dynamic> toJson() => _$VitalInstructionToJson(this);

  @override
  List<Object?> get props => [list, text];
}
