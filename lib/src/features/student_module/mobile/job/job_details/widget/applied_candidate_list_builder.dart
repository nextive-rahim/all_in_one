import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/company_interview_candidate_card.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';

class AppliedCandidateListBuilder extends StatelessWidget {
  const AppliedCandidateListBuilder({
    super.key,
    required this.userDetails,
  });
  final List<UserDetail>? userDetails;

  @override
  Widget build(BuildContext context) {
    return userDetails!.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            itemCount: userDetails!.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemBuilder: (context, index) {
              UserDetail user = userDetails![index];
              return CompanyInterviewCandidateCard(
                user: user,
                color: CommonColor.purpleColor1,
              );
            },
          )
        : const Text('No Applied Candidate Found');
  }
}
