// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_value_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BPValueUnit _$BPValueUnitFromJson(Map<String, dynamic> json) => BPValueUnit(
      diastolic:
          IntValueUnit.fromJson(json['diastolic'] as Map<String, dynamic>),
      systolic: IntValueUnit.fromJson(json['systolic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BPValueUnitToJson(BPValueUnit instance) =>
    <String, dynamic>{
      'diastolic': instance.diastolic.toJson(),
      'systolic': instance.systolic.toJson(),
    };
