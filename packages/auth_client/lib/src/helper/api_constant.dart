class ApiConstant {
  static const String baseUrl = String.fromEnvironment('BASE_URL');
  static const String weatherBaseUrl = 'https://api.weatherapi.com';

  // Version
  static const String _versionOne = '/v1';

  // Gzip Endpoints
  static const List<String> gzipEndpoints = [
    observation,
  ];

  // Microservices
  static const String _authService = '$_versionOne/auth';

  static const String getNewLivenessSessionId =
      '$_authService/face/liveness/session/new';
  static const String post = '/posts';
  static const String registerFace = '$_authService/register/face';
  static const String loginFace = '$_authService/login/face';
  static const String signUp = '$_authService/signup';
  static const String signupVerify = '$_authService/signup/verify';
  static const String loginFinger = '$_authService/login/finger';
  static const String getVitalsSummary = '$_versionOne/vital/summary/latest';
  static const String observation = '$_versionOne/observation';
  static const String encounter = '$_versionOne/encounter';
  static const String weather = '$_versionOne/current.json';
  static const String appointmentRequest = '$_versionOne/Appointment';
  static const String fetchCallToken = '$_versionOne/webrtc/agora/getToken';
  static const String sendSignInOtpRequest = '$_versionOne/mfa/send';
  static const String verifySignInOtpRequest = '$_versionOne/auth/login/mobile';
}
