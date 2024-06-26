import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/applied_jobs_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplyJobButton extends GetView<AppliedJobsViewController> {
  ApplyJobButton({
    super.key,
    required this.job,
  });
  final JobModel job;
  final ValueNotifier<bool> isAppliedJob = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          if (job.isApplied == 1 || isAppliedJob.value) {
            Get.snackbar(
              'Warning',
              'Job is already Applied',
            );
            return;
          }
          controller.applyJob(job.id!).then((value) {
            if (value.success == true) {
              Get.snackbar(
                'Success',
                'Successfully applied job',
              );
              controller.appliedjobList();
            } else {
              Get.snackbar(
                'Falied',
                'Failed apply job',
              );
            }
          });
        },
        child: ValueListenableBuilder<bool>(
            valueListenable: isAppliedJob,
            builder: (BuildContext context, bool value, child) {
              return Container(
                width: SizeConfig.screenWidth,
                height: 44,
                alignment: Alignment.center,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: job.isApplied == 1 || value
                      ? AppColors.grey
                      : CommonColor.purpleColor1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  shadows: const [
                    BoxShadow(
                      color: CommonColor.blackColor3,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConstant.send1,
                      color: CommonColor.whiteColor,
                    ),
                    const SizedBox(width: 8),
                    const TextWidget(
                      textAlign: TextAlign.center,
                      text: AppStrings.applyForJob,
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
