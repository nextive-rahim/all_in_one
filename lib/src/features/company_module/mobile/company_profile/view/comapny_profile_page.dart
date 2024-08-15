import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/mobile/student_app_bar.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyProfilePage extends GetView<ProfileViewController> {
  const CompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () {
              if (controller.pageState == PageState.loading) {
                return const CircularProgressIndicator();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StudentAppBarMobile(
                    titel1: AppStrings.myProfile,
                    title2: "Company title",
                    isBack: false,
                    searchHintText: "",
                    isShowNotificationIcon: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          height: 150,
                          width: 150,
                          color: AppColors.white,
                          child: Center(
                              child: Image.network(controller
                                      .userModel!.image ??
                                  'https://nextivesolution.sgp1.cdn.digitaloceanspaces.com/static/not-found.jpg')
                              //  AppCachedNetworkImage(
                              //   imageUrl: controller.userModel?.image,
                              // ),
                              ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text('Name : '),
                            Text(
                              controller.userModel?.name ?? 'Nextive Solution',
                              style: AppTextStyle.bold16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text('Mobile Number : '),
                            Text(
                              controller.userModel?.phone ?? '',
                              style: AppTextStyle.bold16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text('Address : '),
                            Text(
                              controller.userModel?.address ??
                                  'rahimsr983@gmail.com',
                              style: AppTextStyle.bold16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text('Total Employee : '),
                            Text(
                              controller
                                  .profileResponseModel.countSubscribedUser
                                  .toString(),
                              style: AppTextStyle.bold16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(controller.userModel?.description ?? ''),
                        const SizedBox(height: 50),
                        GestureDetector(
                          onTap: () async {
                            Util.logout(context);
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
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.companyProfileUpdatePage);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.deepBlue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Edit Profile',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.bold16
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
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
