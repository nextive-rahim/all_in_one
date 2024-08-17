import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeletedJob extends GetView<JobsViewController> {
  const DeletedJob({
    super.key,
    required this.job,
  });
  final JobModel job;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDailogBox(context);
      },
      child: Row(
        children: [
          Image.asset(
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
      ),
    );
  }

  void _showDailogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Do you want delete this job?'),
          content: const SingleChildScrollView(
            child: SelectableText('Delete is irreversible.'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.deleteCompanyJob(job.id!).then((v) {
                  controller.companyJobList.removeWhere((v) => v.id == v.id);
                  Get.snackbar(
                    'Successful',
                    'Successfully delete job.',
                    backgroundColor: CommonColor.greenColor1,
                    colorText: Colors.white,
                    borderWidth: 1,
                  );
                });

                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: CommonColor.redColors),
              ),
            )
          ],
        );
      },
    );
  }
}
