import 'package:all_in_one/src/core/gobal_function.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';

class CompanyEmployeeProfileContactSection extends StatelessWidget {
  const CompanyEmployeeProfileContactSection({
    super.key,
    required this.employee,
  });
  final EmployeeModel employee;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            hotlineSupport(employee.phone ?? '');
          },
          child: Container(
            width: SizeConfig.screenWidth,
            height: 44,
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstant.send1,
                  color: CommonColor.purpleColor1,
                  width: 25,
                  height: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                const TextWidget(
                  text: AppStrings.call,
                  color: CommonColor.purpleColor1,
                  maxLine: 1,
                  fontFamily: AppStrings.inter,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            emailSupport(employee.username ?? '');
          },
          child: Container(
            width: SizeConfig.screenWidth,
            height: 44,
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstant.mail,
                  color: CommonColor.purpleColor1,
                  width: 25,
                  height: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                const TextWidget(
                  text: AppStrings.email,
                  color: CommonColor.purpleColor1,
                  maxLine: 1,
                  fontFamily: AppStrings.inter,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
