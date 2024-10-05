import 'package:all_in_one/src/features/common_features/user_details/controller/user_details_view_controller.dart';
import 'package:get/get.dart';

class UserDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserDetailsViewController(), permanent: true);
  }
}
