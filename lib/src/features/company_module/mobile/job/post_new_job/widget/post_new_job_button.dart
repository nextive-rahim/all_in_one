import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/post_new_job/controller/post_company_new_job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostNewJobButton extends GetView<PostCompanyNewJobViewController> {
  const PostNewJobButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          if (controller.jobRoleController.text.isEmpty ||
              controller.workExpMinController.text.isEmpty ||
              controller.workExpMaxController.text.isEmpty ||
              controller.paySalaryController.text.isEmpty ||
              controller.workLocationController.text.isEmpty ||
              controller.jobDescriptionController.text.isEmpty) {
            Get.snackbar(
              'Waring',
              'Please fill the field',
              borderColor: AppColors.red,
              borderWidth: 1,
            );
            return;
          }
          controller.postNewJob().then((value) {
            if (value.success == true) {
              Get.snackbar(
                'Successfully',
                'Post Added Successfully',
              );
              Get.find<JobsViewController>().getjobList();
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
              'Post Job',
              textAlign: TextAlign.center,
              style: AppTextStyle.bold16.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
