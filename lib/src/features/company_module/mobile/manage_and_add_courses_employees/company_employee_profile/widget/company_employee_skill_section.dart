import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/common_features/user_details/model/user_details_model.dart';
import 'package:flutter/widgets.dart';

class CompanyEmployeeSkillSection extends StatefulWidget {
  const CompanyEmployeeSkillSection({
    super.key,
    required this.user,
  });
  final EmployeeModel? user;
  @override
  State<CompanyEmployeeSkillSection> createState() =>
      _CompanyEmployeeSkillSectionState();
}

class _CompanyEmployeeSkillSectionState
    extends State<CompanyEmployeeSkillSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const TextWidget(
          text: 'Skills',
          color: CommonColor.greyColor4,
          maxLine: 1,
          underline: TextDecoration.underline,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        const SizedBox(height: 10),
        GridView.builder(
          padding: const EdgeInsets.only(bottom: 10),
          shrinkWrap: true,
          itemCount: widget.user?.userSkill!.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of items in each row
              mainAxisSpacing: 8.0, // spacing between rows
              crossAxisSpacing: 8.0,
              mainAxisExtent: 50 // spacing between columns
              ),
          itemBuilder: (context, index) {
            return TextWidget(
              text:
                  "${index + 1} . ${widget.user?.userSkill![index].skill ?? ''}",
              color: CommonColor.blackColor2,
              maxLine: 2,
              fontFamily: AppStrings.inter,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            );
          },
        ),
      ],
    );
  }
}
