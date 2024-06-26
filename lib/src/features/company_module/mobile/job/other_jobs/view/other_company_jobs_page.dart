import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/empty_screen.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/other_jobs/widget/other_company_jobs_builder.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/job-card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class OtherCompanyJobPage extends GetView<OtherCompanyJobsViewController> {
  const OtherCompanyJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.pageState == PageState.loading) {
          return const JobCardLoading();
        }
        return controller.otherCompany.isEmpty
            ? const EmptyScreen()
            : OtherCompanyJobsBuilder(otherCompany: controller.otherCompany);
      },
    );
  }
}
