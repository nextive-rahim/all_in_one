import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/widgets/empty_screen.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/view/job_details_page_mobile.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedJobsTab extends GetView<JobsViewController> {
  const SavedJobsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Obx(
        () {
          // if (controller.pageState == PageState.loading) {
          //   return const JobCardLoading();
          // }
          return controller.savedJobList.isEmpty
              ? const EmptyScreen()
              : ListView.separated(
                  itemCount: controller.savedJobList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return JobCard(
                      isFromSaveJob: true,
                      onTap: () {
                        Get.toNamed(
                          Routes.jobDetails,
                          arguments: [
                            controller.savedJobList[index],
                            false,
                            JobIsFrom.saved
                          ],
                        );
                      },
                      job: controller.savedJobList[index],
                    );
                  },
                );
        },
      ),
    );
  }
}
