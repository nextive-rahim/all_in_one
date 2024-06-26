import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';

class JobDescription extends StatelessWidget {
  const JobDescription({
    super.key,
    required this.job,
  });
  final JobModel job;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            textAlign: TextAlign.center,
            text: "Job Description",
            color: CommonColor.blackColor1,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          const SizedBox(height: 18),
          TextWidget(
            textAlign: TextAlign.start,
            text: job.jobDescription ?? '',
            color: CommonColor.blackColor1,
            maxLine: 20,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
