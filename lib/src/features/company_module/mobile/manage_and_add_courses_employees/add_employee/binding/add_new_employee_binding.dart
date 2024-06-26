import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/controller/added_new_employee_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/controller/student_home_view_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class AddedNewEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddedNewEmployeeViewController(), fenix: true);
    Get.lazyPut(() => StudentHomeViewController(), fenix: true);
  }
}
