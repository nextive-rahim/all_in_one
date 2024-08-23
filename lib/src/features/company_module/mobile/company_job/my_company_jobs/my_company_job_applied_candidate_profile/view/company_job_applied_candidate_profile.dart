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
import 'package:all_in_one/src/features/common_features/profile/model/profile_response_model.dart';
import 'package:all_in_one/src/features/common_features/user_details/controller/user_details_view_controller.dart';
import 'package:all_in_one/src/features/common_features/user_details/model/user_details_model.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part '../widget/company_job_candidate_profile_header.dart';
part '../widget/applied_candidate_communication_link.dart';
part '../widget/company_selecte_candidate_for_interview.dart';
part '../widget/company_job_candidate_profile_details.dart';

bool jobAppliedStatus = false;

class CompanyJobAppliedCandidateProfile
    extends GetView<UserDetailsViewController> {
  const CompanyJobAppliedCandidateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidate Profile'),
      ),
      body: Obx(
        () {
          if (controller.pageState == PageState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                          right: 18,
                          top: 7,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _CompanyJobCandidateProfileHeader(
                                userModel: controller.userModel!),
                            const SizedBox(height: 10),
                            AppliedCandidateCommunicationLink(
                                user: controller.userDetailsResponseModelData!),
                            const SizedBox(height: 10),
                            const CompanySelecteCandidateForInterview(),
                            const SizedBox(height: 30),
                            CompanyJobCandidateProfileDetails(
                                user: controller.userDetailsResponseModelData!),
                            const SizedBox(height: 30),
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
