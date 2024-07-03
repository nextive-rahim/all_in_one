import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/network/rest_client.dart';
import 'package:all_in_one/src/core/utils/url_constant.dart';

class CompanyProfileUpdate {
  Future<dynamic> companyProfileUpdate(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.profileUpdateUrl,
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
}
