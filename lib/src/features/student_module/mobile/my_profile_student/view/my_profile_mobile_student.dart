import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/primary_button.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/my_profile_student/widgets/profile_body_section.dart';
import 'package:all_in_one/src/features/student_module/mobile/my_profile_student/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileStudentMobile extends GetView<ProfileController> {
  MyProfileStudentMobile({super.key}) {
    // controller.profile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: CommonColor.greyColor1,
      body: Obx(
        () {
          if (controller.pageState == PageState.loading) {
            return const CircularProgressIndicator();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 20,
                      bottom: 60,
                    ),
                    child: Obx(
                      () {
                        if (controller.pageState == PageState.loading) {
                          return const CircularProgressIndicator();
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileHeader(
                              userModel: controller.userModel!,
                            ),
                            const SizedBox(height: 21),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                                right: 5,
                              ),
                              child: Container(
                                width: SizeConfig.screenWidth,
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
                                      PrimaryButton(
                                        onTap: () {
                                          Get.toNamed(Routes.profileUpdatePage);
                                        },
                                        widget: Text(
                                          AppStrings.editProfile,
                                          style: AppTextStyle.bold16
                                              .copyWith(color: AppColors.white),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      PrimaryButton(
                                        onTap: () {
                                          Get.toNamed(
                                            Routes.changePassword,
                                          );
                                        },
                                        widget: Text(
                                          'Change Password',
                                          style: AppTextStyle.bold16
                                              .copyWith(color: AppColors.white),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () {
                                          Util.logout(context);
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 44,
                                          alignment: Alignment.center,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: CommonColor.redColors,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 0.50,
                                                  color:
                                                      CommonColor.blueColor1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                                          child: const TextWidget(
                                              text: "Logout",
                                              color: CommonColor.whiteColor,
                                              maxLine: 1,
                                              fontFamily: AppStrings.inter,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
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
                ),
              )
            ],
          );
        },
      ),
    ));
  }
}
