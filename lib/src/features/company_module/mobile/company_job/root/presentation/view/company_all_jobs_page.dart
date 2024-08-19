import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/view/my_company_job_mobile.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/other_jobs/widgets/company_applied_jobs_tab.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/other_jobs/widgets/other_company_jobs_tab.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/other_jobs/widgets/company_saved_job_tab.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/post_new_job/controller/post_company_new_job_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/root/presentation/widget/company_job_common_tab.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyAllJobsMobilePage extends StatelessWidget {
  const CompanyAllJobsMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JobsViewController());
    Get.put(OtherCompanyJobsViewController());
    Get.put(PostCompanyNewJobViewController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColor.greyColor1,
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<JobsViewController>().getjobList();
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    color: CommonColor.greyColor15,
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                        bottom: 60,
                      ),
                      child: CompanyJobCommonTabSection(
                        title3: AppStrings.savedJobs,
                        title1: AppStrings.ourJobs,
                        title2: AppStrings.otherJobs,
                        title4: AppStrings.appliedJobs,
                        firstTabViewItems: [MyCompanyJobListPageMobile()],
                        secondTabViewItems: [OtherCompanyJobsTab()],
                        thirdTabViewItems: [CompanySavedJobsTab()],
                        fourthTabViewItems: [CompanyAppliedJobTab()],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
