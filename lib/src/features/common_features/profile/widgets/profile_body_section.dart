import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/common_features/profile/model/profile_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileBodySection extends StatelessWidget {
  const ProfileBodySection({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'Skills:',
          color: CommonColor.greyColor4,
          maxLine: 1,
          fontFamily: AppStrings.aeonikTRIAL,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        TextWidget(
          text: List<String>.generate(
              Get.find<ProfileViewController>()
                  .profileResponseModel
                  .userSkill!
                  .length,
              (int index) =>
                  Get.find<ProfileViewController>()
                      .profileResponseModel
                      .userSkill![index]
                      .skill ??
                  '').toString(),
          color: CommonColor.greyColor4,
          maxLine: 4,
          fontFamily: AppStrings.aeonikTRIAL,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        const SizedBox(height: 10),
        const TextWidget(
          text: 'Address:',
          color: CommonColor.greyColor4,
          maxLine: 1,
          fontFamily: AppStrings.aeonikTRIAL,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        TextWidget(
          text: userModel.address ?? 'Not Found Address',
          color: CommonColor.greyColor4,
          maxLine: 4,
          fontFamily: AppStrings.aeonikTRIAL,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        const SizedBox(height: 10),
        Container(
          width: SizeConfig.screenWidth,
          height: 1,
          color: CommonColor.greyColor18,
        ),
        const SizedBox(height: 10),
        const TextWidget(
          text: AppStrings.description,
          color: CommonColor.greyColor4,
          maxLine: 1,
          fontFamily: AppStrings.aeonikTRIAL,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        const SizedBox(height: 5),
        TextWidget(
          text: userModel.description ?? 'Not Found Description',
          color: CommonColor.greyColor4,
          maxLine: 4,
          fontFamily: AppStrings.aeonikTRIAL,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        const SizedBox(height: 30),
        const Text(
          'Resume : ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: CommonColor.greyColor4,
            fontFamily: AppStrings.aeonikTRIAL,
          ),
        ),
        const SizedBox(height: 5),
        Card(
          elevation: 5,
          child: InkWell(
            onTap: () {
              Get.toNamed(
                Routes.resume,
                arguments: userModel.resume ?? '',
              );
            },
            child: SizedBox(
              width: 142,
              height: 199,
              child: Image.asset(
                ImageConstant.cv,
                cacheHeight: 522,
                cacheWidth: 372,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
