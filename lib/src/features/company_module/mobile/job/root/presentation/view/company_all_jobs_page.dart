import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/my_company_jobs/my_company_job_list/view/my_company_job_mobile.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/other_jobs/view/other_company_jobs_page.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/root/presentation/widget/company_job_common_tab.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/applied_jobs_tab.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/saved_job_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyAllJobsMobilePage extends StatelessWidget {
  const CompanyAllJobsMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JobsViewController());
    Get.put(OtherCompanyJobsViewController());
    return Scaffold(
      backgroundColor: CommonColor.greyColor1,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            Get.find<JobsViewController>().getjobList();
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
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
                        secondTabViewItems: [OtherCompanyJobPage()],
                        thirdTabViewItems: [SavedJobsTab()],
                        fourthTabViewItems: [AppliedTab()],
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
