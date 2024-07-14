import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_test_request/repository/interviewer_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class InterviewerTestRequestViewController extends GetxController {
  final InterviewerTestRequestRepository _repository =
      InterviewerTestRequestRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  RxBool verificationPending = false.obs;
  RxBool isInterviewerApproved = false.obs;
  final TextEditingController dateMonthYearController = TextEditingController();
  final TextEditingController timeSlotAController = TextEditingController();
  final TextEditingController timeSlotBController = TextEditingController();
  final userId = CacheService.boxAuth.read(CacheKeys.userId);
  RxBool activeRequistForInterview = false.obs;

  Future<void> interviewRequest(int courseId) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "user_id": userId,
      "course_id": courseId,
      "date": dateMonthYearController.text,
      "time_slot_a": timeSlotAController.text,
      "time_slot_b": timeSlotBController.text,
    };

    try {
      await _repository.interviewerTestRequst(body);

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
