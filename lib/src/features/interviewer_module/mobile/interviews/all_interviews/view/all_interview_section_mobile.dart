import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/common_tab_section.dart';
import 'package:all_in_one/src/core/widgets/mobile/student_app_bar.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/controller/All_interviews_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/all_interviews_builder.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/completed_interview_builder.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/confirmed_interview_builder.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/interview_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllInterviewsSection extends GetView<AllInterviewsViewController> {
  AllInterviewsSection({super.key}) {
    //controller.getAllInterviews();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 15,
            right: 15,
            bottom: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTabSection(
                firstTabViewItems: [
                  Obx(() {
                    if (controller.pageState == PageState.loading) {
                      return const InterviewCardLoading();
                    }
                    return AllInterviewsBuilder(
                        interviews: controller.allnterviews);
                  })
                ],
                secondTabViewItems: [
                  Obx(() {
                    if (controller.pageState == PageState.loading) {
                      return const InterviewCardLoading();
                    }
                    return ConfirmInterviewsBuilder(
                        interviews: controller.allnterviews);
                  })
                ],
                thirdTabViewItems: [
                  Obx(() {
                    if (controller.pageState == PageState.loading) {
                      return const InterviewCardLoading();
                    }
                    return CompletedInterviewsBuilder(
                        interviews: controller.allnterviews);
                  })
                ],
                title1: 'Interviews Request',
                title2: 'Confirmed Interviews',
                title3: 'Completed Interviews',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
