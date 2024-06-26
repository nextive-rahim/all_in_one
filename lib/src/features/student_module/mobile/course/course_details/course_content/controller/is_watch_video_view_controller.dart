import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/repository/course_content_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class IsWatchVideoViewController extends GetxController {
  final StudentCourseContentRepository _repository =
      StudentCourseContentRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  final RxString videolink = ''.obs;

  Future<void> isWatchVideo(int contentId, int courseId) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      "content_id": contentId,
      "course_id": courseId,
    };

    Log.debug(requestBody.toString());

    try {
      await _repository.isWatchVideo(requestBody);
      // contentResponse = ViewCourseContentResponseData.fromJson(res);

      // contentTileList.value = contentResponse.data ?? [];
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
