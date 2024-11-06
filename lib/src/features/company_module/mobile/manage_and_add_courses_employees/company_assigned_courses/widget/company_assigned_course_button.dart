import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/controller/company_assigned_%20course_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CompanyAssignedCourseButton
    extends GetView<CompanyAssignedCouseViewController> {
  const CompanyAssignedCourseButton({
    super.key,
    required this.employee,
  });
  final EmployeeModel employee;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.courseIDList.isEmpty) {
          SnackBarService.showErrorSnackBar('Selected at least one course');

          return;
        }
        controller.companyAssingedCourse(employee.userId!).then((value) {
          if (value.success == true) {
            Get.find<CompanyEmployeeListViewController>().getEmployeeList();
            context.pop();
            // Get.back();
            SnackBarService.showInfoSnackBar('course added successfully.');
          } else {
            SnackBarService.showErrorSnackBar('course added Failed.');
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 160,
          right: 160,
        ),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CommonColor.blueColor1),
          child: Center(
            child: Text(
              'Adde Courses',
              style: AppTextStyle.bold16.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
