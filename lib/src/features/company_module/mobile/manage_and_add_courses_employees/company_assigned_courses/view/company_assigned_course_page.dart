import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/widget/company_assigned_course_builder.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/widget/company_assigned_course_button.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/controller/student_home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyAssignedCourses extends GetView<StudentHomeViewController> {
  const CompanyAssignedCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final EmployeeModel employeeModel = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assigned Courses'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getStudentHomeData();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Assigned courses for employee',
                  style: AppTextStyle.bold20,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Obx(() {
                    if (controller.pageState == PageState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return const SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: CompanyAssigniedCourseBuilder(),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CompanyAssignedCourseButton(employee: employeeModel),
    );
  }
}
