part of '../view/all_interview_section_mobile.dart';

class InterViewCard extends StatelessWidget {
  const InterViewCard({
    super.key,
    required this.index,
    required this.interview,
    this.isFormRequestsInterviews = false,
    this.isFormConfirmInterviews = false,
    this.isFormCompletedInterviews = false,
    this.isExpaired = false,
  });
  final int index;
  final ViewInterviewResponseData interview;
  final bool isFormRequestsInterviews;
  final bool isFormConfirmInterviews;
  final bool isFormCompletedInterviews;
  final bool isExpaired;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            if (isExpaired && isFormRequestsInterviews) {
              Util.displayErrorToast(
                context,
                'Acceptance timed out',
              );
              return;
            }
            isFormRequestsInterviews
                ? Get.toNamed(
                    Routes.selecteInterviewFormConfirmation,
                    arguments: interview,
                  )
                : null;
          },
          child: Container(
            width: SizeConfig.screenWidth,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 2,
                  color: CommonColor.greyColor18,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: interview.title ?? '',
                    color: CommonColor.blackColor2,
                    maxLine: 1,
                    fontFamily: AppStrings.sfProDisplay,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      interview.status == 1
                          ? Text(
                              '(${interview.timeSlotA ?? ''} , ${interview.timeSlotB})')
                          : Text(interview.approvedSlotA == 1
                              ? interview.timeSlotA.toString()
                              : interview.timeSlotB.toString()),
                      const SizedBox(width: 10),
                      Text(getFormattedDate(interview.date) ?? ''),
                    ],
                  ),
                  isFormCompletedInterviews
                      ? InterviewFeedbackCard(interview: interview)
                      : const Offstage(),
                  isFormConfirmInterviews
                      ? InterviewLinkButton(interview: interview)
                      : const Offstage(),
                  const SizedBox(height: 5),
                  isExpaired && isFormRequestsInterviews
                      ? const Text(
                          'Expaired',
                          style: TextStyle(color: CommonColor.redColors),
                        )
                      : const Offstage(),
                  !isExpaired && isFormConfirmInterviews
                      ? Text(
                          interview.remainingDayForFormFillUp,
                          style: TextStyle(
                              color: interview.remainingDayForFormFillUp ==
                                      'Available Now'
                                  ? CommonColor.greenColor1
                                  : CommonColor.redColors),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
