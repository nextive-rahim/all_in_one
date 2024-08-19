import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/empty_screen.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/widget/company_job_card.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/job-card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyJobBuilder extends GetView<CompanyJobViewController> {
  const CompanyJobBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Obx(
        () {
          if (controller.pageState == PageState.loading) {
            return const JobCardLoading();
          }
          return controller.myJobList.isEmpty
              ? const EmptyScreen()
              : ListView.separated(
                  reverse: true,
                  padding: const EdgeInsets.only(bottom: 00),
                  itemCount: controller.myJobList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return CompanyJobCard(job: controller.myJobList[index]);
                  },
                );
        },
      ),
    );
  }
}
