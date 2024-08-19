import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/applied_candidate_list_builder.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/selected_candidate_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyJobInterviewCandidateList
    extends GetView<CompanyJobViewController> {
  const CompanyJobInterviewCandidateList({
    super.key,
    // required this.userDetails,
  });
  // final List<UserDetail>? userDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: CommonColor.greyColor15,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 60,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                TextWidget(
                  textAlign: TextAlign.center,
                  text:
                      'Total Applied : ${controller.appliedCandidateList?.length}',
                  color: CommonColor.greyColor4,
                  maxLine: 1,
                  fontFamily: AppStrings.sfProDisplay,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                const SizedBox(height: 30),
                const TextWidget(
                  textAlign: TextAlign.center,
                  text: AppStrings.appliedProfiles,
                  color: CommonColor.blackColor1,
                  maxLine: 1,
                  fontFamily: AppStrings.sfProDisplay,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                const SizedBox(height: 15),
                const AppliedCandidateListBuilder(),
                const SizedBox(height: 40),
                const TextWidget(
                    textAlign: TextAlign.center,
                    text: AppStrings.selectedProfiles,
                    color: CommonColor.greyColor4,
                    maxLine: 1,
                    fontFamily: AppStrings.sfProDisplay,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
                const SizedBox(height: 15),
                const SelectedCandidateListBuilder()
              ],
            ),
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
