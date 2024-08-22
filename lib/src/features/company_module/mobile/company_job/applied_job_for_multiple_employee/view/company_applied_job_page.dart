import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/applied_job_for_multiple_employee/controller/company_applied_job_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/applied_job_for_multiple_employee/widget/company_applied_job_builder.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/applied_job_for_multiple_employee/widget/company_applied_job_button.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyAppliedJobForMultipleEmployee extends StatefulWidget {
  const CompanyAppliedJobForMultipleEmployee({super.key});

  @override
  State<CompanyAppliedJobForMultipleEmployee> createState() =>
      _CompanyAppliedJobForMultipleEmployeeState();
}

class _CompanyAppliedJobForMultipleEmployeeState
    extends State<CompanyAppliedJobForMultipleEmployee> {
  final courseController = Get.find<CompanyEmployeeListViewController>();
  final companyAssignedCourseController =
      Get.find<CompanyAppliedJobViewController>();
  final JobModel employeeModel = Get.arguments;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      courseController.getEmployeeList();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply job'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Apply job for multiple employees',
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
                    child: CompanyAppliedJobBuilder(
                      homeCourses: courseController.employeeList,
                      controller: companyAssignedCourseController,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CompanyAppliedJobButton(job: employeeModel),
    );
  }
}
