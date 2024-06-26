import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/model/all_interviews_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class InterviewDetailsHeader extends StatelessWidget {
  const InterviewDetailsHeader({
    super.key,
    required this.interview,
  });
  final ViewInterviewResponseData interview;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: "${AppStrings.courseName}: ",
                style: TextStyle(
                  color: CommonColor.blackColor1,
                  fontSize: 20,
                  fontFamily: AppStrings.aeonikTRIAL,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: interview.title ?? '', //' Introduction to Java',
                style: const TextStyle(
                  color: CommonColor.blackColor1,
                  fontSize: 20,
                  fontFamily: AppStrings.aeonikTRIAL,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const TextWidget(
          text: AppStrings.candidateProfile,
          color: CommonColor.greyColor4,
          maxLine: 1,
          underline: TextDecoration.underline,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        const SizedBox(
          height: 25,
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: "${AppStrings.name}: ",
                style: TextStyle(
                  color: CommonColor.blackColor1,
                  fontSize: 16,
                  fontFamily: AppStrings.inter,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: interview.username,
                style: const TextStyle(
                  color: CommonColor.blackColor1,
                  fontSize: 16,
                  fontFamily: AppStrings.inter,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {
                await launch("https://www.google.com/");
              },
              child: Row(
                children: [
                  const TextWidget(
                    text: AppStrings.projectLink,
                    color: CommonColor.blueColor1,
                    maxLine: 1,
                    fontFamily: AppStrings.inter,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    ImageConstant.link2,
                    color: CommonColor.blueColor1,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                await launch("https://www.google.com/");
              },
              child: Row(
                children: [
                  const TextWidget(
                    text: AppStrings.testResultLink,
                    color: CommonColor.blueColor1,
                    maxLine: 1,
                    fontFamily: AppStrings.inter,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    ImageConstant.link2,
                    color: CommonColor.blueColor1,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
