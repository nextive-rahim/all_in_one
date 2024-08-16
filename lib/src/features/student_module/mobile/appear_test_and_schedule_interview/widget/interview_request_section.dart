import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/text_date_field.dart';
import 'package:all_in_one/src/core/widgets/text_time_field.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/controller/student_interview_request_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewRequestSection extends StatefulWidget {
  const InterviewRequestSection({
    super.key,
    required this.course,
  });
  final CourseModel course;
  @override
  State<InterviewRequestSection> createState() =>
      _InterviewRequestSectionState();
}

class _InterviewRequestSectionState extends State<InterviewRequestSection> {
  final controller = Get.find<StudentInterviewRequestViewController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            width: SizeConfig.screenWidth,
            height: 1,
            color: CommonColor.greyColor18,
          ),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(
                      color: CommonColor.whiteColor,
                      shape: CircleBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x33000000),
                          blurRadius: 3.75,
                          offset: Offset(0, 1.50),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Image.asset(ImageConstant.userPlus),
                  ),
                  const SizedBox(height: 8),
                  const TextWidget(
                    text: "03",
                    color: CommonColor.greyColor11,
                    maxLine: 1,
                    fontFamily: AppStrings.sfProDisplay,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        text: AppStrings.step03,
                        color: CommonColor.greyColor12,
                        maxLine: 1,
                        fontFamily: AppStrings.sfProDisplay,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                    SizedBox(
                      height: 7,
                    ),
                    TextWidget(
                      text: "${AppStrings.requestForInterview}:",
                      color: CommonColor.blackColor1,
                      maxLine: 2,
                      fontFamily: AppStrings.sfProDisplay,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () {
              if (controller.activeRequistForInterview.value) {
                requestForInterviewBottomSheet();
              } else {
                Util.displayToast(context, "Please submit Project link",
                    CommonColor.redColors);
              }
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
                      width: 0.50, color: CommonColor.borderColor1),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstant.userPlus,
                    color: controller.activeRequistForInterview.value
                        ? CommonColor.blackColor4
                        : CommonColor.textFieldBorderColor,
                  ),
                  const SizedBox(width: 12),
                  TextWidget(
                    text: AppStrings.requestForInterview,
                    color: controller.activeRequistForInterview.value
                        ? CommonColor.blackColor4
                        : CommonColor.greyColor5,
                    maxLine: 1,
                    fontFamily: AppStrings.inter,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> requestForInterviewBottomSheet() async {
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
                            const SizedBox(
                              height: 25,
                            ),
                            const TextWidget(
                              text: AppStrings.requestForInterview,
                              color: CommonColor.blackColor1,
                              maxLine: 1,
                              fontFamily: AppStrings.aeonikTRIAL,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            const SizedBox(height: 10),
                            const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Course:',
                                    style: TextStyle(
                                      color: CommonColor.greyColor6,
                                      fontSize: 16,
                                      fontFamily: AppStrings.sfProDisplay,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' React Native IOS and Android App Development for Beginners(WKM025)\n',
                                    style: TextStyle(
                                      color: CommonColor.greyColor6,
                                      fontSize: 16,
                                      fontFamily: AppStrings.sfProDisplay,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 30),
                                const TextWidget(
                                    text: AppStrings.chooseDate,
                                    color: CommonColor.blackColor4,
                                    maxLine: 1,
                                    fontFamily: AppStrings.inter,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                const SizedBox(height: 7),
                                TextDateFieldWidget(
                                  controller:
                                      controller.dateMonthYearController,
                                  valtext: AppStrings.commonTextVal,
                                  height: 40,
                                  hintText: "16th May , 2023",
                                  readOnly: false,
                                  maxLine: 1,
                                  keyType: TextInputType.text,
                                  wordLimit: 100,
                                  fontFamily: AppStrings.inter,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  onChanged: (value) {
                                    setState(() {
                                      controller.dateMonthYearController.text =
                                          value;
                                    });
                                  },
                                  prefixIcon: const Icon(
                                    Icons.mail_outline_outlined,
                                    color: CommonColor.hintTextColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const TextWidget(
                                  text: AppStrings.preferredTimeSlotA,
                                  color: CommonColor.blackColor4,
                                  maxLine: 1,
                                  fontFamily: AppStrings.inter,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                TextTimeFieldWidget(
                                  controller: controller.timeSlotAController,
                                  valtext: AppStrings.commonTextVal,
                                  height: 40,
                                  hintText: "9:00 AM",
                                  readOnly: false,
                                  maxLine: 1,
                                  keyType: TextInputType.text,
                                  wordLimit: 100,
                                  fontFamily: AppStrings.inter,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  onChanged: (value) {
                                    setState(() {
                                      controller.timeSlotAController.text =
                                          value;
                                    });
                                  },
                                  suffixIcon: const SizedBox(),
                                ),
                                const SizedBox(height: 30),
                                const TextWidget(
                                  text: AppStrings.preferredTimeSlotB,
                                  color: CommonColor.blackColor4,
                                  maxLine: 1,
                                  fontFamily: AppStrings.inter,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                TextTimeFieldWidget(
                                  controller: controller.timeSlotBController,
                                  valtext: AppStrings.commonTextVal,
                                  height: 40,
                                  hintText: "10:00 AM",
                                  readOnly: false,
                                  maxLine: 1,
                                  keyType: TextInputType.text,
                                  wordLimit: 100,
                                  fontFamily: AppStrings.inter,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  onChanged: (value) {
                                    setState(() {
                                      controller.timeSlotBController.text =
                                          value;
                                    });
                                  },
                                  suffixIcon: const SizedBox(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                if (controller
                                        .dateMonthYearController.text.isEmpty ||
                                    controller
                                        .timeSlotAController.text.isEmpty ||
                                    controller
                                        .timeSlotBController.text.isEmpty) {
                                  Get.snackbar(
                                    'Waring',
                                    AppStrings.plzFillAllFields,
                                    backgroundColor: CommonColor.redColors,
                                    colorText: Colors.white,
                                    borderWidth: 1,
                                  );
                                } else {
                                  controller
                                      .interviewRequest(widget.course.id!)
                                      .then(
                                    (value) {
                                      Get.snackbar(
                                        'Successful',
                                        'Successfully submitted interview request',
                                        backgroundColor:
                                            CommonColor.purpleColor1,
                                        colorText: Colors.white,
                                      );
                                      Navigator.pop(context, false);
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
                                  text: AppStrings.requestForInterview,
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
                            const SizedBox(height: 15),
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
