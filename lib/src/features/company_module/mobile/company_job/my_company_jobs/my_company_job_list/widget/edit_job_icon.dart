import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/post_new_job/controller/post_company_new_job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditJobIcon extends GetView<PostCompanyNewJobViewController> {
  const EditJobIcon({
    super.key,
    required this.job,
  });
  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.isFromPostEdit.value = true;
        controller.job = job;
        controller.popolateTextFormField(job).then((v) {
          Get.toNamed(
            Routes.postCompanyNewJob,
            arguments: job,
          );
        });
      },
      child: Row(
        children: [
          Image.asset(
            ImageConstant.edit,
            color: CommonColor.greenColor1,
          ),
          const SizedBox(width: 5),
          const TextWidget(
            textAlign: TextAlign.start,
            text: AppStrings.edit,
            color: CommonColor.greenColor1,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
