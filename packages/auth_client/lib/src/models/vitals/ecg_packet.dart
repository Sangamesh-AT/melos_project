import 'package:auth_client/src/models/vitals/lead_connection_status.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ecg_packet.g.dart';

@JsonSerializable()
class EcgPacket extends Equatable {
  final int sequence;
  final String status;
  final LeadConnectionStatus leadStatus;
  final int hr;
  final int rr;
  final String arrhythmia;
  final List<int> channel1;
  final List<int> channel2;
  final List<int> rrData;

  const EcgPacket({
    required this.sequence,
    required this.status,
    required this.leadStatus,
    required this.hr,
    required this.rr,
    required this.arrhythmia,
    required this.channel1,
    required this.channel2,
    required this.rrData,
  });

  factory EcgPacket.fromJson(Map<String, dynamic> json) =>
      _$EcgPacketFromJson(json);

  Map<String, dynamic> toJson() => _$EcgPacketToJson(this);

  @override
  List<Object?> get props => [
        sequence,
        status,
        leadStatus,
        hr,
        rr,
        arrhythmia,
        channel1,
        channel2,
        rrData
      ];
}
