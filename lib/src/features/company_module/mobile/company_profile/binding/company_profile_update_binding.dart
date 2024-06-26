import 'package:all_in_one/src/features/company_module/mobile/company_profile/controller/company_profile_update_view_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class CompanyProfileUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompanyProfileUpdateViewController(), fenix: true);
  }
}
