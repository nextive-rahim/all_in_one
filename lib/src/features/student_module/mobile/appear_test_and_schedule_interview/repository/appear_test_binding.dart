import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/network/rest_client.dart';

class AppearTestRepository {
  Future<dynamic> fetchExamLink(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.listExamLinkUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> submitResultLink(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.userExamResultStoreUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> interviewRequest(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.userApplyInterviewUrl,
      data,
    );
    return res.data;
  }
}
