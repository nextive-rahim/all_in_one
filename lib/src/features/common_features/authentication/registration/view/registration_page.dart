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
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/validators/input_form_validators.dart';
import 'package:all_in_one/src/core/widgets/primary_button.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/controller/registration_view_controller.dart';
import 'package:all_in_one/src/features/common_features/skill/controller/skill_controller.dart';
import 'package:all_in_one/src/features/common_features/skill/widget/skill-builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
//import 'dart:io' show Platform;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({
    super.key,
    required this.userTyper,
  });
  final String userTyper;
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final controller = Get.put(RegistrationViewController());
  final skillController = Get.put(SkillViewController());
  @override
  void initState() {
    // skillController.getSkills();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('User Type : ${widget.userTyper}');
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Registration'),
      // ),
      backgroundColor: CommonColor.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 265),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerNotMounted(),
                const SizedBox(height: 20),
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
                          keyboardType: TextInputType.phone,
                        ),
                        widget.userTyper == '3'
                            ? const Offstage()
                            : InkWell(
                                onTap: () {
                                  _showError(
                                      SkillBuilder(
                                        selectedSkillIdList:
                                            controller.selectedSkillIdList,
                                        selectedSkillNameList:
                                            controller.selectedSkillNameList,
                                      ),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Obx(
                                              () => controller
                                                      .selectedSkillIdList
                                                      .isEmpty
                                                  ? const Text(
                                                      'Select Skills',
                                                      style: TextStyle(
                                                          color: CommonColor
                                                              .hintTextColor),
                                                    )
                                                  : Text(
                                                      List<String>.generate(
                                                          controller
                                                              .selectedSkillNameList
                                                              .length,
                                                          (int index) => controller
                                                                  .selectedSkillNameList[
                                                              index]).toString(),
                                                    ),
                                            ),
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
                          isPasswordField: true,
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
                          isPasswordField: true,
                          validator: InputFieldValidator.confirmPassword(
                            password: controller.passwordController.text,
                            optional:
                                controller.passwordController.text.isEmpty,
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
                            isLoading:
                                controller.pageState == PageState.loading,
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
      ),
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
        const SizedBox(height: 7),
        const TextWidget(
          text: AppStrings.registration,
          color: CommonColor.headingTextColor1,
          maxLine: 1,
          fontFamily: AppStrings.aeonikTRIAL,
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
        const SizedBox(height: 10),
        const TextWidget(
          text: AppStrings.welcomeMsgReg,
          color: CommonColor.headingTextColor1,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ],
    );
  }

  void onTap() {
    controller.registration(_formKey, widget.userTyper).then((value) {
      if (controller.selectedSkillIdList.isEmpty) {
        SnackBarService.showErrorSnackBar('Please Select Skills');

        return;
      }

      if (controller.signupModel!.success == false) {
        SnackBarService.showErrorSnackBar(AppStrings.registrationFailedMessage);
      } else {
        SnackBarService.showInfoSnackBar(AppStrings.registrationFailedMessage);
        context.pushNamed(Routes.registrationCompleted);
        // Get.offNamed(Routes.registrationCompleted);
      }
    });
  }

  void _showError(Widget message, {String? title}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? 'Are Your Sure?'),
          content: message,
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.pop();
                // Get.back();
              },
              child: const Text('Confirm'),
            )
          ],
        );
      },
    );
  }
}
