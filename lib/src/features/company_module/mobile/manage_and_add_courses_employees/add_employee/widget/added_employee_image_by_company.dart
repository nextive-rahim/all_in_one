import 'dart:io';

import 'package:all_in_one/src/core/service/file/file_service.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/controller/added_new_employee_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AddedEployeeImageByCompany
    extends GetView<AddedNewEmployeeViewController> {
  const AddedEployeeImageByCompany({super.key});

  @override
  Widget build(BuildContext context) {
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
              FileModel? file = await FileService().pickAFile();
              controller.imagelink.value = file!.path;
            },
            child: Column(
              children: [
                Obx(
                  () => Stack(
                    children: [
                      controller.imagelink.value != ''
                          ? SizedBox(
                              height: 140,
                              width: 140,
                              child: Image.file(
                                File(controller.imagelink.value),
                                fit: BoxFit.cover,
                              ),
                            )
                          : SizedBox(
                              height: 140,
                              width: 140,
                              child: Image.network(
                                'https://nextivesolution.sgp1.cdn.digitaloceanspaces.com/static/not-found.jpg',
                                fit: BoxFit.cover,
                              ),
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
