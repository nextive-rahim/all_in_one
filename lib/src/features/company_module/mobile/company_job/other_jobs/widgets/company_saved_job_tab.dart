import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/widgets/empty_screen.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/other_jobs/widgets/other_company_job_card.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/view/job_details_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CompanySavedJobsTab extends GetView<OtherCompanyJobsViewController> {
  const CompanySavedJobsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Obx(
        () {
          // if (controller.pageState == PageState.loading) {
          //   return const JobCardLoading();
          // }
          return controller.companySavedJobList.isEmpty
              ? const EmptyScreen()
              : ListView.separated(
                  itemCount: controller.companySavedJobList.length,
                  shrinkWrap: true,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return OtherCompanyJobCard(
                      isFromSaveJob: true,
                      onTap: () {
                        CacheService.boxAuth.write(
                          CacheKeys.jobModel,
                          controller.companySavedJobList[index],
                        );
                        context.pushNamed(
                          Routes.jobDetails,
                          queryParameters: {
                            'isFrom': JobIsFrom.saved.name,
                          },
                        );
                        // Get.toNamed(
                        //   Routes.jobDetails,
                        //   arguments: [
                        //     controller.companySavedJobList[index],
                        //     JobIsFrom.saved
                        //   ],
                        // );
                      },
                      job: controller.companySavedJobList[index],
                    );
                  },
                );
        },
      ),
    );
  }
}
