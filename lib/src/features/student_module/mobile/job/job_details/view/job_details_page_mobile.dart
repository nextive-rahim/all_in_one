import 'package:all_in_one/src/core/extension/sizebox_extension.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/common_features/user_details/controller/user_details_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/company_job_apply_button.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/company_save_job_button_from_job_details.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/company_job_candidate_list.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/apply_job_button.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/job_description.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/job_details_header.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/job_summary_card.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/save_job_button_from_job_details.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum JobIsFrom {
  all,
  applied,
  saved,
  company,
  other,
}

class JobDetailsPageMobile extends StatefulWidget {
  const JobDetailsPageMobile({super.key});

  @override
  State<JobDetailsPageMobile> createState() => _JobDetailsPageMobileState();
}

class _JobDetailsPageMobileState extends State<JobDetailsPageMobile> {
  final companyjobController = Get.put(CompanyJobViewController());
  final JobModel viewJobResponseData = Get.arguments[0];
  final isFromCompanyJob = Get.arguments[1] == JobIsFrom.company ? true : false;

  final bool isFromOtherJob =
      Get.arguments[1] == JobIsFrom.other ? true : false;
  @override
  void initState() {
    Get.put(UserDetailsViewController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    companyjobController.appliedCandidateList?.value =
        viewJobResponseData.user ?? [];
    return Scaffold(
      backgroundColor: CommonColor.greyColor1,
      appBar: AppBar(
        title: const Text('Job Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  right: 18,
                  top: 7,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    JobDetailsHeader(job: viewJobResponseData),
                    JobSummaryCard(job: viewJobResponseData),

                    isFromOtherJob
                        ? Column(
                            children: [
                              CompanySaveJobButtonFromJobDetails(
                                  job: viewJobResponseData),
                              10.sh,
                              CompanyJobApplyButton(job: viewJobResponseData),
                            ],
                          )
                        : isFromCompanyJob
                            ? const Offstage()
                            : Column(
                                children: [
                                  SaveJobButtonFromJobDetails(
                                      job: viewJobResponseData),
                                  10.sh,
                                  ApplyJobButton(job: viewJobResponseData),
                                ],
                              ),
                    20.sh,
                    JobDescription(job: viewJobResponseData),
                    //  const JobShareButton(),
                    isFromCompanyJob
                        ? const CompanyJobInterviewCandidateList(
                            // userDetails: viewJobResponseData.user
                            )
                        : const Offstage()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
