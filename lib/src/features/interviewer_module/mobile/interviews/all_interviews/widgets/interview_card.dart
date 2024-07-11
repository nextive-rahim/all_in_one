import 'package:all_in_one/src/core/extension/string_extension.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/model/all_interviews_model.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/completed_interview_card.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/confirmed_interview_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class InterViewCard extends StatefulWidget {
  const InterViewCard({
    super.key,
    required this.index,
    required this.interview,
    this.isFormRequestsInterviews = false,
    this.isFormConfirmInterviews = false,
    this.isFormCompletedInterviews = false,
  });
  final int index;
  final ViewInterviewResponseData interview;
  final bool isFormRequestsInterviews;
  final bool isFormConfirmInterviews;
  final bool isFormCompletedInterviews;
  @override
  State<InterViewCard> createState() => _InterViewCardState();
}

class _InterViewCardState extends State<InterViewCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            widget.isFormRequestsInterviews
                ? Get.toNamed(
                    Routes.selecteInterviewFormConfirmation,
                    arguments: widget.interview,
                  )
                : null;
          },
          child: Container(
            width: SizeConfig.screenWidth,
            decoration: ShapeDecoration(
              //color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 2,
                  color: CommonColor.greyColor18,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 24,
                bottom: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: widget.interview.title ?? '',
                    color: CommonColor.blackColor2,
                    maxLine: 1,
                    fontFamily: AppStrings.sfProDisplay,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(widget.interview.timeSlotA ?? '9.30 PM'),
                      const SizedBox(width: 10),
                      Text(getFormattedDate(widget.interview.date) ?? ''),
                    ],
                  ),
                  widget.isFormCompletedInterviews
                      ? InterviewFeedbackCard(interview: widget.interview)
                      : const Offstage(),
                  widget.isFormConfirmInterviews
                      ? const InterviewLinkCard()
                      : const Offstage(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
