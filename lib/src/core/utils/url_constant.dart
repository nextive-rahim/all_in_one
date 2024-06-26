class UrlConstant {
  static const String baseUrl = 'http://13.233.141.65:3000/api/';
  static const String registrationUrl = '${baseUrl}user-registration';
  static const String loginUrl = '${baseUrl}login';
  static const String forgetPassword = '${baseUrl}forgot-password';
  static const String forgetPasswordEmail = '${baseUrl}send-otp-to-mail';
  static const String otpVerification = '${baseUrl}verify-otp';
  static const String resendOtpForVerifyEmail = '${baseUrl}re-send-verify-link';

  static const String profile = '${baseUrl}view-profile';
  static const String profileUpdate = '${baseUrl}update-profile';
  static const String fileUpload = '${baseUrl}file-upload';
  static const String changePassword = '${baseUrl}change-password';
}
