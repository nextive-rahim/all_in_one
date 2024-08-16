part of '../view/all_interview_section_mobile.dart';

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
                      widget.interview.status == 1
                          ? Text(
                              '(${widget.interview.timeSlotA ?? ''} , ${widget.interview.timeSlotB})')
                          : Text(widget.interview.approvedSlotA.toString()),
                      const SizedBox(width: 10),
                      Text(getFormattedDate(widget.interview.date) ?? ''),
                    ],
                  ),
                  widget.isFormCompletedInterviews
                      ? InterviewFeedbackCard(interview: widget.interview)
                      : const Offstage(),
                  widget.isFormConfirmInterviews
                      ? InterviewLinkButton(interview: widget.interview)
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
