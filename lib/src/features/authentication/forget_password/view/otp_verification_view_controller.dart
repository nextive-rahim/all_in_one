import 'package:all_in_one/src/core/extension/text_extension.dart';
import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/validators/input_form_validators.dart';
import 'package:all_in_one/src/core/widgets/primary_button.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/authentication/forget_password/controller/otp_verification_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPverificationPage extends StatefulWidget {
  const OTPverificationPage({
    super.key,
  });

  @override
  State<OTPverificationPage> createState() => OTPverificationPageState();
}

class OTPverificationPageState extends State<OTPverificationPage> {
  final controller = Get.find<OtpVerificationViewController>();
  final _formKey = GlobalKey<FormState>();

  bool hintUsernameHelperText = false, hintPasswordHelperText = false;
  @override
  void initState() {
    // _getData();
    super.initState();
  }

  final SizeConfig _sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 1000
        ? _forMobile(context)
        : _forWeb(context);
  }

  Widget _forMobile(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.whiteColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  MediaQuery.of(context).viewInsets.bottom > 0
                      ? _headerIsMounted()
                      : _headerNotMounted(),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
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
                            autofocus: true,
                            labelText: 'OTP',
                            controller: controller.otpController,
                            hintText: 'Enter your otp',
                            validator: InputFieldValidator.email(),
                          ),
                          const SizedBox(height: 30),
                          Obx(
                            () => PrimaryButton(
                              isLoading:
                                  controller.pageState == PageState.loading,
                              onTap: onTap,
                              widget: const Text('Submit')
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
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  Widget _forWeb(BuildContext context) {
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
                            text: AppStrings.loginToYourAccount,
                            color: CommonColor.headingTextColor1,
                            maxLine: 1,
                            fontFamily: AppStrings.aeonikTRIAL,
                            fontWeight: FontWeight.w400,
                            fontSize: _sizeConfig.getFontSize(60)),
                        SizedBox(
                          height: _sizeConfig.getSize(10),
                        ),
                        TextWidget(
                            text: AppStrings.heyWelcomeback,
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
                                  controller: controller.otpController,
                                  valtext: AppStrings.commonTextVal,
                                  height: 45,
                                  hintText: AppStrings.hitTextUsername,
                                  readOnly: false,
                                  maxLine: 1,
                                  keyType: TextInputType.text,
                                  wordLimit: 100,
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
                                const SizedBox(
                                  height: 6,
                                ),
                                Visibility(
                                  visible: hintUsernameHelperText,
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
                                    text: AppStrings.password,
                                    color: CommonColor.headingTextColor2,
                                    maxLine: 1,
                                    fontFamily: AppStrings.inter,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                const SizedBox(height: 5),
                                Visibility(
                                  visible: hintPasswordHelperText,
                                  child: const TextWidget(
                                    text: AppStrings.hintTextToHelpUser,
                                    color: CommonColor.hintTextColor,
                                    maxLine: 1,
                                    fontFamily: AppStrings.inter,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 30),
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
                                            text: AppStrings.loginToMyAccount,
                                            color: CommonColor.whiteColor,
                                            maxLine: 1,
                                            fontFamily: AppStrings.inter,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                        SizedBox(
                                          width: 13,
                                        ),
                                        Icon(
                                          Icons.check_circle_outline_outlined,
                                          size: 22,
                                          color: CommonColor.whiteColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const TextWidget(
                                        text: AppStrings.dontHaveAnyAccount,
                                        color: CommonColor.headingTextColor1,
                                        maxLine: 1,
                                        fontFamily: AppStrings.inter,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.engagement);
                                      },
                                      child: const TextWidget(
                                          text: AppStrings.registerNow,
                                          underline: TextDecoration.underline,
                                          color: CommonColor.headingTextColor1,
                                          maxLine: 1,
                                          fontFamily: AppStrings.inter,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 47,
                                ),
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
                ImageConstant.loginWebExpended,
                fit: BoxFit.fill,
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
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
                text: 'Enter Your Email',
                color: CommonColor.headingTextColor1,
                maxLine: 1,
                fontFamily: AppStrings.aeonikTRIAL,
                fontWeight: FontWeight.w700,
                fontSize: 20),
            SizedBox(
              height: 10,
            ),
            // TextWidget(
            //     text: AppStrings.heyWelcomeback,
            //     color: CommonColor.headingTextColor1,
            //     maxLine: 1,
            //     fontFamily: AppStrings.sfProDisplay,
            //     fontWeight: FontWeight.w400,
            //     fontSize: 14),
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
            text: 'Enter Your Email',
            color: CommonColor.headingTextColor1,
            maxLine: 1,
            fontFamily: AppStrings.aeonikTRIAL,
            fontWeight: FontWeight.w700,
            fontSize: 28),
        const SizedBox(
          height: 10,
        ),
        // const TextWidget(
        //     text: AppStrings.heyWelcomeback,
        //     color: CommonColor.headingTextColor1,
        //     maxLine: 1,
        //     fontFamily: AppStrings.sfProDisplay,
        //     fontWeight: FontWeight.w400,
        //     fontSize: 18),
      ],
    );
  }

  void onTap() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    controller.otpverification(_formKey).then((response) {
      if (controller.loginModel.success == false) {
        Get.snackbar(
          AppStrings.failed,
          controller.loginModel.message.toString(),
          borderColor: CommonColor.redColors,
          borderWidth: 1,
        );
      } else {
        Get.snackbar(
          AppStrings.success,
          controller.loginModel.message.toString(),
          borderColor: CommonColor.redColors,
          borderWidth: 1,
        );
        Get.toNamed(Routes.forgotPassword);
      }
    });
  }
}
