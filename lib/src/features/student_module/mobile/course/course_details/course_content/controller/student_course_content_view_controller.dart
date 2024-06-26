import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/model/student_course_content_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/repository/course_content_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class StudentCourseContentViewController extends GetxController {
  final StudentCourseContentRepository _repository =
      StudentCourseContentRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  late ViewCourseContentResponseData contentResponse;
  RxList<ContentTittle> contentTileList = <ContentTittle>[].obs;
  Future<void> getCourseContents(int courseId, int lavelId) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      "course_id": courseId,
      "level_id": lavelId,
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.fetchStudentCorseContents(requestBody);
      contentResponse = ViewCourseContentResponseData.fromJson(res);

      contentTileList.value = contentResponse.data ?? [];
      _pageStateController(PageState.success);

      return;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }
}
