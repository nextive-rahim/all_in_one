import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationCompletedPage extends StatefulWidget {
  const RegistrationCompletedPage({super.key});

  @override
  State<RegistrationCompletedPage> createState() =>
      _RegistrationCompletedPageState();
}

class _RegistrationCompletedPageState extends State<RegistrationCompletedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.whiteColor,
      appBar: AppBar(
        title: const Text('Complete Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 46,
                  right: 46,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 92),
                    Image.asset(
                      ImageConstant.regComplete,
                      width: 252,
                      height: 245,
                    ),
                    const SizedBox(height: 30),
                    const TextWidget(
                      text: AppStrings.registrationCompleted,
                      color: CommonColor.headingTextColor1,
                      maxLine: 1,
                      fontFamily: AppStrings.aeonikTRIAL,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    const SizedBox(height: 12),
                    const TextWidget(
                      text: AppStrings.welcomeMsgRegComplete,
                      color: CommonColor.headingTextColor1,
                      maxLine: 2,
                      textAlign: TextAlign.center,
                      fontFamily: AppStrings.aeonikTRIAL,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    const SizedBox(height: 45),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed(Routes.login);
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CommonColor.headingTextColor1),
                        alignment: Alignment.center,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              color: CommonColor.whiteColor,
                            ),
                            SizedBox(width: 12),
                            TextWidget(
                              text: AppStrings.visitDashboard,
                              color: CommonColor.whiteColor,
                              maxLine: 1,
                              fontFamily: AppStrings.inter,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 95),
                  ],
                ),
              ),
              Container(
                width: SizeConfig.screenWidth,
                height: 1,
                color: CommonColor.backgroundColor2,
              ),
              const SizedBox(height: 21),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 3,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: CommonColor.headingTextColor1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const TextWidget(
                        text: AppStrings.termsOfUse,
                        color: CommonColor.headingTextColor1,
                        maxLine: 1,
                        fontFamily: AppStrings.aeonikTRIAL,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 3,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: CommonColor.headingTextColor1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const TextWidget(
                        text: AppStrings.dataCollectionRights,
                        color: CommonColor.headingTextColor1,
                        maxLine: 1,
                        fontFamily: AppStrings.aeonikTRIAL,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 3,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: CommonColor.headingTextColor1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const TextWidget(
                        text: AppStrings.privacyAndPolicy,
                        color: CommonColor.headingTextColor1,
                        maxLine: 1,
                        fontFamily: AppStrings.aeonikTRIAL,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const TextWidget(
                text: AppStrings.appVersion,
                color: CommonColor.lightGreyForText1,
                maxLine: 1,
                fontFamily: AppStrings.aeonikTRIAL,
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}
