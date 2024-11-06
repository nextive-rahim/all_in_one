import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/common_features/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CompanyProfilePage extends GetView<ProfileViewController> {
  const CompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 10),
          child: Obx(
            () {
              if (controller.pageState == PageState.loading) {
                return const CircularProgressIndicator();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileHeader(isFromcompany: true),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      const Text('Total Employee : '),
                      Text(
                        controller.profileResponseModel.countSubscribedUser
                            .toString(),
                        style: AppTextStyle.bold16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Address : ',
                            style: AppTextStyle.bold16,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            controller.userModel?.address ??
                                'rahimsr983@gmail.com',
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Desctiption : ',
                            style: AppTextStyle.bold16,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            controller.userModel?.description ?? '',
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.changePassword);
                      // Get.toNamed(Routes.changePassword);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.deepBlue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Change Password',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bold16
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
