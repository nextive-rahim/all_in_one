import 'package:all_in_one/src/core/gobal_function.dart';
import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/string.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/common_features/user_details/controller/user_details_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/company_interview_candidate_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part '../widget/company_job_candidate_profile_header.dart';
part '../widget/applied_candidate_communication_link.dart';
part '../widget/company_selecte_candidate_for_interview.dart';
part '../widget/company_job_candidate_profile_details.dart';

bool jobAppliedStatus = false;

class CompanyJobAppliedCandidateProfile
    extends GetView<UserDetailsViewController> {
  const CompanyJobAppliedCandidateProfile({
    super.key,
    required this.isSelected,
  });
  final String isSelected;
  @override
  Widget build(BuildContext context) {
    controller.isFrom = isSelected;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidate Profile'),
      ),
      body: Obx(
        () {
          if (controller.pageState == PageState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 18,
                          right: 18,
                          top: 7,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _CompanyJobCandidateProfileHeader(),
                            SizedBox(height: 10),
                            AppliedCandidateCommunicationLink(),
                            SizedBox(height: 10),
                            CompanySelecteCandidateForInterview(),
                            SizedBox(height: 30),
                            CompanyJobCandidateProfileDetails(),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
