import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/network/rest_client.dart';

class NotificationRepository {
  Future<dynamic> fetchNotification() async {
    final res = await RestClient.dev().get(
      APIType.PROTECTED,
      API.viewNotification,
    );
    return res.data;
  }

  Future<dynamic> sendNotification(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.sendNotification,
      data,
    );
    return res.data;
  }
}
