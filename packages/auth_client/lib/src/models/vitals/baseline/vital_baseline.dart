import 'package:auth_client/auth_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vital_baseline.g.dart';

@JsonSerializable()
class VitalBaseline extends Equatable {
  final String? unit;
  final Range? range;

  const VitalBaseline({
    required this.unit,
    required this.range,
  });

  factory VitalBaseline.fromJson(Map<String, dynamic> json) =>
      _$VitalBaselineFromJson(json);

  Map<String, dynamic> toJson() => _$VitalBaselineToJson(this);

  @override
  List<Object?> get props => [unit, range];
}
