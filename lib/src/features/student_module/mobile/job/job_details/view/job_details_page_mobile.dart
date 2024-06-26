import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/apply_candidate_list.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/apply_job_button.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/job_description.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/job_details_header.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/job_summary_card.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/widget/save_job_button_from_job_details.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/applied_jobs_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobDetailsPageMobile extends StatefulWidget {
  const JobDetailsPageMobile({super.key});

  @override
  State<JobDetailsPageMobile> createState() => _JobDetailsPageMobileState();
}

class _JobDetailsPageMobileState extends State<JobDetailsPageMobile> {
  final controller =
      Get.lazyPut(() => AppliedJobsViewController(), fenix: true);
  final savecontroller = Get.lazyPut(() => JobsViewController(), fenix: true);
  final JobModel viewJobResponseData = Get.arguments[0];
  final isFromCompanyJob = Get.arguments[1] ?? false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    isFromCompanyJob
                        ? const Offstage()
                        : ApplyJobButton(job: viewJobResponseData),
                    isFromCompanyJob
                        ? const Offstage()
                        : SaveJobButtonFromJobDetails(job: viewJobResponseData),
                    JobDescription(job: viewJobResponseData),
                    //  const JobShareButton(),
                    isFromCompanyJob
                        ? const AppliedCandidateList()
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
