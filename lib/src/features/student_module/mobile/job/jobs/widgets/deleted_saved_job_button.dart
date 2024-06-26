import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeletedSaveJobButtonFromJobCard extends GetView<JobsViewController> {
  DeletedSaveJobButtonFromJobCard({
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
            controller.savedJobList
                .removeWhere((element) => element.id == job.id);

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
                text: "Delet",
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
