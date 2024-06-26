import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_test_request/controller/interviewer_test_request_view_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class InterViewerTestRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InterviewerTestRequestViewController(), fenix: true);
  }
}
