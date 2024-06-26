import 'package:all_in_one/models/common_model.dart';
import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/user_course_availablity/repository/user_course_availability_repository.dart';
import 'package:get/get.dart';

class UserCourseAvailabilityViewController extends GetxController {
  final UserCourseAvailabilityRepository _repository =
      UserCourseAvailabilityRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  late CommonResponse checkUserCourseAvailablity;
  int? coursRateId;
  final userId = CacheService.boxAuth.read(CacheKeys.userId);
  Future<void> checkUserCourseAvailability() async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "user_id": userId,
    };

    try {
      final res = await _repository.userCourseAvailabilisty(body);

      checkUserCourseAvailablity = CommonResponse.fromJson(res);

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
