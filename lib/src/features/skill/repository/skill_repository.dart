import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/network/rest_client.dart';
import 'package:all_in_one/src/core/utils/url_constant.dart';

class SkillRepository {
  Future<dynamic> skills() async {
    final res = await RestClient.dev().get(
      APIType.PUBLIC,
      API.skill,
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
}
