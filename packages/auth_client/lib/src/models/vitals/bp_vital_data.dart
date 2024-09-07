import 'package:auth_client/auth_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'insights/bp_insights.dart';
import 'value_unit/bp_value_unit.dart';

part 'bp_vital_data.g.dart';

@JsonSerializable()
class BpVitalData extends Equatable {
  final BPValueUnit vitalData;
  final BPInterpretation interpretation;
  final BpInsights insights;

  const BpVitalData({
    required this.vitalData,
    required this.interpretation,
    required this.insights,
  });

  factory BpVitalData.fromJson(Map<String, dynamic> json) =>
      _$BpVitalDataFromJson(json);

  Map<String, dynamic> toJson() => _$BpVitalDataToJson(this);

  @override
  List<Object?> get props => [vitalData, interpretation, insights];
}
