import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/primary_button.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/common_features/profile/widgets/profile_body_section.dart';
import 'package:all_in_one/src/features/common_features/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends GetView<ProfileViewController> {
  ProfilePage({super.key}) {
    // controller.profile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: CommonColor.greyColor1,
        body: Obx(
          () {
            if (controller.pageState == PageState.loading) {
              return const CircularProgressIndicator();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Obx(
                      () {
                        if (controller.pageState == PageState.loading) {
                          return const CircularProgressIndicator();
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ProfileHeader(),
                            const SizedBox(height: 21),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 65,
                                right: 65,
                              ),
                              child: Container(
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x0C000000),
                                      blurRadius: 80,
                                      offset: Offset(0, 4),
                                      spreadRadius: 5,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: 44,
                                    top: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ProfileBodySection(
                                          userModel: controller.userModel!),
                                      const SizedBox(height: 22),
                                      // PrimaryButton(
                                      //   onTap: () {
                                      //     Get.toNamed(
                                      //         Routes.profileUpdatePage);
                                      //   },
                                      //   widget: Text(
                                      //     AppStrings.editProfile,
                                      //     style: AppTextStyle.bold16.copyWith(
                                      //         color: AppColors.white),
                                      //   ),
                                      // ),
                                      // const SizedBox(height: 10),
                                      PrimaryButton(
                                        onTap: () {
                                          context
                                              .pushNamed(Routes.changePassword);
                                          // Get.toNamed(
                                          //   Routes.changePassword,
                                          // );
                                        },
                                        widget: Text(
                                          'Change Password',
                                          style: AppTextStyle.bold16
                                              .copyWith(color: AppColors.white),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      GestureDetector(
                                        onTap: () async {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Center(
                                                  child: Text('Are you sure?'),
                                                ),
                                                content:
                                                    const SingleChildScrollView(
                                                  child: SelectableText(
                                                      'Once logged out, you will need to login again to access this app.'),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Util.logout(context);
                                                    },
                                                    child: const Text(
                                                      'OK',
                                                      style: TextStyle(
                                                          color: CommonColor
                                                              .redColors),
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.logout_outlined,
                                              color: AppColors.red,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "Logout",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
