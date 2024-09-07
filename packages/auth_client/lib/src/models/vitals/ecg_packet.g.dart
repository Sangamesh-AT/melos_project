// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecg_packet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcgPacket _$EcgPacketFromJson(Map<String, dynamic> json) => EcgPacket(
      sequence: json['sequence'] as int,
      status: json['status'] as String,
      leadStatus: LeadConnectionStatus.fromJson(
          json['leadStatus'] as Map<String, dynamic>),
      hr: json['hr'] as int,
      rr: json['rr'] as int,
      arrhythmia: json['arrhythmia'] as String,
      channel1:
          (json['channel1'] as List<dynamic>).map((e) => e as int).toList(),
      channel2:
          (json['channel2'] as List<dynamic>).map((e) => e as int).toList(),
      rrData: (json['rrData'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$EcgPacketToJson(EcgPacket instance) => <String, dynamic>{
      'sequence': instance.sequence,
      'status': instance.status,
      'leadStatus': instance.leadStatus.toJson(),
      'hr': instance.hr,
      'rr': instance.rr,
      'arrhythmia': instance.arrhythmia,
      'channel1': instance.channel1,
      'channel2': instance.channel2,
      'rrData': instance.rrData,
    };
