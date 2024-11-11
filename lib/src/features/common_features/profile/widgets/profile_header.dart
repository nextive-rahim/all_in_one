import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/string.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProfileHeader extends GetView<ProfileViewController> {
  const ProfileHeader({
    super.key,
    this.isFromcompany = false,
  });
  final bool isFromcompany;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: .1,
                color: AppColors.lightBlack40,
              ),
              // boxShadow: const [
              //   BoxShadow(
              //     color: Color.fromRGBO(0, 0, 0, 0.1),
              //     blurRadius: 12,
              //     spreadRadius: 0,
              //     offset: Offset(
              //       0,
              //       4,
              //     ),
              //   ),
              // ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 5,
                        color: AppColors.white,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        controller.userModel!.image ?? noImageFound,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            noImageFound,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: RichText(
                          text: TextSpan(
                            text: controller.userModel!.name.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'NotoSerifBengali',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      FittedBox(
                        child: RichText(
                          text: TextSpan(
                            text: 'Email :  ',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightBlack40,
                              fontFamily: 'NotoSerifBengali',
                            ),
                            children: [
                              TextSpan(
                                text: controller.userModel!.name.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  height: 20 / 17,
                                  fontFamily: 'NotoSerifBengali',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      FittedBox(
                        child: RichText(
                          text: TextSpan(
                            text: 'Phone : ',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightBlack40,
                              fontFamily: 'NotoSerifBengali',
                            ),
                            children: [
                              TextSpan(
                                text: controller.userModel?.phone ?? 'N/A',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  height: 20 / 17,
                                  fontFamily: 'NotoSerifBengali',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          isFromcompany == true
                              ? context
                                  .pushNamed(Routes.companyProfileUpdatePage)
                              : context.pushNamed(Routes.profileUpdatePage);
                        },
                        child: Container(
                          width: 161,
                          height: 36,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 0.50, color: CommonColor.greyColor5),
                              borderRadius: BorderRadius.circular(8),
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
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageConstant.edit,
                                color: CommonColor.greenColor1,
                              ),
                              const SizedBox(width: 8),
                              const TextWidget(
                                text: AppStrings.editProfile,
                                color: CommonColor.blackColor4,
                                maxLine: 1,
                                fontFamily: AppStrings.inter,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )

                  // Row(
                  //   children: [
                  //     Text(
                  //       'Name : ',
                  //       style: AppTextStyle.bold14
                  //           .copyWith(color: AppColors.white),
                  //     ),
                  //     Text(
                  //       controller.userModel?.name ?? 'N/A',
                  //       style: AppTextStyle.bold16
                  //           .copyWith(color: AppColors.white),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 10),
                  // Row(
                  //   children: [
                  //     Text(
                  //       'Phone : ',
                  //       style: AppTextStyle.bold14
                  //           .copyWith(color: AppColors.white),
                  //     ),
                  //     Text(
                  //       controller.userModel?.phone ?? 'N/A',
                  //       style: AppTextStyle.bold16
                  //           .copyWith(color: AppColors.white),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 10),
                  // Row(
                  //   children: [
                  //     Text(
                  //       'Email : ',
                  //       style: AppTextStyle.bold14
                  //           .copyWith(color: AppColors.white),
                  //     ),
                  //     Text(
                  //       controller.userModel!.name.toString(),
                  //       style: AppTextStyle.bold16
                  //           .copyWith(color: AppColors.white),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
