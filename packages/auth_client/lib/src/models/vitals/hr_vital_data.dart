import 'package:auth_client/auth_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'insights/vital_insights.dart';
import 'value_unit/double_value_unit.dart';

part 'hr_vital_data.g.dart';

@JsonSerializable()
class HrVitalData extends Equatable {
  final DoubleValueUnit vitalData;
  final HRInterpretation interpretation;
  final VitalInsights insights;

  const HrVitalData({
    required this.vitalData,
    required this.interpretation,
    required this.insights,
  });

  factory HrVitalData.fromJson(Map<String, dynamic> json) =>
      _$HrVitalDataFromJson(json);

  Map<String, dynamic> toJson() => _$HrVitalDataToJson(this);

  @override
  List<Object?> get props => [vitalData, interpretation, insights];
}
