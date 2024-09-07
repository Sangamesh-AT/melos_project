import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'int_value_unit.g.dart';

@JsonSerializable()
class IntValueUnit extends Equatable {
  final int value;
  final String? unit;

  const IntValueUnit({
    required this.value,
    this.unit,
  });

  factory IntValueUnit.fromJson(Map<String, dynamic> json) =>
      _$IntValueUnitFromJson(json);

  Map<String, dynamic> toJson() => _$IntValueUnitToJson(this);

  @override
  List<Object?> get props => [value, unit];
}