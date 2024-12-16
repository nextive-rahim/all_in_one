
import 'package:all_in_one/main.dart';
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
import 'package:all_in_one/src/features/common_features/authentication/login/controller/login_view_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'dart:html' as html;
part '../widgets/login_button.dart';
part '../widgets/login_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(LoginViewController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      backgroundColor: CommonColor.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Form(
              key: controller.formKey,
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
                            labelText: AppStrings.username,
                            controller: controller.userNameController,
                            hintText: AppStrings.hitTextUsername,
                            validator: InputFieldValidator.email(),
                          ),
                          OutlinedInputField(
                            labelText: AppStrings.password,
                            controller: controller.passwordController,
                            hintText: AppStrings.password,
                            isPasswordField: true,
                            validator: InputFieldValidator.password(),
                          ),
                          10.sh,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  context.pushNamed(
                                      Routes.forgetPasswordEmailPage);
                                  //  Get.toNamed(Routes.forgetPasswordEmailPage);
                                },
                                child: const TextWidget(
                                  text: AppStrings.forgotPassword,
                                  underline: TextDecoration.underline,
                                  color: CommonColor.headingTextColor1,
                                  maxLine: 1,
                                  fontFamily: AppStrings.inter,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          _LoginButon(),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const TextWidget(
                                  text: AppStrings.dontHaveAnyAccount,
                                  color: CommonColor.headingTextColor1,
                                  maxLine: 2,
                                  fontFamily: AppStrings.inter,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                      
                                  context.goNamed(Routes.engagement);
                             
                                  // Get.toNamed(Routes.engagement);
                                },
                                child: const TextWidget(
                                  text: AppStrings.registerNow,
                                  underline: TextDecoration.underline,
                                  color: CommonColor.headingTextColor1,
                                  maxLine: 2,
                                  fontFamily: AppStrings.inter,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 47),
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
          text: AppStrings.loginToYourAccount,
          color: CommonColor.headingTextColor1,
          maxLine: 1,
          fontFamily: AppStrings.aeonikTRIAL,
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
        const SizedBox(height: 10),
        const TextWidget(
          text: AppStrings.heyWelcomeback,
          color: CommonColor.headingTextColor1,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ],
    );
  }
}
