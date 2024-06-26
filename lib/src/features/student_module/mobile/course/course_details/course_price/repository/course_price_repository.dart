import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/network/rest_client.dart';

class CoursePriceRepository {
  Future<dynamic> coursePrice(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.coursePriceUrl,
      data,
    );
    return res.data;
  }
}
