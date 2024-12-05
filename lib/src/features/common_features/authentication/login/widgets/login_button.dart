part of '../view/login_page.dart';

class _LoginButon extends StatefulWidget {
  const _LoginButon({super.key});

  @override
  State<_LoginButon> createState() => _LoginButonState();
}

class _LoginButonState extends State<_LoginButon> {
  final controller = Get.put(LoginViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        isLoading: controller.pageState == PageState.loading,
        onTap: onTap,
        widget: const Text(AppStrings.loginToMyAccount)
            .fontSize(16)
            .bold(FontWeight.w600)
            .color(AppColors.white),
      ),
    );
  }

  void onTap() {
    if (!controller.formKey.currentState!.validate()) {
      return;
    }
    controller.login().then(
      (response) {
        if (controller.loginModel.success == false &&
            controller.loginModel.message ==
                'User is not active. Please check your email to verify your account.') {
          _showDailogBox(
            'please check your email and verify your account',
            title: 'Do you want to verify account?',
          );

          return;
        }
        if (controller.loginModel.success == false) {
          SnackBarService.showErrorSnackBar(
              controller.loginModel.message.toString());

          return;
        }
        if (controller.loginModel.data?.userType == 1) {
          if (kIsWeb) {
            html.window.history.replaceState(null, '', Routes.homeTab);

            context.replaceNamed(Routes.homeTab);

            // Get.rootDelegate.toNamed(Routes.homeTab);
            // Get.offNamed(Routes.homeTab);
          } else {
            Get.offNamed(Routes.homeTab);
          }
        } else if (controller.loginModel.data?.userType == 2) {
          if (kIsWeb) {
            html.window.history.replaceState(null, '', Routes.homeTabEmployee);
            context.replaceNamed(Routes.homeTabEmployee);
            //  Get.offNamed(Routes.bottomNavBarEmployee);
          } else {
            Get.offNamed(Routes.bottomNavBarEmployee);
          }
        } else if (controller.loginModel.data?.userType == 3) {
          if (kIsWeb) {
            html.window.history.replaceState(null, '', Routes.homeTabCompany);
            context.replaceNamed(Routes.homeTabCompany);
            // Get.offNamed(Routes.bottomNavBarCompany);
          } else {
            context.pushNamed(Routes.bottomNavBarCompany);
            //  Get.offNamed(Routes.bottomNavBarCompany);
          }
        } else if (controller.loginModel.data?.userType == 4) {
          if (kIsWeb) {
            html.window.history
                .replaceState(null, '', Routes.bottomNavBarInterview);
            context.replaceNamed(Routes.bottomNavBarInterview);
            // Get.offNamed(Routes.bottomNavBarInterview);
          } else {
            context.pushNamed(Routes.bottomNavBarInterview);
            // Get.offNamed(Routes.bottomNavBarInterview);
          }
        }
      },
    );
  }

  void _showDailogBox(String message, {String? title}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? 'Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.resentOtpForVerifyMail().then(
                  (value) {
                    SnackBarService.showInfoSnackBar(
                        controller.loginModel.message.toString());
                  },
                );
                context.pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}
