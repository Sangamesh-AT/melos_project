import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'double_value_unit.g.dart';

@JsonSerializable()
class DoubleValueUnit extends Equatable {
  final double value;
  final String? unit;

  const DoubleValueUnit({
    required this.value,
    this.unit,
  });

  factory DoubleValueUnit.fromJson(Map<String, dynamic> json) =>
      _$DoubleValueUnitFromJson(json);

  Map<String, dynamic> toJson() => _$DoubleValueUnitToJson(this);

  @override
  List<Object?> get props => [value, unit];
}
