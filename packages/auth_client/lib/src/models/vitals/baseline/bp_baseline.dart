import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'vital_baseline.dart';

part 'bp_baseline.g.dart';

@JsonSerializable()
class BpBaseline extends Equatable {
  final VitalBaseline? systolic;
  final VitalBaseline? diastolic;

  const BpBaseline({
    this.systolic,
    this.diastolic,
  });

  factory BpBaseline.fromJson(Map<String, dynamic> json) =>
      _$BpBaselineFromJson(json);

  Map<String, dynamic> toJson() => _$BpBaselineToJson(this);

  @override
  List<Object?> get props => [systolic, diastolic];
}
