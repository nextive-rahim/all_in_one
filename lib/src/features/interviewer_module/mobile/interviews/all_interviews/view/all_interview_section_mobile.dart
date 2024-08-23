import 'package:all_in_one/src/core/extension/string_extension.dart';
import 'package:all_in_one/src/core/gobal_function.dart';
import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/text_style.dart';
import 'package:all_in_one/src/core/widgets/common_tab_section.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/controller/All_interviews_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/model/all_interviews_model.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/completed_interview_card.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/interview_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part '../widgets/all_interviews_builder.dart';
part '../widgets/completed_interview_builder.dart';
part '../widgets/confirmed_interview_builder.dart';
part '../widgets/interview_card.dart';
part '../widgets/interview_link_button.dart';

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
                  return const CommonTabSection(
                    firstTabViewItems: [AllInterviewsBuilder()],
                    secondTabViewItems: [ConfirmInterviewsBuilder()],
                    thirdTabViewItems: [CompletedInterviewsBuilder()],
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
