
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'int_value_unit.dart';

part 'spo2_value_unit.g.dart';

@JsonSerializable()
class Spo2ValueUnit extends Equatable {
  final IntValueUnit spo2;

  const Spo2ValueUnit({
    required this.spo2,
  });

  factory Spo2ValueUnit.fromJson(Map<String, dynamic> json) =>
      _$Spo2ValueUnitFromJson(json);

  Map<String, dynamic> toJson() => _$Spo2ValueUnitToJson(this);

  @override
  List<Object?> get props => [spo2];
}