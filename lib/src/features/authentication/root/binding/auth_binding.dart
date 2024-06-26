import 'package:all_in_one/src/features/authentication/forget_password/controller/forget_password_email_view_controller.dart';
import 'package:all_in_one/src/features/authentication/forget_password/controller/forget_password_view_controller.dart';
import 'package:all_in_one/src/features/authentication/forget_password/controller/otp_verification_view_controller.dart';
import 'package:all_in_one/src/features/authentication/login/controller/login_view_controller.dart';
import 'package:all_in_one/src/features/authentication/registration/controller/registration_view_controller.dart';
import 'package:all_in_one/src/features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/skill/controller/skill_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginViewController(), fenix: true);
    Get.lazyPut(() => RegistrationViewController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => SkillViewController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordViewController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordEmailViewController(), fenix: true);
    Get.lazyPut(() => OtpVerificationViewController(), fenix: true);
  }
}
