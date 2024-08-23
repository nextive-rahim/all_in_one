import 'package:all_in_one/src/core/extension/string_extension.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/controller/submit_interview_feedback_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/model/all_interviews_model.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/controller/interviewer_payment_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewFeedbackCard extends StatefulWidget {
  const InterviewFeedbackCard({
    super.key,
    required this.interview,
  });
  final ViewInterviewResponseData interview;
  @override
  State<InterviewFeedbackCard> createState() => _InterviewFeedbackCardState();
}

class _InterviewFeedbackCardState extends State<InterviewFeedbackCard> {
  final _interviewFeedbackController = TextEditingController();
  final controller = Get.find<SubmittedInterviewFeedbackViewController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isFeedBackDone = Get.find<InterviewerPaymentViewController>()
          .allPayments
          .any((v) => v.userApplyInterviewId == widget.interview.id);
      return GestureDetector(
        onTap: () {
          interviewfeedbackBottomSheet(widget.interview);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: isFeedBackDone
              ? GestureDetector(
                  onTap: () {
                    // interviewfeedbackBottomSheet(widget.interview,
                    //     isFromEdit: true);
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.done_all,
                        color: CommonColor.greenColor1,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Completed Feedback',
                        style: TextStyle(
                          color: CommonColor.greenColor1,
                        ),
                      )
                    ],
                  ),
                )
              : const Row(
                  children: [
                    Icon(
                      Icons.mode_edit_outline_outlined,
                      color: CommonColor.blueColor1,
                    ),
                    SizedBox(width: 8),
                    TextWidget(
                      text: AppStrings.writeAFeedback,
                      color: CommonColor.blueColor1,
                      maxLine: 1,
                      fontFamily: AppStrings.sfProDisplay,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ],
                ),
        ),
      );
    });
  }

  Future<bool> interviewfeedbackBottomSheet(ViewInterviewResponseData interview,
      {bool? isFromEdit = false}) async {
    return await showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          useRootNavigator: true,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 0,
                right: 0,
                bottom: 0,
              ),
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    height: SizeConfig.screenHeight * 0.88,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 100,
                          offset: Offset(0, 4),
                          spreadRadius: 5,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 15,
                        bottom: 15,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 90,
                              height: 2,
                              color: CommonColor.greyColor18,
                            ),
                            const SizedBox(height: 25),
                            const TextWidget(
                              text: AppStrings.writeInterviewFeedback,
                              color: CommonColor.blackColor1,
                              maxLine: 1,
                              fontFamily: AppStrings.aeonikTRIAL,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: SizeConfig.screenWidth,
                              height: 1,
                              color: CommonColor.greyColor18,
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "${AppStrings.course}: ",
                                          style: TextStyle(
                                            color: CommonColor.blackColor1,
                                            fontSize: 16,
                                            fontFamily: AppStrings.sfProDisplay,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: interview.title,
                                          style: const TextStyle(
                                            color: CommonColor.blackColor1,
                                            fontSize: 16,
                                            fontFamily: AppStrings.sfProDisplay,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "${AppStrings.time}: ",
                                          style: TextStyle(
                                            color: CommonColor.blackColor1,
                                            fontSize: 16,
                                            fontFamily: AppStrings.sfProDisplay,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: interview.timeSlotA,
                                          style: const TextStyle(
                                            color: CommonColor.blackColor1,
                                            fontSize: 16,
                                            fontFamily: AppStrings.sfProDisplay,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "${AppStrings.date}: ",
                                          style: TextStyle(
                                            color: CommonColor.blackColor1,
                                            fontSize: 16,
                                            fontFamily: AppStrings.sfProDisplay,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              getFormattedDate(interview.date),
                                          style: const TextStyle(
                                            color: CommonColor.blackColor1,
                                            fontSize: 16,
                                            fontFamily: AppStrings.sfProDisplay,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "${AppStrings.candidateName}: ",
                                          style: TextStyle(
                                            color: CommonColor.blackColor1,
                                            fontSize: 16,
                                            fontFamily: AppStrings.sfProDisplay,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: interview.username,
                                          style: const TextStyle(
                                            color: CommonColor.blackColor1,
                                            fontSize: 16,
                                            fontFamily: AppStrings.sfProDisplay,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  const TextWidget(
                                    text: AppStrings.interviewFeedback,
                                    color: CommonColor.blackColor2,
                                    maxLine: 1,
                                    fontFamily: AppStrings.sfProDisplay,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                  const SizedBox(height: 7),
                                  TextFormFieldWidget(
                                    controller: _interviewFeedbackController,
                                    valtext: AppStrings.commonTextVal,
                                    height: 40,
                                    hintText: "Enter interview feedback...",
                                    hintTextColor: CommonColor.greyColor8,
                                    readOnly: false,
                                    maxLine: 10,
                                    keyType: TextInputType.text,
                                    wordLimit: 300,
                                    fontFamily: AppStrings.sfProDisplay,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    onChanged: (value) {
                                      setState(() {
                                        // pastlink2Text = value;
                                      });
                                    },
                                    suffixIcon: const SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                if (_interviewFeedbackController.text.isEmpty) {
                                  Util.displayToast(
                                      context,
                                      AppStrings.plzFillAllFields,
                                      CommonColor.redColors);
                                } else {
                                  isFromEdit == true
                                      ? controller
                                          .editFeedback(widget.interview.id!,
                                              _interviewFeedbackController.text)
                                          .then((v) {
                                          Navigator.pop(context, true);
                                          Get.find<
                                                  InterviewerPaymentViewController>()
                                              .getInterviewerPayment();
                                        })
                                      : controller
                                          .submittedInterviewFeedBack(
                                          widget.interview.id!,
                                          _interviewFeedbackController.text,
                                        )
                                          .then(
                                          (value) {
                                            Navigator.pop(context, true);
                                            Get.find<
                                                    InterviewerPaymentViewController>()
                                                .getInterviewerPayment();
                                          },
                                        );
                                }
                              },
                              child: Container(
                                width: SizeConfig.screenWidth,
                                height: 60,
                                alignment: Alignment.center,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: CommonColor.blueColor1,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.50,
                                        color: CommonColor.blueColor1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: CommonColor.blackColor3,
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: const TextWidget(
                                  text: AppStrings.submitFeedback,
                                  color: CommonColor.whiteColor,
                                  maxLine: 1,
                                  fontFamily: AppStrings.inter,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, false);
                              },
                              child: Container(
                                width: SizeConfig.screenWidth,
                                height: 60,
                                alignment: Alignment.center,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.50,
                                        color: CommonColor.greyColor5),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: CommonColor.blackColor3,
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: const TextWidget(
                                  text: AppStrings.cancel,
                                  color: CommonColor.blackColor4,
                                  maxLine: 1,
                                  fontFamily: AppStrings.inter,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ) ??
        false; //if showDialouge had returned null, then return false
  }
}
