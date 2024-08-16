import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/empty_screen.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/widget/employee_card.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/job-card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeListSection extends GetView<EmployeeListViewController> {
  const EmployeeListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.pageState == PageState.loading) {
        return const JobCardLoading(height: 180);
      }
      if (controller.employeeList.isEmpty) {
        return const EmptyScreen();
      }
      return _EmployeeListBuilder(
        employeeList: controller.employeeList,
      );
    });
  }
}

class _EmployeeListBuilder extends StatelessWidget {
  const _EmployeeListBuilder({
    required this.employeeList,
  });
  final List<EmployeeModel> employeeList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      reverse: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: employeeList.length,
      itemBuilder: ((context, index) {
        return EmployeeCard(
          employee: employeeList[index],
        );
      }),
      separatorBuilder: ((context, index) {
        return const SizedBox(height: 15);
      }),
    );
  }
}
