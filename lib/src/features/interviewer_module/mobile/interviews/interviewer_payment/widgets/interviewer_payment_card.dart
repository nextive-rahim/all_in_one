import 'package:all_in_one/src/core/extension/string_extension.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/controller/submit_interview_feedback_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/controller/interviewer_payment_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/model/interviewer_payment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewerPaymentCard extends StatelessWidget {
  const InterviewerPaymentCard({
    super.key,
    required this.paymentModel,
    this.isFromCompleted,
  });
  final InterviewerPaymentModel paymentModel;
  final bool? isFromCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Interview Title Need',
                style: AppTextStyle.bold16,
              ),
              const SizedBox(height: 5),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.date_range),
                      const SizedBox(width: 10),
                      Text(getFormattedDate(paymentModel.createdAt)!),
                    ],
                  ),
                  Text(
                    '+ £${paymentModel.amount}',
                    style: AppTextStyle.bold16,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.watch_later_outlined),
                      const SizedBox(width: 10),
                      Text(getFormattedTime(paymentModel.createdAt)!),
                    ],
                  ),
                  Text(
                    '√ ${paymentModel.status == 1 ? 'Peding' : 'Completed'}',
                    style: AppTextStyle.bold16.copyWith(color: AppColors.green),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 10),
                      Text(Get.find<ProfileViewController>().userModel!.name ??
                          '')
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              isFromCompleted == true
                  ? const Offstage()
                  : _FeedBackSection(paymentModel: paymentModel),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeedBackSection extends StatefulWidget {
  const _FeedBackSection({
    required this.paymentModel,
  });
  final InterviewerPaymentModel paymentModel;

  @override
  State<_FeedBackSection> createState() => _FeedBackSectionState();
}

class _FeedBackSectionState extends State<_FeedBackSection> {
  final _interviewFeedbackController = TextEditingController();
  final controller = Get.find<SubmittedInterviewFeedbackViewController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Interviewer Feedback',
              style: AppTextStyle.bold16,
            ),
            GestureDetector(
              onTap: () {
                interviewfeedbackBottomSheet(context);
              },
              child: Image.asset(
                ImageConstant.edit,
                color: CommonColor.purpleColor1,
                width: 20,
                height: 20,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        Text(
          widget.paymentModel.feedbackContent ?? '',
          style: AppTextStyle.bold14.copyWith(color: AppColors.lightBlack80),
        )
      ],
    );
  }

  Future<bool> interviewfeedbackBottomSheet(
    BuildContext context,
    // InterviewerPaymentModel interview,
  ) async {
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
                                  const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${AppStrings.course}: ",
                                          style: TextStyle(
                                            color: CommonColor.blackColor1,
                                            fontSize: 16,
                                            fontFamily: AppStrings.sfProDisplay,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Interview title',
                                          style: TextStyle(
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
                                          text: getFormattedDate(
                                              widget.paymentModel.createdAt),
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
                                  const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${AppStrings.candidateName}: ",
                                          style: TextStyle(
                                            color: CommonColor.blackColor1,
                                            fontSize: 16,
                                            fontFamily: AppStrings.sfProDisplay,
                                            fontWeight: FontWeight.w700,
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
                                  Util.displayErrorToast(
                                      context, AppStrings.plzFillAllFields);
                                } else {
                                  controller
                                      .editFeedback(
                                          widget.paymentModel.feedbackId!,
                                          _interviewFeedbackController.text)
                                      .then((v) {
                                    Navigator.pop(context, true);
                                    Get.find<InterviewerPaymentViewController>()
                                        .getInterviewerPayment();
                                  });
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
