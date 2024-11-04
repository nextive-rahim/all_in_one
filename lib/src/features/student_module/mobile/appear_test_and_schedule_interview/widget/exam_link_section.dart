import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/controller/exam_link_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ExamLinkSection extends GetView<ExamLinkViewController> {
  const ExamLinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.pageState == PageState.loading) {
          return const CircularProgressIndicator();
        }
        return Column(
          children: [
            const SizedBox(height: 15),
            Container(
              height: 1,
              color: CommonColor.greyColor18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
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
                            color: CommonColor.blueColor1,
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
                          child: Image.asset(ImageConstant.link3),
                        ),
                        const SizedBox(height: 8),
                        const TextWidget(
                          text: "01",
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
                            text: AppStrings.step01,
                            color: CommonColor.greyColor12,
                            maxLine: 1,
                            fontFamily: AppStrings.sfProDisplay,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          SizedBox(height: 7),
                          TextWidget(
                            text: AppStrings.openYourTestLinkBrowser,
                            color: CommonColor.blackColor1,
                            maxLine: 2,
                            fontFamily: AppStrings.sfProDisplay,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              Icon(
                                Icons.lock_outline_rounded,
                                size: 12,
                                color: CommonColor.greenColor1,
                              ),
                              TextWidget(
                                text: AppStrings
                                    .allLinksAreSafeAndVerifiedByOurTeam,
                                color: CommonColor.greyColor6,
                                maxLine: 2,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  height: 62,
                  decoration: ShapeDecoration(
                    color: CommonColor.greyColor18,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 7,
                      bottom: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: TextWidget(
                            text: controller.examLinkDataList[0].url ?? '',
                            underline: TextDecoration.underline,
                            color: CommonColor.blue300,
                            maxLine: 2,
                            fontFamily: AppStrings.sfProDisplay,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await launch(
                                controller.examLinkDataList[0].url ?? '');
                          },
                          child: Container(
                            width: 52.46,
                            height: 44,
                            padding: const EdgeInsets.all(12),
                            clipBehavior: Clip.antiAlias,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.50, color: CommonColor.greyColor5),
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
                            child: Image.asset(
                              ImageConstant.link2,
                              height: 15,
                              width: 15,
                              color: CommonColor.blueColor1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
