import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/network/rest_client.dart';

class InterviewsRepository {
  Future<dynamic> fetchAllInterviews() async {
    final res = await RestClient.dev().get(
      APIType.PROTECTED,
      API.viewInterviewUrl,
    );
    return res.data;
  }

  Future<dynamic> submitInterviewFeedback(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.interviewFeedPost,
      data,
    );
    return res.data;
  }

  Future<dynamic> completeInterview(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.completeInterview,
      data,
    );
    return res.data;
  }
}
