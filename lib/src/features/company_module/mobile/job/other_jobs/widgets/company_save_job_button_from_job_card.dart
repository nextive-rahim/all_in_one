import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanySaveJobButtonFromJobCard
    extends GetView<OtherCompanyJobsViewController> {
  CompanySaveJobButtonFromJobCard({
    super.key,
    required this.job,
  });
  final JobModel job;
  final ValueNotifier<bool> isSavedJob = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSavedJob.value || job.isSaved != 0) {
          Get.snackbar(
            'Alert',
            'Job is already saved',
            snackPosition: SnackPosition.TOP,
            backgroundColor: CommonColor.redColors,
            colorText: Colors.white,
          );

          return;
        }
        controller.saveJob(job.id!).then((value) {
          if (value.success == true) {
            isSavedJob.value = true;
            Get.snackbar(
              'Success',
              'Successfully Saved job',
              backgroundColor: CommonColor.greenColor1,
              colorText: Colors.white,
            );
            controller.companySavedJobList.add(job);
          } else {
            isSavedJob.value = false;
            Get.snackbar(
              'Falied',
              'Failed Save job',
              snackPosition: SnackPosition.TOP,
              backgroundColor: CommonColor.redColors,
              colorText: Colors.white,
            );
          }
        });
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: isSavedJob,
        builder: (BuildContext context, bool value, child) {
          return Row(
            children: [
              Icon(
                value || job.isSaved != 0
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined,
                size: 20,
                color: value || job.isSaved != 0
                    ? CommonColor.blueColor1
                    : CommonColor.blackColor1,
              ),
              const SizedBox(width: 5),
              const TextWidget(
                textAlign: TextAlign.start,
                text: "Save",
                color: CommonColor.greyColor4,
                maxLine: 1,
                fontFamily: AppStrings.sfProDisplay,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ],
          );
        },
      ),
    );
  }
}