import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/controller/exam_link_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/controller/student_interview_request_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/controller/submit_portfolio_link_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/controller/sunmit_result_link_view_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class AppearTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExamLinkViewController(), fenix: true);
    Get.lazyPut(() => SubmitResultLinkViewController(), fenix: true);
    Get.lazyPut(() => SubmitPortfolioLinkSubmitViewController(), fenix: true);
    Get.lazyPut(() => StudentInterviewRequestViewController(), fenix: true);
  }
}
