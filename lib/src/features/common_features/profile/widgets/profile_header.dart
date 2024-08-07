import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/features/common_features/profile/model/profile_response_model.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const SizedBox(height: 212),
            Container(
              width: SizeConfig.screenWidth,
              height: 162,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Name : ',
                          style: AppTextStyle.bold14
                              .copyWith(color: AppColors.white),
                        ),
                        Text(
                          userModel.name ?? 'N/A',
                          style: AppTextStyle.bold16
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Phone : ',
                          style: AppTextStyle.bold14
                              .copyWith(color: AppColors.white),
                        ),
                        Text(
                          userModel.phone ?? 'N/A',
                          style: AppTextStyle.bold16
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'StudentID : ',
                          style: AppTextStyle.bold14
                              .copyWith(color: AppColors.white),
                        ),
                        Text(
                          userModel.id.toString(),
                          style: AppTextStyle.bold16
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 30,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 5,
                      color: AppColors.white,
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    userModel.image ??
                        'https://nextivesolution.sgp1.cdn.digitaloceanspaces.com/static/not-found.jpg',
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // Positioned(
            //   right: 0,
            //   bottom: 0,
            //   child: Container(
            //     width: 161,
            //     height: 36,
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 14,
            //       vertical: 8,
            //     ),
            //     clipBehavior: Clip.antiAlias,
            //     decoration: ShapeDecoration(
            //       color: Colors.white,
            //       shape: RoundedRectangleBorder(
            //         side: const BorderSide(
            //             width: 0.50, color: CommonColor.greyColor5),
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       shadows: const [
            //         BoxShadow(
            //           color: CommonColor.blackColor3,
            //           blurRadius: 2,
            //           offset: Offset(0, 1),
            //           spreadRadius: 0,
            //         )
            //       ],
            //     ),
            //     child: const Row(
            //       // mainAxisSize: MainAxisSize.min,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Icon(
            //           Icons.image_outlined,
            //           size: 20,
            //         ),
            //         SizedBox(width: 8),
            //         TextWidget(
            //           text: AppStrings.changeCover,
            //           color: CommonColor.blackColor4,
            //           maxLine: 1,
            //           fontFamily: AppStrings.inter,
            //           fontWeight: FontWeight.w500,
            //           fontSize: 14,
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ],
    );
  }
}
