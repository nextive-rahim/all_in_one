import 'package:all_in_one/src/features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/applied_jobs_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class JobListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => AppliedJobsViewController(), fenix: true);
    Get.lazyPut(() => JobsViewController(), fenix: true);
  }
}
