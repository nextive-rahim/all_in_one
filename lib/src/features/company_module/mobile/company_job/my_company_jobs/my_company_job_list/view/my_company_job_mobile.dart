import 'package:all_in_one/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/widget/company_job_builder.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/post_new_job/widget/post_company_job_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCompanyJobListPageMobile extends StatelessWidget {
  const MyCompanyJobListPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyJobViewController());
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PostCompanyJob(),
        CompanyJobBuilder(),
      ],
    );
  }
}
