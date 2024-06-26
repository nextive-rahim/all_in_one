import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';

class CompanyEmployeeSkillSection extends StatelessWidget {
  const CompanyEmployeeSkillSection({
    super.key,
    required this.employee,
  });
  final EmployeeModel employee;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: AppStrings.topSkills,
          color: CommonColor.blackColor1,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        const SizedBox(height: 15),
        Wrap(
          direction: Axis.horizontal,
          spacing: 3.0,
          runSpacing: 8.0,
          children: [
            Container(
              height: 40,
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 10,
              ),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      width: 0.50, color: CommonColor.greyColor5),
                  borderRadius: BorderRadius.circular(8),
                ),
                shadows: const [
                  BoxShadow(
                    color: CommonColor.blackColor3,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: TextWidget(
                textAlign: TextAlign.center,
                text: employee.keySkill ?? "",
                color: CommonColor.greyColor11,
                maxLine: 1,
                fontFamily: AppStrings.inter,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
