import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/company_interview_candidate_card.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AppliedCandidateListBuilder extends GetView<CompanyJobViewController> {
  const AppliedCandidateListBuilder({
    super.key,
    // required this.userDetails,
  });
  // final List<UserDetail>? userDetails;

  @override
  Widget build(BuildContext context) {
    controller.unSeletedCandidate?.value = controller.appliedCandidateList!
        .where((v) => v.isSelected == 0)
        .toList();
    return
        // appliedusers.isNotEmpty
        //     ?

        Obx(() {
      if (controller.unSeletedCandidate!.isEmpty) {
        return const Center(
            child: Text(
          'No Applied Candidate Found',
          style: TextStyle(color: AppColors.red),
        ));
      }
      return ListView.separated(
        shrinkWrap: true,
        itemCount: controller.unSeletedCandidate!.length,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemBuilder: (context, index) {
          UserDetail user = controller.unSeletedCandidate![index];
          return CompanyInterviewCandidateCard(
            user: user,
            color: CommonColor.purpleColor1,
          );
        },
      );
    });
  }
}
