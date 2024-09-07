import 'package:auth_client/auth_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'insights/vital_insights.dart';
import 'value_unit/double_value_unit.dart';

part 'rr_vital_data.g.dart';

@JsonSerializable()
class RrVitalData extends Equatable {
  final DoubleValueUnit vitalData;
  final RRInterpretation interpretation;
  final VitalInsights insights;

  const RrVitalData({
    required this.vitalData,
    required this.interpretation,
    required this.insights,
  });

  factory RrVitalData.fromJson(Map<String, dynamic> json) =>
      _$RrVitalDataFromJson(json);

  Map<String, dynamic> toJson() => _$RrVitalDataToJson(this);

  @override
  List<Object?> get props => [vitalData, interpretation, insights];
}
