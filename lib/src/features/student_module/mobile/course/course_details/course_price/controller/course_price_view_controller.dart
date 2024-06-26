import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_price/model/student_course_price_model.dart';
import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_price/repository/course_price_repository.dart';
import 'package:get/get.dart';

class CoursePriceViewController extends GetxController {
  final CoursePriceRepository _repository = CoursePriceRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  late CoursePriceResponse coursePriceModel;
  List<CoursePriceResponseData> coursePriceReponseData = [];
  int? coursRateId;
  Future<void> checkCoursePrice(
    int id,
  ) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "course_id": id,
    };

    try {
      final res = await _repository.coursePrice(body);
      coursePriceModel = CoursePriceResponse.fromJson(res);

      coursePriceReponseData = coursePriceModel.data ?? [];

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
