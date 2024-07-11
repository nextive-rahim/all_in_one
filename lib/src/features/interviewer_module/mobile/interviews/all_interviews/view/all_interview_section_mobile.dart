import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/common_tab_section.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/controller/All_interviews_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/all_interviews_builder.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/completed_interview_builder.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/confirmed_interview_builder.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/interview_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllInterviewsSection extends GetView<AllInterviewsViewController> {
  const AllInterviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 0,
            left: 15,
            right: 15,
            bottom: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () {
                  if (controller.pageState == PageState.loading) {
                    return const InterviewCardLoading();
                  }
                  return CommonTabSection(
                    firstTabViewItems: [
                      AllInterviewsBuilder(interviews: controller.allnterviews),
                    ],
                    secondTabViewItems: [
                      ConfirmInterviewsBuilder(
                          interviews: controller.allnterviews)
                    ],
                    thirdTabViewItems: [
                      CompletedInterviewsBuilder(
                          interviews: controller.allnterviews),
                    ],
                    title1: 'Interviews Request',
                    title2: 'Confirmed Interviews',
                    title3: 'Completed Interviews',
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
