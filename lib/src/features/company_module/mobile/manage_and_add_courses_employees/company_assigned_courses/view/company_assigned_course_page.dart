import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/controller/company_assigned_%20course_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/widget/company_assigned_course_builder.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/widget/company_assigned_course_button.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/controller/student_home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyAssignedCourses extends StatefulWidget {
  const CompanyAssignedCourses({super.key});

  @override
  State<CompanyAssignedCourses> createState() => _CompanyAssignedCoursesState();
}

class _CompanyAssignedCoursesState extends State<CompanyAssignedCourses> {
  final courseController = Get.find<StudentHomeViewController>();
  final companyAssignedCourseController =
      Get.find<CompanyAssignedCouseViewController>();
  final EmployeeModel employeeModel = Get.arguments;
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    courseController.getStudentHomeData();
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assigned Courses'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await courseController.getStudentHomeData();
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
                    if (courseController.pageState == PageState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: CompanyAssigniedCourseBuilder(
                        homeCourses: courseController.homeCourses,
                        controller: companyAssignedCourseController,
                      ),
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
