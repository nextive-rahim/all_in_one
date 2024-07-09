import 'package:all_in_one/src/core/network/rest_client.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/utils/url_constant.dart';

class ProfileRepository {
  Future<dynamic> profile(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      UrlConstant.profile,
      data,
    );
    return res.data;
  }

  Future<dynamic> updateProfile(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      UrlConstant.profileUpdate,
      data,
    );
    return res.data;
  }

  Future<dynamic> uploadFile(Map<String, dynamic> data) async {
    final res = await RestClient().postFormData(
      APIType.PROTECTED,
      UrlConstant.fileUpload,
      data,
    );
    return res.data;
  }

  Future<dynamic> changePassword(Map<String, dynamic> data) async {
    final res = await RestClient().post(
      APIType.PROTECTED,
      UrlConstant.changePassword,
      data,
    );
    return res.data;
  }

  Future<dynamic> signOut() async {
    //TODO: Implement Sign out API
    CacheService().dispose();
  }
}
