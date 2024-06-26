import 'package:all_in_one/src/features/company_module/mobile/job/post_new_job/controller/post_company_new_job_view_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class PostJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostCompanyNewJobViewController(), fenix: true);
  }
}
