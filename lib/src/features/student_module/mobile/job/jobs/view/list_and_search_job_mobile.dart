import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/widgets/common_tab_section.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/all_jobs_tab.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/applied_jobs_tab.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/widgets/saved_job_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListAndSearchJobStudentMobile extends GetView<JobsViewController> {
  const ListAndSearchJobStudentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColor.greyColor1,
        body: RefreshIndicator(
          onRefresh: () async {
            controller.getjobList();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                // top: 30,
              ),
              child: Column(
                children: [
                  Container(
                    color: CommonColor.greyColor15,
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 60,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonTabSection(
                            title1: 'All Jobs',
                            title2: 'Saved Jobs',
                            title3: 'Applied jobs',
                            firstTabViewItems: [AllJobsTab()],
                            secondTabViewItems: [SavedJobsTab()],
                            thirdTabViewItems: [AppliedTab()],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
