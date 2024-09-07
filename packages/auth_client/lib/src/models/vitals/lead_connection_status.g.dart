// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_connection_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadConnectionStatus _$LeadConnectionStatusFromJson(
        Map<String, dynamic> json) =>
    LeadConnectionStatus(
      leftHand: json['leftHand'] as bool,
      rightHand: json['rightHand'] as bool,
      leftLeg: json['leftLeg'] as bool,
      rightLeg: json['rightLeg'] as bool,
    );

Map<String, dynamic> _$LeadConnectionStatusToJson(
        LeadConnectionStatus instance) =>
    <String, dynamic>{
      'leftHand': instance.leftHand,
      'rightHand': instance.rightHand,
      'leftLeg': instance.leftLeg,
      'rightLeg': instance.rightLeg,
    };
