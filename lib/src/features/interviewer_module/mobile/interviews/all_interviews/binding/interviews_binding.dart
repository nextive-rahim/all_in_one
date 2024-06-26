import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/controller/All_interviews_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/controller/submit_interview_feedback_view_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class InterviewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllInterviewsViewController(), fenix: true);
    Get.lazyPut(() => SubmittedInterviewFeedbackViewController(), fenix: true);
  }
}
