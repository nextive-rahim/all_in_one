import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/job_card.dart';
import 'package:flutter/material.dart';

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
          // onTap: () {
          //   Get.toNamed(
          //     Routes.jobDetails,
          //     arguments: otherCompany[index],
          //   );
          // },
          job: otherCompany[index],
        );
      },
    );
  }
}
