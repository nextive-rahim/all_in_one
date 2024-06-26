import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/network/rest_client.dart';

class StudentHomeRepository {
  Future<dynamic> fetchStudentDashboard() async {
    final res = await RestClient.dev().get(
      APIType.PROTECTED,
      API.dashboardUrl,
    );
    return res.data;
  }

  Future<dynamic> allCourses() async {
    final res = await RestClient.dev().get(
      APIType.PROTECTED,
      API.viewAllCourse,
    );
    return res.data;
  }
}
