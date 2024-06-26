import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';

class JobDetailsHeader extends StatelessWidget {
  const JobDetailsHeader({
    super.key,
    required this.job,
  });
  final JobModel job;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            textAlign: TextAlign.center,
            text: job.jobRole ?? '',
            color: CommonColor.blackColor1,
            maxLine: 1,
            fontFamily: AppStrings.aeonikTRIAL,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
          const SizedBox(height: 7),
          const TextWidget(
            textAlign: TextAlign.center,
            text: "Glan Management Consultancy",
            color: CommonColor.greyColor12,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
