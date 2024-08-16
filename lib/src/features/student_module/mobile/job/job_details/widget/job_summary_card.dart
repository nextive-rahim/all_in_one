import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/formated_date_time.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';

class JobSummaryCard extends StatelessWidget {
  const JobSummaryCard({
    super.key,
    required this.job,
  });
  final JobModel job;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: SizeConfig.screenWidth,
        height: 165,
        padding: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          //color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1.0,
              color: CommonColor.greyColor16,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _JobSummaryItem(
              name: "${job.workExpMin ?? ''}-${job.workExpMax ?? ''} Yrs",
              icon: ImageConstant.jobLogo,
            ),
            const SizedBox(height: 12),
            _JobSummaryItem(
              name: job.paysalary ?? '' "/yr.",
              icon: ImageConstant.dollarCircle,
            ),
            const SizedBox(height: 12),
            _JobSummaryItem(
              name: job.workLocation ?? '',
              icon: ImageConstant.send2,
            ),
            const SizedBox(height: 16),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Posted: ',
                    style: TextStyle(
                      color: CommonColor.greyColor6,
                      fontSize: 14,
                      fontFamily: AppStrings.sfProDisplay,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: FormatedDateTime.readTimestamp(
                        int.parse(job.time ?? '0')), //'3 days ago',
                    style: const TextStyle(
                      color: CommonColor.greyColor6,
                      fontSize: 14,
                      fontFamily: AppStrings.sfProDisplay,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _JobSummaryItem extends StatelessWidget {
  const _JobSummaryItem({
    required this.name,
    required this.icon,
  });
  final String name;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          color: CommonColor.purpleColor1,
        ),
        const SizedBox(width: 8),
        TextWidget(
          textAlign: TextAlign.start,
          text: name,
          color: CommonColor.greyColor4,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w400,
          fontSize: 13,
        ),
      ],
    );
  }
}
