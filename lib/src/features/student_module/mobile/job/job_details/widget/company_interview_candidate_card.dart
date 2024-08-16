import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/common_features/user_details/controller/user_details_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyInterviewCandidateCard extends GetView<UserDetailsViewController> {
  const CompanyInterviewCandidateCard({
    super.key,
    required this.user,
    required this.color,
  });
  final UserDetail user;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.userDetails(
          userId: user.id,
          userType: user.userType,
        );
        Get.toNamed(
          Routes.companyJobAppliedCandidateProfile,
          arguments: user,
        );
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
            text: user.username ?? '',
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