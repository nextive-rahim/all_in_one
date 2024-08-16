import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteOtherCompanySavedJobCard
    extends GetView<OtherCompanyJobsViewController> {
  DeleteOtherCompanySavedJobCard({
    super.key,
    required this.job,
  });
  final JobModel job;
  final ValueNotifier<bool> isSavedJob = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.deleteSaveJob(job.id!).then((value) {
          if (value.success == true) {
            controller.companySavedJobList
                .removeWhere((element) => element.id == job.id);

            Get.snackbar(
              'Success',
              'Successfully Delete Saved job',
              snackPosition: SnackPosition.TOP,
              backgroundColor: CommonColor.greenColor1,
              colorText: Colors.white,
            );
            controller.getOtherCompanyjobList();
            // Get.find<AppliedJobsViewController>().appliedjobList();
          } else {
            Get.snackbar(
              'Falied',
              'Failed  Delete Saved job',
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
          return const Row(
            children: [
              Icon(
                Icons.delete,
                size: 20,
                color: AppColors.red,
              ),
              SizedBox(width: 5),
              TextWidget(
                textAlign: TextAlign.start,
                text: "Delete",
                color: CommonColor.redColors,
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
