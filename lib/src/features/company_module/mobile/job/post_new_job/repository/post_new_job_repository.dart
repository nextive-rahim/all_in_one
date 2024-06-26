import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/network/rest_client.dart';

class PostNewJobRepository {
  Future<dynamic> postNewJob(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.postJobByCompany,
      data,
    );
    return res.data;
  }
}
