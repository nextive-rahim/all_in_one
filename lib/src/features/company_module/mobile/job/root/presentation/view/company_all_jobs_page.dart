import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/my_company_jobs/my_company_job_list/view/my_company_job_mobile.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/other_jobs/view/other_company_jobs_page.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/root/presentation/widget/company_job_common_tab.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/applied_jobs_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/applied_jobs_tab.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/saved_job_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyAllJobsMobilePage extends StatefulWidget {
  const CompanyAllJobsMobilePage({super.key});

  @override
  State<CompanyAllJobsMobilePage> createState() =>
      _CompanyAllJobsMobilePageState();
}

class _CompanyAllJobsMobilePageState extends State<CompanyAllJobsMobilePage> {
  final controller = Get.put(OtherCompanyJobsViewController());
  final appliedController = Get.put(AppliedJobsViewController());
  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.greyColor1,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            appliedController.appliedjobList();
          },
          child: Column(
            children: [
              // StudentAppBarMobile(
              //   titel1: AppStrings.companyName,
              //   title2: AppStrings.companyTaglineHere,
              //   isBack: false,
              //   searchHintText: AppStrings.searchForJobs,
              //   onSearchListener: (value) {},
              //   isShowNotificationIcon: false,
              // ),
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
                      child: Column(
                        children: [
                          CompanyJobCommonTabSection(
                            title3: AppStrings.savedJobs,
                            title1: AppStrings.ourJobs,
                            title2: AppStrings.otherJobs,
                            title4: AppStrings.appliedJobs,
                            firstTabViewItems: [MyCompanyJobListPageMobile()],
                            secondTabViewItems: [OtherCompanyJobPage()],
                            thirdTabViewItems: [SavedJobsTab()],
                            fourthTabViewItems: [AppliedTab()],
                          ),
                        ],
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
