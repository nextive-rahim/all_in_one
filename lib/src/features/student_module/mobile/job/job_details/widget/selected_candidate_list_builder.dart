import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/company_interview_candidate_card.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';

class SelectedCandidateListBuilder extends StatelessWidget {
  const SelectedCandidateListBuilder({
    super.key,
    required this.userDetails,
  });
  final List<UserDetail>? userDetails;

  @override
  Widget build(BuildContext context) {
    List<UserDetail> selectedusers =
        userDetails!.where((v) => v.isSelected == 1).toList();
    return selectedusers.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            itemCount: selectedusers.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemBuilder: (context, index) {
              UserDetail user = selectedusers[index];
              return CompanyInterviewCandidateCard(
                user: user,
                color: CommonColor.greenColor1,
              );
            },
          )
        : const Center(child: Text('No SeletedCandidate Founded'));
  }
}
