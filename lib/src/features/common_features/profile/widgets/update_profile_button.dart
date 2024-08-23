import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/widgets/primary_button.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_update_view_controller.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileButton extends GetView<UpdateProfileiewController> {
  const UpdateProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(20.0),
        child: PrimaryButton(
          isLoading: controller.pageState == PageState.loading,
          onTap: () async {
            await controller.updateProfile().then((value) {
              if (value.success == true) {
                // Get.back();
                Get.snackbar(
                  'Successfully',
                  'Update Profile Successfully',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: CommonColor.greenColor1,
                  colorText: Colors.white,
                );
              }
            }).then((v) {
              Get.find<ProfileViewController>().getUser();
            });
          },
          widget: Text(
            'Update Profile',
            textAlign: TextAlign.center,
            style: AppTextStyle.bold16.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
