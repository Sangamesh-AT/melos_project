import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lead_connection_status.g.dart';

@JsonSerializable()
class LeadConnectionStatus extends Equatable {
  final bool leftHand;
  final bool rightHand;
  final bool leftLeg;
  final bool rightLeg;

  const LeadConnectionStatus({
    required this.leftHand,
    required this.rightHand,
    required this.leftLeg,
    required this.rightLeg,
  });

  factory LeadConnectionStatus.fromJson(Map<String, dynamic> json) =>
      _$LeadConnectionStatusFromJson(json);

  Map<String, dynamic> toJson() => _$LeadConnectionStatusToJson(this);

  @override
  List<Object?> get props => [leftHand, rightHand, leftLeg, rightLeg];
}
