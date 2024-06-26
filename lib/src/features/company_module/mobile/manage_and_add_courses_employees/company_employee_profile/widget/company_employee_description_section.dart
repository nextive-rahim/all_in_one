import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';

class CompanyEmployeeProfileDescriptionSection extends StatelessWidget {
  const CompanyEmployeeProfileDescriptionSection({
    super.key,
    required this.employee,
  });
  final EmployeeModel employee;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: "${AppStrings.employeeID} ${employee.id}",
          color: CommonColor.blackColor1,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        const SizedBox(height: 30),
        const TextWidget(
          text: AppStrings.employeeDescription,
          color: CommonColor.blackColor1,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        const SizedBox(height: 8),
        TextWidget(
          text: employee.descripton ?? '',
          color: CommonColor.greyColor6,
          maxLine: 100,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ],
    );
  }
}
