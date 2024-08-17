import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyEmployeeProfileEvaluationSection extends StatelessWidget {
  const CompanyEmployeeProfileEvaluationSection({
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
          text: AppStrings.evaluations,
          color: CommonColor.blackColor1,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        // const SizedBox(height: 18),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Row(
        //       children: [
        //         const TextWidget(
        //           text: AppStrings.testYourSkills,
        //           color: CommonColor.blueColor1,
        //           maxLine: 1,
        //           fontFamily: AppStrings.inter,
        //           fontWeight: FontWeight.w500,
        //           fontSize: 16,
        //         ),
        //         const SizedBox(width: 8),
        //         Image.asset(
        //           ImageConstant.link2,
        //           color: CommonColor.blueColor1,
        //         )
        //       ],
        //     ),
        //     Row(
        //       children: [
        //         const TextWidget(
        //           text: AppStrings.projectLink,
        //           color: CommonColor.blueColor1,
        //           maxLine: 1,
        //           fontFamily: AppStrings.inter,
        //           fontWeight: FontWeight.w500,
        //           fontSize: 16,
        //         ),
        //         const SizedBox(width: 8),
        //         Image.asset(
        //           ImageConstant.link2,
        //           color: CommonColor.blueColor1,
        //         )
        //       ],
        //     ),
        //   ],
        // ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Get.toNamed(
              Routes.resume,
              arguments: employee.resume,
            );
          },
          child: Container(
            width: 199,
            height: 142,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.cv),
                fit: BoxFit.fill,
              ),
              gradient: LinearGradient(
                begin: const Alignment(0.00, -1.00),
                end: const Alignment(0, 1),
                colors: [Colors.black.withOpacity(0), Colors.black],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
