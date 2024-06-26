import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseShareSection extends StatelessWidget {
  const CourseShareSection({
    super.key,
    required this.collectinListData,
  });
  final CourseModel collectinListData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: TextWidget(
                textAlign: TextAlign.start,
                text: collectinListData.title ?? 'No Name Found',
                // 'React Native IOS and Android App Development for Beginners',
                color: CommonColor.blackColor1,
                maxLine: 2,
                fontFamily: AppStrings.aeonikTRIAL,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: () async {
                final Uri smsLaunchUri = Uri(
                  scheme: 'sms',
                  path: '',
                  queryParameters: <String, String>{
                    'body':
                        '${collectinListData.title}, ${collectinListData.thumbnailImage}',
                  },
                );
                await launchUrl(smsLaunchUri);
                //'sms:+999999999 ${collectinListData.title}, ${collectinListData.thumbnailImage}');
              },
              child: Container(
                width: 36,
                height: 36,
                // padding: const EdgeInsets.all(8),
                // clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 0.50, color: CommonColor.greyColor5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Icon(Icons.share_outlined),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: collectinListData.totalTime ?? '', //'3 hours 12 mins',
                style: const TextStyle(
                  color: CommonColor.greyColor6,
                  fontSize: 12,
                  fontFamily: AppStrings.sfProDisplay,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text:
                    ' / By ${collectinListData.author ?? 'Not Found Author'}', //' / By Daniel Scott',
                style: const TextStyle(
                  color: CommonColor.greyColor6,
                  fontSize: 12,
                  fontFamily: AppStrings.sfProDisplay,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
      ],
    );
  }
}
