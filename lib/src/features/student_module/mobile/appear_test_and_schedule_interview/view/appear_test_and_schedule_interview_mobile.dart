import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/formated_date_time.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/controller/exam_link_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/widget/exam_link_section.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/widget/interview_request_section.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/widget/submit_exam_result_link_section.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/widget/supmit_portfolio_link_section.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppearTestAndScheduleInterviewMobilePage extends StatefulWidget {
  const AppearTestAndScheduleInterviewMobilePage({
    super.key,
  });

  @override
  State<AppearTestAndScheduleInterviewMobilePage> createState() =>
      _AppearTestAndScheduleInterviewMobilePageState();
}

class _AppearTestAndScheduleInterviewMobilePageState
    extends State<AppearTestAndScheduleInterviewMobilePage> {
  final CourseModel collectinListData = Get.arguments[0];
  final Function onLogout = Get.arguments[1];

  final _timeSlotAController = TextEditingController();
  final _timeSlotBController = TextEditingController();

  String? editorResult = '',
      _chooseDateForApi = '',
      selectedTimeA = '',
      selectedTimeB = '';

  // YoutubePlayerController? _controller;
  String dropdownValue = AppStrings.courseLevelDropdown.first;
  final examController = Get.find<ExamLinkViewController>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      examController.getExam(collectinListData.id.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CommonColor.whiteColor,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            AppStrings.testYourSkills,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 0,
              right: 17,
              left: 20,
              bottom: 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ExamLinkSection(),
                const SizedBox(height: 40),
                SubmitExamResultLinkSection(course: collectinListData),
                const SizedBox(height: 40),
                const SubmitPortfolioLinkSection(),
                const SizedBox(height: 40),
                InterviewRequestSection(course: collectinListData),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ));
  }

  Future<bool> requestSubmittedBottomSheet(String msg) async {
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
                            SizedBox(
                              height: SizeConfig.screenWidth! * 0.25,
                            ),
                            Image.asset(
                              ImageConstant.requestSubmitted,
                              height: 117,
                              width: SizeConfig.screenWidth,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(height: 40),
                            TextWidget(
                              text: msg, //AppStrings.requestSubmitted,
                              color: CommonColor.blackColor1,
                              maxLine: 2,
                              fontFamily: AppStrings.aeonikTRIAL,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center,
                              fontSize: 24,
                            ),
                            const SizedBox(height: 40),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: FormatedDateTime.formatedDateTime1(
                                        _chooseDateForApi ?? '',
                                        inputFormat: "yyyy-MM-dd",
                                        outputFormat:
                                            "yMMMMd"), //'26th May 2023',
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
                                    text:
                                        _timeSlotAController.text, //'9:00 AM ',
                                    style: const TextStyle(
                                      color: CommonColor.blackColor1,
                                      fontSize: 18,
                                      fontFamily: AppStrings.sfProDisplay,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' or ',
                                    style: TextStyle(
                                      color: CommonColor.blackColor1,
                                      fontSize: 18,
                                      fontFamily: AppStrings.sfProDisplay,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: _timeSlotBController
                                        .text, //' 10:00 AM',
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
                            const SizedBox(height: 18),
                            const TextWidget(
                              text: AppStrings.wishYouAllTheBest,
                              color: CommonColor.blackColor2,
                              maxLine: 1,
                              fontFamily: AppStrings.aeonikTRIAL,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                            const SizedBox(height: 70),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
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
