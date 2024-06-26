import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/selected_interview_details/controller/confirm_interview_request_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class ConfirmInterviewRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmInterviewREquestViewController(), fenix: true);
  }
}
