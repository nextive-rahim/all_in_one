import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/model/all_interviews_model.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/selected_interview_details/controller/confirm_interview_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewConfarmationButton extends StatefulWidget {
  const InterviewConfarmationButton({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.interview,
  });
  final String selectedTime;
  final String selectedDate;
  final ViewInterviewResponseData interview;

  @override
  State<InterviewConfarmationButton> createState() =>
      _InterviewConfarmationButtonState();
}

class _InterviewConfarmationButtonState
    extends State<InterviewConfarmationButton> {
  final controller = Get.find<ConfirmInterviewREquestViewController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.confirmInterviewRequest(widget.interview.id!).then((value) {
          // if (controller.responsStatus == false) {
          //   Get.snackbar(
          //     'Failed',
          //     'Interview Not Confirmed',
          //     snackPosition: SnackPosition.TOP,
          //     borderColor: CommonColor.redColors,
          //     borderWidth: 1,
          //   );
          // } else {

          Get.snackbar(
            'Failed',
            'Interview  Confirmed Successfully',
            snackPosition: SnackPosition.TOP,
          );
          interviewConfirmedBottomSheet(
            date: widget.selectedDate,
            time: widget.selectedTime,
          );
          // }
        });
      },
      child: Container(
        width: SizeConfig.screenWidth,
        height: 60,
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: CommonColor.whiteColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.50, color: CommonColor.greyColor5),
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
          text: AppStrings.confirmTimeslot,
          color: CommonColor.blackColor,
          maxLine: 1,
          fontFamily: AppStrings.inter,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }

  Future<bool> interviewConfirmedBottomSheet({
    String? date,
    String? time,
  }) async {
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
                bottom: 20,
              ),
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    height: SizeConfig.screenHeight * 0.85,
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
                        right: 47,
                        left: 47,
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
                            SizedBox(height: SizeConfig.screenWidth! * 0.25),
                            Container(
                              width: 278,
                              height: 177,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      ImageConstant.requestSubmitted),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(height: 47),
                            const TextWidget(
                              text: AppStrings.interviewConfirmed,
                              color: CommonColor.blackColor1,
                              maxLine: 1,
                              fontFamily: AppStrings.aeonikTRIAL,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                            const SizedBox(height: 47),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Interview is scheduled on ',
                                    style: TextStyle(
                                      color: CommonColor.blackColor1,
                                      fontSize: 18,
                                      fontFamily: AppStrings.sfProDisplay,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: date,

                                    ///'26th May 2023',
                                    style: const TextStyle(
                                      color: CommonColor.blackColor1,
                                      fontSize: 18,
                                      fontFamily: AppStrings.sfProDisplay,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' at ',
                                    style: TextStyle(
                                      color: CommonColor.blackColor1,
                                      fontSize: 18,
                                      fontFamily: AppStrings.sfProDisplay,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: time,
                                    style: const TextStyle(
                                      color: CommonColor.blackColor1,
                                      fontSize: 18,
                                      fontFamily: AppStrings.sfProDisplay,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 60),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, true);
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
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    TextWidget(
                                      text: AppStrings.okGotIt,
                                      color: CommonColor.blackColor4,
                                      maxLine: 1,
                                      fontFamily: AppStrings.inter,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const TextWidget(
                              text:
                                  'We’ve sent a reminder to Jhon about your confirmation',
                              color: CommonColor.blackColor2,
                              maxLine: 2,
                              textAlign: TextAlign.center,
                              fontFamily: AppStrings.sfProDisplay,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
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
