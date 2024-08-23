import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/repository/all_interviews_repository.dart';
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
      "schedule_interview_id": id,
      "feedback_content": feedbackMsg,
    };

    try {
      await repository.submitInterviewFeedback(body);

      _pageStateController(PageState.success);
      SnackBarService.showInfoSnackBar('Feedback store Successfully.');
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
    }
  }

  Future<void> editFeedback(
    int id,
    String feedbackMsg,
  ) async {
    _pageStateController(PageState.loading);
    Map<String, dynamic> body = {
      "id": id,
      "feedback_content": feedbackMsg,
    };

    try {
      await repository.editFeedback(body);

      _pageStateController(PageState.success);
      SnackBarService.showInfoSnackBar('Edit Feedback Successfully.');
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
    }
  }
}
