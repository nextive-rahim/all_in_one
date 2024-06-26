import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/features/profile/controller/profile_update_view_controller.dart';
import 'package:all_in_one/src/features/profile/controller/profile_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileButton extends GetView<UpdateProfileiewController> {
  const UpdateProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () async {
          await controller.updateProfile().then((value) {
            if (value.success == true) {
              controller.clearTextFields();
              Get.snackbar(
                'Successfully',
                'Update ProfileSuccessfully',
              );
              Get.find<ProfileController>().profile();
              Get.back();
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
