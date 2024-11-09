import 'package:all_in_one/src/core/extension/sizebox_extension.dart';
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
import 'package:all_in_one/src/features/common_features/authentication/forget_password/controller/forget_password_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({
    super.key,
  });

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final controller = Get.put(ForgetPasswordViewController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Forget Password'),
      // ),
      backgroundColor: CommonColor.whiteColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 20,),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _headerNotMounted(),
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
                              controller: controller.comfirmPasswordController,
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
                            10.sh,
                            const SizedBox(height: 30),
                            Obx(
                              () => PrimaryButton(
                                isLoading:
                                    controller.pageState == PageState.loading,
                                onTap: onTap,
                                widget: const Text('Reset Password')
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
            text: 'Reset Your Password',
            color: CommonColor.headingTextColor1,
            maxLine: 1,
            fontFamily: AppStrings.aeonikTRIAL,
            fontWeight: FontWeight.w700,
            fontSize: 28),
        const SizedBox(height: 10),
      ],
    );
  }

  void onTap() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    controller.resetPassword(_formKey).then((response) {
      if (controller.loginModel.success == false) {
        SnackBarService.showErrorSnackBar(
            controller.loginModel.message.toString());
      } else {
        SnackBarService.showInfoSnackBar(
            controller.loginModel.message.toString());
        context.goNamed(Routes.login);
        // Get.offNamed(Routes.login);
      }
    });
  }
}
