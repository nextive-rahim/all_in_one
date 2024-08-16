import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/widgets/empty_screen.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/other_jobs/widgets/other_company_job_card.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/view/job_details_page_mobile.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/job-card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherCompanyJobsTab extends GetView<OtherCompanyJobsViewController> {
  const OtherCompanyJobsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Obx(
        () {
          if (controller.pageState == PageState.loading) {
            return const JobCardLoading();
          }
          return controller.otherCompany.isEmpty
              ? const EmptyScreen(
                  title: "Latest Job",
                )
              : ListView.separated(
                  itemCount: controller.otherCompany.length,
                  shrinkWrap: true,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return OtherCompanyJobCard(
                      onTap: () {
                        Get.toNamed(
                          Routes.jobDetails,
                          arguments: [
                            controller.otherCompany[index],
                            JobIsFrom.all
                          ],
                        );
                      },
                      job: controller.otherCompany[index],
                    );
                  },
                );
        },
      ),
    );
  }
}
