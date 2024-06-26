import 'package:all_in_one/src/features/company_module/mobile/job/my_company_jobs/my_company_job_list/widget/company_job_builder.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/post_new_job/widget/post_company_job_card.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCompanyJobListPageMobile extends StatefulWidget {
  const MyCompanyJobListPageMobile({super.key});

  @override
  State<MyCompanyJobListPageMobile> createState() =>
      _MyCompanyJobListPageMobileState();
}

class _MyCompanyJobListPageMobileState
    extends State<MyCompanyJobListPageMobile> {
  @override
  void initState() {
    Get.put(JobsViewController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PostCompanyJob(),
        CompanyJobBuilder(),
      ],
    );
  }
}
