import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/controller/company_assigned_%20course_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          Get.snackbar(
            'Waring',
            'Selected at least one course',
            borderColor: AppColors.red,
            borderWidth: 1,
          );
          return;
        }
        controller.companyAssingedCourse(employee.id!).then((value) {
          if (value.success == true) {
            Get.back();
            Get.snackbar(
              'Success',
              'course added successfully.',
            );
          } else {
            Get.snackbar(
              'Failed',
              'course added Failed.',
              borderColor: AppColors.red,
              borderWidth: 1,
            );
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 20,
          right: 20,
        ),
        child: Container(
          height: 60,
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
