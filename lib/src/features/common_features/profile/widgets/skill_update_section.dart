import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_update_view_controller.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/common_features/skill/controller/skill_controller.dart';
import 'package:all_in_one/src/features/common_features/skill/widget/skill-builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillUpdateSection extends GetView<UpdateProfileiewController> {
  SkillUpdateSection({super.key});
  final SkillViewController skillController = Get.put(SkillViewController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(' Skills'),
              content: Obx(() {
                if (skillController.pageState == PageState.loading) {
                  return const CircularProgressIndicator();
                }
                return SkillBuilder(
                  selectedSkillIdList: controller.selectedSkillIdList,
                  selectedSkillNameList: controller.selectedSkillNameList,
                );
              }),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Confirm'),
                )
              ],
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' Skills',
            style: AppTextStyle.medium14.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 6),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: .5,
                color: AppColors.lightBlack40,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Obx(
                    () => Get.find<ProfileViewController>()
                            .profileResponseModel
                            .userSkill!
                            .isEmpty
                        ? Text(
                            controller.selectedSkillNameList.isEmpty
                                ? 'Select Skills'
                                : List<String>.generate(
                                        controller.selectedSkillNameList.length,
                                        (int index) => controller
                                            .selectedSkillNameList[index])
                                    .toString(),
                            style: const TextStyle(
                                color: CommonColor.hintTextColor),
                          )
                        : controller.selectedSkillNameList.isNotEmpty
                            ? Text(
                                List<String>.generate(
                                        controller.selectedSkillNameList.length,
                                        (int index) => controller
                                            .selectedSkillNameList[index])
                                    .toString(),
                              )
                            : Text(
                                List<String>.generate(
                                    Get.find<ProfileViewController>()
                                        .profileResponseModel
                                        .userSkill!
                                        .length, (int index) {
                                  return Get.find<ProfileViewController>()
                                          .profileResponseModel
                                          .userSkill![index]
                                          .skill ??
                                      '';
                                }).toString(),
                              ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
