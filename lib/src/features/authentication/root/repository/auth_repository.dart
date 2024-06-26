import 'package:all_in_one/src/core/network/rest_client.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/utils/url_constant.dart';

class AuthenticationRepository {
  Future<dynamic> login(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PUBLIC,
      UrlConstant.loginUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> registration(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PUBLIC,
      UrlConstant.registrationUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> forgetPassword(Map<String, dynamic> data) async {
    final res = await RestClient().post(
      APIType.PUBLIC,
      UrlConstant.forgetPassword,
      data,
    );
    return res.data;
  }

  Future<dynamic> forgetPasswordEmail(Map<String, dynamic> data) async {
    final res = await RestClient().post(
      APIType.PUBLIC,
      UrlConstant.forgetPasswordEmail,
      data,
    );
    return res.data;
  }

  Future<dynamic> otpVerification(Map<String, dynamic> data) async {
    final res = await RestClient().post(
      APIType.PUBLIC,
      UrlConstant.otpVerification,
      data,
    );
    return res.data;
  }

  Future<dynamic> resentOtpForVerifyMail(Map<String, dynamic> data) async {
    final res = await RestClient().post(
      APIType.PUBLIC,
      UrlConstant.resendOtpForVerifyEmail,
      data,
    );
    return res.data;
  }

  Future<dynamic> signOut() async {
    //TODO: Implement Sign out API
    CacheService().dispose();
  }
}
