import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'int_value_unit.dart';

part 'bp_value_unit.g.dart';

@JsonSerializable()
class BPValueUnit extends Equatable {
  final IntValueUnit diastolic;
  final IntValueUnit systolic;

  const BPValueUnit({
    required this.diastolic,
    required this.systolic,
  });

  factory BPValueUnit.fromJson(Map<String, dynamic> json) =>
      _$BPValueUnitFromJson(json);

  Map<String, dynamic> toJson() => _$BPValueUnitToJson(this);

  @override
  List<Object?> get props => [diastolic, systolic];
}
