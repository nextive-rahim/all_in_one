import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/applied_candidate_list_builder.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/selected_candidate_list_builder.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';

class CompanyJobInterviewCandidateList extends StatelessWidget {
  const CompanyJobInterviewCandidateList({
    super.key,
    required this.userDetails,
  });
  final List<UserDetail>? userDetails;
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
                  text: 'Total Applied : ${userDetails!.length}',
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
                AppliedCandidateListBuilder(userDetails: userDetails),
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
                SelectedCandidateListBuilder(userDetails: userDetails)
              ],
            ),
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
