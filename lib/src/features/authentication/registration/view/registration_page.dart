import 'package:all_in_one/src/core/extension/sizebox_extension.dart';
import 'package:all_in_one/src/core/extension/text_extension.dart';
import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/validators/input_form_validators.dart';
import 'package:all_in_one/src/core/widgets/primary_button.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/authentication/registration/controller/registration_view_controller.dart';
import 'package:all_in_one/src/features/skill/controller/skill_controller.dart';
import 'package:all_in_one/src/features/skill/widget/skill-builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'dart:io' show Platform;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({
    super.key,
  });

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  bool hintUsernameHelperText = false,
      hintPasswordHelperText = false,
      hintConfirmPasswordHelperText = false;
  final controller = Get.find<RegistrationViewController>();
  final skillController = Get.find<SkillViewController>();
  @override
  void initState() {
    skillController.getSkills();
    super.initState();
  }

  final SizeConfig _sizeConfig = SizeConfig();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1000) {
        return _forMobile();
      } else {
        return _forWeb();
      }
    });

    // return SafeArea(
    //     child: Scaffold(
    //         backgroundColor: CommonColor.whiteColor,
    //         body: (defaultTargetPlatform == TargetPlatform.iOS ||
    //                 defaultTargetPlatform == TargetPlatform.android)
    //             ? _forMobile()
    //             : _forWeb()));
  }

  Widget _forMobile() {
    return Scaffold(
      backgroundColor: CommonColor.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(children: [
              MediaQuery.of(context).viewInsets.bottom > 0
                  ? _headerIsMounted()
                  : _headerNotMounted(),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CommonColor.whiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: CommonColor.greyColor,
                      blurRadius: 0.5,
                      spreadRadius: 0.1,
                      offset: Offset(
                        0.0, // Move to right 7.0 horizontally
                        0.0, // Move to bottom 8.0 Vertically
                      ),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OutlinedInputField(
                        labelText: AppStrings.username,
                        controller: controller.userNameController,
                        hintText: AppStrings.hitTextUsername,
                        validator: InputFieldValidator.email(),
                      ),
                      OutlinedInputField(
                        labelText: AppStrings.name,
                        controller: controller.nameController,
                        hintText: AppStrings.nameHint,
                        validator: InputFieldValidator.name(),
                      ),
                      OutlinedInputField(
                        labelText: AppStrings.phoneNumber,
                        controller: controller.phoneNumberController,
                        hintText: AppStrings.phoneNumberHint,
                      ),
                      InkWell(
                        onTap: () {
                          _showError(const SkillBuilder(),
                              title: "Selecte Skills");
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Skills',
                              style: AppTextStyle.medium14
                                  .copyWith(color: AppColors.black),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: .5,
                                  color: AppColors.lightBlack40,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Obx(() => controller
                                            .selectedSkillIdList.isEmpty
                                        ? const Text(
                                            'Select Skills',
                                            style: TextStyle(
                                                color:
                                                    CommonColor.hintTextColor),
                                          )
                                        : Text(List<String>.generate(
                                            controller
                                                .selectedSkillNameList.length,
                                            (int index) => controller
                                                    .selectedSkillNameList[
                                                index]).toString())),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      10.sh,
                      OutlinedInputField(
                        labelText: AppStrings.password,
                        controller: controller.passwordController,
                        hintText: AppStrings.password,
                        validator: InputFieldValidator.password(),
                        onChanged: (v) {
                          if (v.isEmpty || v.length >= 6) {
                            setState(() {});
                          }
                        },
                      ),
                      OutlinedInputField(
                        labelText: AppStrings.confirmPassword,
                        controller: controller.confirmPasswordController,
                        hintText: AppStrings.confirmPassword,
                        validator: InputFieldValidator.confirmPassword(
                          password: controller.passwordController.text,
                          optional: controller.passwordController.text.isEmpty,
                        ),
                        onChanged: (v) {
                          if (v.isEmpty || v.length >= 6) {
                            setState(() {});
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      Obx(
                        () => PrimaryButton(
                          isLoading: controller.pageState == PageState.loading,
                          onTap: onTap,
                          widget: const Text(AppStrings.createMyAccount)
                              .fontSize(16)
                              .bold(FontWeight.w600)
                              .color(AppColors.white),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 41),
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
                      const SizedBox(
                        width: 8,
                      ),
                      const TextWidget(
                          text: AppStrings.termsOfUse,
                          color: CommonColor.headingTextColor1,
                          maxLine: 1,
                          fontFamily: AppStrings.aeonikTRIAL,
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
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
                      const SizedBox(
                        width: 8,
                      ),
                      const TextWidget(
                          text: AppStrings.dataCollectionRights,
                          color: CommonColor.headingTextColor1,
                          maxLine: 1,
                          fontFamily: AppStrings.aeonikTRIAL,
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
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
                      const SizedBox(
                        width: 8,
                      ),
                      const TextWidget(
                          text: AppStrings.privacyAndPolicy,
                          color: CommonColor.headingTextColor1,
                          maxLine: 1,
                          fontFamily: AppStrings.aeonikTRIAL,
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const TextWidget(
                  text: AppStrings.appVersion,
                  color: CommonColor.lightGreyForText1,
                  maxLine: 1,
                  fontFamily: AppStrings.aeonikTRIAL,
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
              const SizedBox(
                height: 22,
              ),
            ]),
          ),
        )),
      ),
    );
  }

  Widget _forWeb() {
    return Scaffold(
      backgroundColor: CommonColor.whiteColor,
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: _sizeConfig.width * 0.56,
              height: _sizeConfig.height,
              child: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.only(
                    left: _sizeConfig.getSize(80),
                    right: _sizeConfig.getSize(108),
                    top: _sizeConfig.getSize(74),
                    bottom: _sizeConfig.getSize(28)),
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          ImageConstant.appLogo,
                          height: _sizeConfig.getSize(195),
                          width: _sizeConfig.getSize(202),
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: _sizeConfig.getSize(22),
                        ),
                        TextWidget(
                            text: AppStrings.registration,
                            color: CommonColor.headingTextColor1,
                            maxLine: 1,
                            fontFamily: AppStrings.aeonikTRIAL,
                            fontWeight: FontWeight.w400,
                            fontSize: _sizeConfig.getFontSize(60)),
                        SizedBox(
                          height: _sizeConfig.getSize(10),
                        ),
                        TextWidget(
                            text: AppStrings.welcomeMsgReg,
                            color: CommonColor.headingTextColor1,
                            maxLine: 1,
                            fontFamily: AppStrings.sfProDisplay,
                            fontWeight: FontWeight.w400,
                            fontSize: _sizeConfig.getFontSize(30)),
                        SizedBox(
                          height: _sizeConfig.getSize(43),
                        ),
                        Container(
                          width: _sizeConfig.getSize(618),
                          // height: _sizeConfig.getSize(455),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CommonColor.whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                color: CommonColor.greyColor,
                                blurRadius: 0.5,
                                spreadRadius: 0.1,
                                offset: Offset(
                                  0.0, // Move to right 7.0 horizontally
                                  0.0, // Move to bottom 8.0 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(21.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextWidget(
                                    text: AppStrings.username,
                                    color: CommonColor.headingTextColor2,
                                    maxLine: 1,
                                    fontFamily: AppStrings.inter,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormFieldWidget(
                                  isEmailField: true,
                                  controller: controller.nameController,
                                  valtext: AppStrings.commonTextVal,
                                  height: 45,
                                  hintText: AppStrings.name,
                                  readOnly: false,
                                  maxLine: 1,
                                  keyType: TextInputType.text,
                                  wordLimit: 25,
                                  fontFamily: AppStrings.inter,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  onChanged: (value) {},
                                  suffixIcon: const Icon(
                                    Icons.help_outline,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                  onSuffixTap: () {
                                    setState(() {
                                      // hintUsernameHelperText =
                                      //     !hintUsernameHelperText;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                // Visibility(
                                //   visible: hintUsernameHelperText,
                                //   child: const TextWidget(
                                //       text: AppStrings.hintTextToHelpUser,
                                //       color: CommonColor.hintTextColor,
                                //       maxLine: 1,
                                //       fontFamily: AppStrings.inter,
                                //       fontWeight: FontWeight.w400,
                                //       fontSize: 14),
                                // ),
                                const SizedBox(
                                  height: 23,
                                ),
                                const TextWidget(
                                    text: AppStrings.username,
                                    color: CommonColor.headingTextColor2,
                                    maxLine: 1,
                                    fontFamily: AppStrings.inter,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormFieldWidget(
                                  isEmailField: true,
                                  controller: controller.userNameController,
                                  valtext: AppStrings.commonTextVal,
                                  height: 45,
                                  hintText: AppStrings.hitTextUsername,
                                  readOnly: false,
                                  maxLine: 1,
                                  keyType: TextInputType.text,
                                  wordLimit: 25,
                                  fontFamily: AppStrings.inter,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  onChanged: (value) {},
                                  suffixIcon: const Icon(
                                    Icons.help_outline,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                  onSuffixTap: () {
                                    setState(() {
                                      hintUsernameHelperText =
                                          !hintUsernameHelperText;
                                    });
                                  },
                                ),
                                const SizedBox(height: 6),
                                Visibility(
                                  visible: hintUsernameHelperText,
                                  child: const TextWidget(
                                    text: AppStrings.hintTextToHelpUser,
                                    color: CommonColor.hintTextColor,
                                    maxLine: 1,
                                    fontFamily: AppStrings.inter,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 23),
                                const TextWidget(
                                    text: AppStrings.password,
                                    color: CommonColor.headingTextColor2,
                                    maxLine: 1,
                                    fontFamily: AppStrings.inter,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                const SizedBox(height: 5),
                                TextFormFieldWidget(
                                  controller: controller.passwordController,
                                  valtext: AppStrings.commonTextVal,
                                  obscureText: true,
                                  height: 45,
                                  hintText: AppStrings.passHintText,
                                  readOnly: false,
                                  maxLine: 1,
                                  keyType: TextInputType.visiblePassword,
                                  wordLimit: 25,
                                  fontFamily: AppStrings.inter,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  onChanged: (value) {},
                                  suffixIcon: const Icon(
                                    Icons.help_outline,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                  onSuffixTap: () {
                                    setState(() {
                                      hintPasswordHelperText =
                                          !hintPasswordHelperText;
                                    });
                                  },
                                ),
                                const SizedBox(height: 6),
                                Visibility(
                                  visible: hintPasswordHelperText,
                                  child: const TextWidget(
                                      text: AppStrings.hintTextToHelpUser,
                                      color: CommonColor.hintTextColor,
                                      maxLine: 1,
                                      fontFamily: AppStrings.inter,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 23,
                                ),
                                const TextWidget(
                                    text: AppStrings.confirmPassword,
                                    color: CommonColor.headingTextColor2,
                                    maxLine: 1,
                                    fontFamily: AppStrings.inter,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormFieldWidget(
                                  controller:
                                      controller.confirmPasswordController,
                                  valtext: AppStrings.commonTextVal,
                                  obscureText: true,
                                  height: 45,
                                  hintText: AppStrings.confirmYourPassword,
                                  readOnly: false,
                                  maxLine: 1,
                                  keyType: TextInputType.visiblePassword,
                                  wordLimit: 25,
                                  fontFamily: AppStrings.inter,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  onChanged: (value) {},
                                  suffixIcon: const Icon(
                                    Icons.help_outline,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                  onSuffixTap: () {
                                    setState(() {
                                      hintConfirmPasswordHelperText =
                                          !hintConfirmPasswordHelperText;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Visibility(
                                  visible: hintConfirmPasswordHelperText,
                                  child: const TextWidget(
                                      text: AppStrings.hintTextToHelpUser,
                                      color: CommonColor.hintTextColor,
                                      maxLine: 1,
                                      fontFamily: AppStrings.inter,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: onTap,
                                  child: Container(
                                    width: 267,
                                    height: 60,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: CommonColor.headingTextColor1),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextWidget(
                                          text: AppStrings.createMyAccount,
                                          color: CommonColor.whiteColor,
                                          maxLine: 1,
                                          fontFamily: AppStrings.inter,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                        SizedBox(width: 13),
                                        Icon(
                                          Icons.check_circle_outline_outlined,
                                          size: 22,
                                          color: CommonColor.whiteColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: _sizeConfig.getSize(67),
                        ),
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
                                const SizedBox(
                                  width: 8,
                                ),
                                TextWidget(
                                    text: AppStrings.termsOfUse,
                                    color: CommonColor.headingTextColor1,
                                    maxLine: 1,
                                    fontFamily: AppStrings.aeonikTRIAL,
                                    fontWeight: FontWeight.w400,
                                    fontSize: _sizeConfig.getFontSize(12)),
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
                                const SizedBox(
                                  width: 8,
                                ),
                                TextWidget(
                                    text: AppStrings.dataCollectionRights,
                                    color: CommonColor.headingTextColor1,
                                    maxLine: 1,
                                    fontFamily: AppStrings.aeonikTRIAL,
                                    fontWeight: FontWeight.w400,
                                    fontSize: _sizeConfig.getFontSize(12)),
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
                                const SizedBox(
                                  width: 8,
                                ),
                                TextWidget(
                                    text: AppStrings.privacyAndPolicy,
                                    color: CommonColor.headingTextColor1,
                                    maxLine: 1,
                                    fontFamily: AppStrings.aeonikTRIAL,
                                    fontWeight: FontWeight.w400,
                                    fontSize: _sizeConfig.getFontSize(12)),
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
                                const SizedBox(
                                  width: 8,
                                ),
                                TextWidget(
                                    text: AppStrings.customerSupport,
                                    color: CommonColor.headingTextColor1,
                                    maxLine: 1,
                                    fontFamily: AppStrings.aeonikTRIAL,
                                    fontWeight: FontWeight.w400,
                                    fontSize: _sizeConfig.getFontSize(12)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _sizeConfig.getSize(22),
                        ),
                      ]),
                ),
              )),
            ),
            Expanded(
                child: Container(
              color: CommonColor.lightGreyForText1,
              child: Image.asset(
                ImageConstant.registerWebExpended,
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                fit: BoxFit.fill,
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _headerIsMounted() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          ImageConstant.appLogo,
          height: 50,
          width: 50,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          width: 18,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                text: AppStrings.registration,
                color: CommonColor.headingTextColor1,
                maxLine: 1,
                fontFamily: AppStrings.aeonikTRIAL,
                fontWeight: FontWeight.w700,
                fontSize: 20),
            SizedBox(
              height: 10,
            ),
            TextWidget(
                text: AppStrings.welcomeMsgReg,
                color: CommonColor.headingTextColor1,
                maxLine: 1,
                fontFamily: AppStrings.sfProDisplay,
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ],
        )
      ],
    );
  }

  Widget _headerNotMounted() {
    return Column(
      children: [
        Container(
          width: SizeConfig.screenWidth,
          alignment: Alignment.center,
          child: Image.asset(
            ImageConstant.appLogo,
            height: 75,
            width: 75,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        const TextWidget(
            text: AppStrings.registration,
            color: CommonColor.headingTextColor1,
            maxLine: 1,
            fontFamily: AppStrings.aeonikTRIAL,
            fontWeight: FontWeight.w700,
            fontSize: 28),
        const SizedBox(
          height: 10,
        ),
        const TextWidget(
            text: AppStrings.welcomeMsgReg,
            color: CommonColor.headingTextColor1,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w400,
            fontSize: 18),
      ],
    );
  }

  void onTap() {
    controller.registration(_formKey, Get.arguments).then((value) {
      if (controller.signupModel!.success == false) {
        Get.snackbar(
          AppStrings.failed,
          AppStrings.registrationFailedMessage,
          borderColor: CommonColor.redColors,
          borderWidth: 1,
        );
      } else {
        Get.snackbar(
          AppStrings.success,
          AppStrings.registrationSuccessfulMessage,
        );
        Get.offNamed(Routes.registrationCompleted);
      }
    });
  }

  void _showError(Widget message, {String? title}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? 'Select Items'),
          content: message,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cencle'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Confirm'),
            )
          ],
        );
      },
    );
  }
}
