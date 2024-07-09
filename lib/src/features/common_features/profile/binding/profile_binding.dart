import 'package:all_in_one/src/features/common_features/profile/controller/change_password_view_controller.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_update_view_controller.dart';
import 'package:all_in_one/src/features/common_features/skill/controller/skill_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateProfileiewController(), fenix: true);
    Get.lazyPut(() => SkillViewController(), fenix: true);
  }
}

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordViewController(), fenix: true);
  }
}
