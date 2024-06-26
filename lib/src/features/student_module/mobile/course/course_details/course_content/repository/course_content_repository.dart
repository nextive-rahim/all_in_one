import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/network/rest_client.dart';

class StudentCourseContentRepository {
  Future<dynamic> fetchStudentCorseContents(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.viewCourseContentUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> isWatchVideo(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.watchVideoUrl,
      data,
    );
    return res.data;
  }
}
