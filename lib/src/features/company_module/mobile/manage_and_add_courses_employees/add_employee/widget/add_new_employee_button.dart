import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/widgets/primary_button.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/controller/added_new_employee_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddedNewEmployeeButton extends GetView<AddedNewEmployeeViewController> {
  const AddedNewEmployeeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Obx(
        () => PrimaryButton(
          isLoading: controller.pageState == PageState.loading,
          onTap: () async {
            if (controller.employeeController.text.isEmpty ||
                controller.nameController.text.isEmpty ||
                controller.emailController.text.isEmpty ||
                controller.contactsNumberController.text.isEmpty ||
                controller.deginationController.text.isEmpty ||
                controller.employeeDescriptionController.text.isEmpty) {
              Get.snackbar(
                'Waring',
                'Please fill the field',
                backgroundColor: CommonColor.redColors,
                colorText: Colors.white,
                borderWidth: 1,
              );
              return;
            }
            controller.addedNewEmployee().then((value) {
              if (value.success == false) {
                Get.snackbar(
                  'Failed',
                  value.message ?? 'Fail to add new employee',
                  backgroundColor: CommonColor.redColors,
                  colorText: Colors.white,
                );
                return;
              }
              if (value.success == true) {
                Get.back();
                Get.snackbar(
                  'Successfully',
                  value.message ?? 'Employee Added Successfully',
                  backgroundColor: CommonColor.greenColor1,
                  colorText: Colors.white,
                );
                Get.find<EmployeeListViewController>().getEmployeeList();
              }
            });
          },
          widget: Text(
            'Added new employee',
            textAlign: TextAlign.center,
            style: AppTextStyle.bold16.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
