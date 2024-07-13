import 'package:all_in_one/models/common_model.dart';
import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_registration/repository/course_registration_repository.dart';
import 'package:get/get.dart';

class CourseRegistrationViewController extends GetxController {
  final CourseRegistrationRepository _repository =
      CourseRegistrationRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  RxBool appearInTest = false.obs;
  RxBool courseRegistered = false.obs;
  RxBool isCourseAllVideosWatched = false.obs;
  late CommonResponse registration;
  final userId = CacheService.boxAuth.read(CacheKeys.userId);
  Future<void> checkCourseRegistration(
    int id,
    String rateId,
  ) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "course_id": id,
      "user_id": userId,
      "course_rate_id": rateId
    };

    try {
      final res = await _repository.courseRegistration(body);
      registration = CommonResponse.fromJson(res);

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
