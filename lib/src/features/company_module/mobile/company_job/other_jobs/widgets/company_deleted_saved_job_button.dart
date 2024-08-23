import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/other_jobs/controller/other_company_job_view_controller.dart';
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
            SnackBarService.showInfoSnackBar(
              'Successfully Delete Saved job',
            );

            controller.getOtherCompanyjobList();
            // Get.find<AppliedJobsViewController>().appliedjobList();
          } else {
            SnackBarService.showErrorSnackBar('Failed  Delete Saved job');
          }
        });
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: isSavedJob,
        builder: (BuildContext context, bool value, child) {
          return Row(
            children: [
              Image.asset(
                height: 20,
                width: 15,
                ImageConstant.trash,
                color: CommonColor.redColors,
              ),
              const SizedBox(width: 5),
              const TextWidget(
                textAlign: TextAlign.start,
                text: AppStrings.delete,
                color: CommonColor.redColors,
                maxLine: 1,
                fontFamily: AppStrings.sfProDisplay,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ],
          );
        },
      ),
    );
  }
}
