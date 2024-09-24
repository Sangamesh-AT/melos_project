import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response.g.dart';

@JsonSerializable()
class RefreshTokenResponse extends Equatable {
  final String accessToken;
  final String refreshToken;
  @JsonKey(name: 'expires_at')
  final String expiresAt;

  const RefreshTokenResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);

  @override
  List<Object?> get props => [accessToken, refreshToken, expiresAt];
}
