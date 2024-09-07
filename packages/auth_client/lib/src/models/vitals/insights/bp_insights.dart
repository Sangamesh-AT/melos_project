import 'package:auth_client/auth_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../baseline/bp_baseline.dart';

part 'bp_insights.g.dart';

@JsonSerializable()
class BpInsights extends Equatable {
  final BpBaseline? baseline;
  final VitalInstruction instruction;

  const BpInsights({
    this.baseline,
    required this.instruction,
  });

  factory BpInsights.fromJson(Map<String, dynamic> json) =>
      _$BpInsightsFromJson(json);

  Map<String, dynamic> toJson() => _$BpInsightsToJson(this);

  @override
  List<Object?> get props => [baseline, instruction];
}
