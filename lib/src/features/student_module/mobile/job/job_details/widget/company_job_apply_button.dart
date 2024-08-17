import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/primary_button.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyJobApplyButton extends GetView<OtherCompanyJobsViewController> {
  CompanyJobApplyButton({
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
              isLoading: controller.pageState == PageState.loading,
              onTap: () {
                if (job.isApplied != 0 || isAppliedJob.value) {
                  Get.snackbar(
                    'Warning',
                    'Job is already Applied',
                    backgroundColor: CommonColor.redColors,
                    colorText: Colors.white,
                  );
                  return;
                }
              },
              widget: Row(
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
            ),
          );
        },
      ),
    );
  }
}
