import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';

class CompanyEmployeeProfileHeader extends StatelessWidget {
  const CompanyEmployeeProfileHeader({
    super.key,
    required this.employee,
  });
  final EmployeeModel employee;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 76,
            height: 76,
            alignment: Alignment.center,
            decoration: const ShapeDecoration(
              color: CommonColor.greyColor15,
              shape: CircleBorder(),
            ),
            child: Text(
              getInitials(employee.name ?? ''),
              style: AppTextStyle.bold16,
            ),
          ),
          const SizedBox(height: 15),
          TextWidget(
            textAlign: TextAlign.center,
            text: employee.name ?? '',
            color: CommonColor.blackColor1,
            maxLine: 1,
            fontFamily: AppStrings.aeonikTRIAL,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
          const SizedBox(height: 8),
          TextWidget(
            text: employee.degination ?? '',
            color: CommonColor.blackColor1,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          const SizedBox(height: 8),
          TextWidget(
            text: employee.username ?? '',
            color: CommonColor.greyColor6,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ],
      ),
    );
  }

  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';
}
