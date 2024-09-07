import 'package:auth_client/auth_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../baseline/vital_baseline.dart';

part 'vital_insights.g.dart';

@JsonSerializable()
class VitalInsights extends Equatable {
  final VitalBaseline? baseline;
  final VitalInstruction instruction;

  const VitalInsights({
    this.baseline,
    required this.instruction,
  });

  factory VitalInsights.fromJson(Map<String, dynamic> json) =>
      _$VitalInsightsFromJson(json);

  Map<String, dynamic> toJson() => _$VitalInsightsToJson(this);

  @override
  List<Object?> get props => [baseline, instruction];
}
