import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/repository/all_interviews_repository.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SubmittedInterviewFeedbackViewController extends GetxController {
  final InterviewsRepository repository = InterviewsRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  Future<void> submittedInterviewFeedBack(
    int id,
    String feedbackMsg,
  ) async {
    _pageStateController(PageState.loading);
    Map<String, dynamic> body = {
      "id": id,
      "feedback_content": feedbackMsg,
    };

    try {
      await repository.submitInterviewFeedback(body);

      _pageStateController(PageState.success);
      Get.snackbar(
        'Success',
        'Feedback store Successfully.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      Get.snackbar(
        'Failed',
        'Failed to submited interview feedback',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
