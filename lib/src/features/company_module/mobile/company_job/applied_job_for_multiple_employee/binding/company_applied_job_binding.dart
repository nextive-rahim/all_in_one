import 'package:all_in_one/src/features/company_module/mobile/company_job/applied_job_for_multiple_employee/controller/company_applied_job_view_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class CompanyAppliedJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompanyAppliedJobViewController(), fenix: true);
  }
}
