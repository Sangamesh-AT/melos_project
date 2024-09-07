import 'package:auth_client/auth_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'insights/vital_insights.dart';

part 'ecg_vital_data.g.dart';

@JsonSerializable()
class EcgVitalData extends Equatable {
  final ECGInterpretation interpretation;
  final VitalInsights insights;

  const EcgVitalData({
    required this.interpretation,
    required this.insights,
  });

  factory EcgVitalData.fromJson(Map<String, dynamic> json) =>
      _$EcgVitalDataFromJson(json);

  Map<String, dynamic> toJson() => _$EcgVitalDataToJson(this);

  @override
  List<Object?> get props => [interpretation, insights];
}
