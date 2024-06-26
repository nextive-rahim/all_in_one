import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/empty_screen.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/applied_jobs_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/job-card_loading.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppliedTab extends GetView<AppliedJobsViewController> {
  const AppliedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: RefreshIndicator(
        onRefresh: () async {
          controller.appliedjobList();
        },
        child: Obx(
          () {
            if (controller.pageState == PageState.loading) {
              return const JobCardLoading();
            }
            return controller.appiedJobList.isEmpty
                ? const EmptyScreen()
                : ListView.separated(
                    itemCount: controller.appiedJobList.length,
                    shrinkWrap: true,
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    itemBuilder: (context, index) {
                      return JobCard(
                        // onTap: () {
                        //   Get.toNamed(Routes.jobDetails,
                        //       arguments: controller.appiedJobList[index]);
                        // },
                        job: controller.appiedJobList[index],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
