import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveJobButtonFromJobDetails extends GetView<JobsViewController> {
  SaveJobButtonFromJobDetails({
    super.key,
    required this.job,
  });
  final JobModel job;
  final ValueNotifier<bool> isSavedJob = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (job.isSaved == 1 || isSavedJob.value) {
          Get.snackbar(
            'Warning',
            'Job is already Saved',
          );
        }
        controller.saveJob(job.id!).then((value) {
          if (value.success == true) {
            isSavedJob.value = true;
            Get.snackbar(
              'Success',
              'Successfully Saved job',
            );
            controller.getjobList();
          } else {
            Get.snackbar(
              'Falied',
              'Failed Save job',
            );
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: ValueListenableBuilder<bool>(
            valueListenable: isSavedJob,
            builder: (BuildContext context, bool value, child) {
              return Container(
                width: SizeConfig.screenWidth,
                height: 44,
                alignment: Alignment.center,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: job.isSaved == 1 || value
                      ? AppColors.grey
                      : CommonColor.purpleColor1,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 0.50,
                      color: CommonColor.greyColor5,
                    ),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bookmark_border,
                      size: 20,
                      color: CommonColor.whiteColor,
                    ),
                    SizedBox(width: 8),
                    TextWidget(
                      textAlign: TextAlign.center,
                      text: AppStrings.savedJobs,
                      color: CommonColor.whiteColor,
                      maxLine: 1,
                      fontFamily: AppStrings.inter,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
