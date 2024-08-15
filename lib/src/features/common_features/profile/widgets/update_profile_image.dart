import 'dart:io';

import 'package:all_in_one/src/core/service/file/file_service.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_update_view_controller.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileImageSecton extends GetView<UpdateProfileiewController> {
  const UpdateProfileImageSecton({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileViewController>();
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 140,
          width: 140,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4FA),
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: () async {
              await FileService().pickAFile().then((value) {
                controller.fileImagelink.value = value!.path;
                controller.uploadFile(value.file).then((value2) {
                  controller.imagelink.value = value2;
                });
                return;
              });
            },
            child: Column(
              children: [
                Obx(
                  () => Stack(
                    children: [
                      controller.fileImagelink.value != ''
                          ? SizedBox(
                              height: 140,
                              width: 140,
                              child: Image.file(
                                File(controller.fileImagelink.value),
                                fit: BoxFit.cover,
                              ),
                            )
                          : SizedBox(
                              height: 140,
                              width: 140,
                              child: Image.network(
                                profileController.userModel?.image ?? '',
                                cacheHeight: 367,
                                cacheWidth: 367,
                              )

                              // AppCachedNetworkImage(
                              //   imageUrl: profileController.userModel?.image,
                              //   cachedHeight: 367,
                              //   cachedWidth: 367,
                              // ),
                              ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          constraints: const BoxConstraints(
                            minHeight: 60,
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Upload a new Profile Picture',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
