import 'package:auth_client/auth_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'insights/vital_insights.dart';
import 'value_unit/double_value_unit.dart';

part 'temperature_vital_data.g.dart';

@JsonSerializable()
class TemperatureVitalData extends Equatable {
  final DoubleValueUnit vitalData;
  final TemperatureInterpretation interpretation;
  final VitalInsights insights;

  const TemperatureVitalData({
    required this.vitalData,
    required this.interpretation,
    required this.insights,
  });

  factory TemperatureVitalData.fromJson(Map<String, dynamic> json) =>
      _$TemperatureVitalDataFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureVitalDataToJson(this);

  @override
  List<Object?> get props => [vitalData, interpretation, insights];
}
