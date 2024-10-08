import 'package:all_in_one/src/core/extension/text_extension.dart';
import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/validators/input_form_validators.dart';
import 'package:all_in_one/src/core/widgets/primary_button.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/common_features/authentication/forget_password/controller/otp_verification_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPverificationPage extends StatefulWidget {
  const OTPverificationPage({super.key});

  @override
  State<OTPverificationPage> createState() => OTPverificationPageState();
}

class OTPverificationPageState extends State<OTPverificationPage> {
  final controller = Get.find<OtpVerificationViewController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify OTP'),
      ),
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
                    _headerNotMounted(),
                    const SizedBox(height: 30),
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
          text: 'Enter Your OTP',
          color: CommonColor.headingTextColor1,
          maxLine: 1,
          fontFamily: AppStrings.aeonikTRIAL,
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  void onTap() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    controller.otpverification(_formKey).then(
      (response) {
        if (controller.loginModel.success == false) {
          SnackBarService.showErrorSnackBar(
              controller.loginModel.message.toString());
        } else {
          SnackBarService.showInfoSnackBar(
              controller.loginModel.message.toString());

          Get.toNamed(Routes.forgotPassword);
        }
      },
    );
  }
}
