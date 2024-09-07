// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'double_value_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoubleValueUnit _$DoubleValueUnitFromJson(Map<String, dynamic> json) =>
    DoubleValueUnit(
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$DoubleValueUnitToJson(DoubleValueUnit instance) =>
    <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };
