import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/primary_button.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplyJobButton extends GetView<JobsViewController> {
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
      child: ValueListenableBuilder<bool>(
        valueListenable: isAppliedJob,
        builder: (BuildContext context, bool value, child) {
          return Obx(
            () => PrimaryButton(
              backgroundColor: job.isApplied != 0 || value
                  ? AppColors.grey
                  : CommonColor.purpleColor1,
              isLoading: controller.isLoadingAppliedJob.value == true,
              onTap: () {
                if (job.isApplied != 0 || isAppliedJob.value) {
                  SnackBarService.showErrorSnackBar('Job is already Applied');

                  return;
                }
                controller.applyJob(job.id!).then((value) {
                  if (value.success == true) {
                    SnackBarService.showInfoSnackBar(
                        'Successfully applied job');

                    isAppliedJob.value = true;
                    controller.getjobList();
                  } else {
                    SnackBarService.showErrorSnackBar('Failed apply job');
                  }
                });
              },
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstant.send2,
                    width: 20,
                    height: 20,
                    fit: BoxFit.fill,
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
            ),
          );
        },
      ),
    );
  }
}
