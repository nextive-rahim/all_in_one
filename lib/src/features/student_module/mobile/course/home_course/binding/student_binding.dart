import 'package:all_in_one/src/features/student_module/mobile/course/home_course/controller/student_home_view_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class StudentModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentHomeViewController(), fenix: true);
  }
}
