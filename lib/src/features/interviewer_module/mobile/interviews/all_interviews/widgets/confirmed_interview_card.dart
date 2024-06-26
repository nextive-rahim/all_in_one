import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class InterviewLinkCard extends StatelessWidget {
  const InterviewLinkCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launch("https://www.google.com/");
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          children: [
            Image.asset(
              ImageConstant.link2,
              color: CommonColor.blueColor1,
            ),
            const SizedBox(width: 8),
            const TextWidget(
              text: AppStrings.interviewLink,
              color: CommonColor.blueColor1,
              maxLine: 1,
              fontFamily: AppStrings.sfProDisplay,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
