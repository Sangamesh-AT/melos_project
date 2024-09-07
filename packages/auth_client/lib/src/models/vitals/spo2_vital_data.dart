import 'package:auth_client/auth_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'insights/vital_insights.dart';
import 'value_unit/double_value_unit.dart';

part 'spo2_vital_data.g.dart';

@JsonSerializable()
class Spo2VitalData extends Equatable {
  final DoubleValueUnit vitalData;
  final SPO2Interpretation interpretation;
  final VitalInsights insights;

  const Spo2VitalData({
    required this.vitalData,
    required this.interpretation,
    required this.insights,
  });

  factory Spo2VitalData.fromJson(Map<String, dynamic> json) =>
      _$Spo2VitalDataFromJson(json);

  Map<String, dynamic> toJson() => _$Spo2VitalDataToJson(this);

  @override
  List<Object?> get props => [vitalData, interpretation, insights];
}
