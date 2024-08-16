import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyInterviewCandidateCard extends StatelessWidget {
  const CompanyInterviewCandidateCard({
    super.key,
    required this.name,
    required this.color,
  });
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.companyJobAppliedCandidateProfile);
      },
      child: Row(
        children: [
          Image.asset(
            ImageConstant.link2,
            color: color,
          ),
          const SizedBox(width: 8),
          TextWidget(
            textAlign: TextAlign.start,
            text: name,
            color: CommonColor.greyColor4,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
