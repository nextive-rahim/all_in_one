import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteEmployeeButton extends GetView<EmployeeListViewController> {
  const DeleteEmployeeButton({
    super.key,
    required this.employee,
  });
  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDailogBox(context);
      },
      child: const Icon(
        Icons.delete_forever_outlined,
        color: CommonColor.redColors,
        size: 23,
      ),
    );
  }

  void _showDailogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Do you want to delete this employee.'),
          content: const SingleChildScrollView(
            child: SelectableText(
              'Delete is irreversible.',
              style: TextStyle(color: CommonColor.redColors),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.deleteEmployee(employee.userId ?? 0).then((v) {
                  if (v.success == true) {
                    controller.employeeList
                        .removeWhere((v) => v.id == employee.id);
                  } else {
                    Get.snackbar(
                      'Failded',
                      v.message ?? '',
                      backgroundColor: CommonColor.redColors,
                      colorText: CommonColor.whiteColor,
                    );
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: CommonColor.redColors),
              ),
            )
          ],
        );
      },
    );
  }
}
