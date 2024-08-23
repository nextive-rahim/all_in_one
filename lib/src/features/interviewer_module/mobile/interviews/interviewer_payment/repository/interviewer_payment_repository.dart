import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/network/rest_client.dart';

class InterviewsPaymentRepository {
  Future<dynamic> fetchInterviewerPayment(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.interviewerPayment,
      data,
    );
    return res.data;
  }
}
