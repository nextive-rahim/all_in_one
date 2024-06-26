import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/repository/appear_test_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SubmitPortfolioLinkSubmitViewController extends GetxController {
  final AppearTestRepository _repository = AppearTestRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  final TextEditingController submitExamLinkController =
      TextEditingController();

  Future<void> submitPortfolioLink(int courseId) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      "course_id": courseId,
      "marks": 1,
      "project_links": submitExamLinkController.text
    };
    Log.debug(requestBody.toString());

    try {
      await _repository.submitResultLink(requestBody);

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
