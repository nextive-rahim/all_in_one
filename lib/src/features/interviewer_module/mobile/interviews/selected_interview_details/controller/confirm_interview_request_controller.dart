import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/selected_interview_details/repository/confirm_interview_request_repository.dart';
import 'package:flutter/material.dart';
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
  RxInt selectedTimeSlotA = 0.obs;
  RxInt selectedTimeSlotB = 0.obs;
  Future<void> confirmInterviewRequest(int id) async {
    _pageStateController(PageState.loading);
    Map<String, dynamic> body = {
      "id": id,
      "link": interviewLInk.text,
      "approved_slot_a": selectedTimeSlotA.value,
      "approved_slot_b": selectedTimeSlotB.value
    };

    try {
      final res = await repository.confirmInterviewRequest(body);
      responsStatus = res['success'];
      _pageStateController(PageState.success);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      SnackBarService.showErrorSnackBar('Interview Not Confirmed');
    }
  }
}
