import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/view/job_details_page_mobile.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OtherCompanyJobsBuilder extends StatelessWidget {
  const OtherCompanyJobsBuilder({
    super.key,
    required this.otherCompany,
  });
  final List<JobModel> otherCompany;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: otherCompany.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (context, index) {
        return JobCard(
          onTap: () {
            Get.toNamed(
              Routes.jobDetails,
              arguments: [otherCompany[index], true, JobIsFrom.all],
            );
          },
          job: otherCompany[index],
        );
      },
    );
  }
}
