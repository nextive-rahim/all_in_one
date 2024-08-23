import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/controller/company_profile_update_view_controller.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyProfileUpdateButton
    extends GetView<CompanyProfileUpdateViewController> {
  const CompanyProfileUpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () async {
          controller.companyProfileUpdate().then((value) {
            if (value.success == true) {
              Get.back();
              SnackBarService.showInfoSnackBar('Employee Added Successfully');

              Get.find<ProfileViewController>().getUser();
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.deepBlue,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Update Profile',
              textAlign: TextAlign.center,
              style: AppTextStyle.bold16.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
