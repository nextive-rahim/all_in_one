import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/company_interview_candidate_card.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SelectedCandidateListBuilder extends GetView<CompanyJobViewController> {
  const SelectedCandidateListBuilder({
    super.key,
    //required this.userDetails,
  });
  // final List<UserDetail>? userDetails;

  @override
  Widget build(BuildContext context) {
    controller.seletedCandidate?.value = controller.appliedCandidateList!
        .where((v) => v.isSelected == 1)
        .toList();
    return Obx(() {
      if (controller.seletedCandidate!.isEmpty) {
        return const Center(
          child: Text(
            'No SeletedCandidate Founded',
            style: TextStyle(
              color: CommonColor.redColors,
            ),
          ),
        );
      }
      return ListView.separated(
        shrinkWrap: true,
        itemCount: controller.seletedCandidate!.length,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemBuilder: (context, index) {
          UserDetail user = controller.seletedCandidate![index];
          return CompanyInterviewCandidateCard(
            user: user,
            color: CommonColor.greenColor1,
          );
        },
      );
    });
  }
}
