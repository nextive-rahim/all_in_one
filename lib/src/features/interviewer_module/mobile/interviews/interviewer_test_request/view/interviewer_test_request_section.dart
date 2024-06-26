import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_test_request/controller/interviewer_test_request_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_test_request/widgets/interviewer_test_request_card.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_test_request/widgets/interviewer_test_result_pending_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class InterviewerTestRequestSection
    extends GetView<InterviewerTestRequestViewController> {
  const InterviewerTestRequestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
          children: [
            controller.verificationPending.value
                ? const InterviewerTestResultPendingCard()
                : const InterviewerTestRequestCard()
          ],
        );
      },
    );
  }
}
