import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/selected_interview_details/repository/confirm_interview_request_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ConfirmInterviewREquestViewController extends GetxController {
  final ConfirmInterviewsRequestRepository repository =
      ConfirmInterviewsRequestRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);
  bool responsStatus = false;
  get pageState => _pageStateController.value;
  final TextEditingController interviewLInk = TextEditingController();
  Future<void> confirmInterviewRequest(
    int id,
    // String interViewLink,
  ) async {
    _pageStateController(PageState.loading);
    Map<String, dynamic> body = {
      "id": id,
      "link": interviewLInk.text,
    };

    try {
      final res = await repository.confirmInterviewRequest(body);
      responsStatus = res['success'];
      _pageStateController(PageState.success);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      Get.snackbar(
        'Failed',
        'Interview Not Confirmed',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
