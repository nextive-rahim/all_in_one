import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/model/student_course_content_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/widget/content_video_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentTileBuilder extends StatelessWidget {
  const ContentTileBuilder({
    super.key,
    required this.contentList,
  });
  final RxList<ContentTittle> contentList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemCount: contentList.length, //AppStrings.courseContentList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // subtitle: TextWidget(
              //     text:
              //         '1 / 3  |  ${controller.viewCourseContentData[index1].duration}',
              //     color: CommonColor.blackColor2,
              //     maxLine: 1,
              //     fontFamily: AppStrings.sfProDisplay,
              //     fontWeight: FontWeight.w400,
              //     fontSize: 12),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextWidget(
                    textAlign: TextAlign.start,
                    text: contentList[index].name ?? '',
                    color: CommonColor.blackColor2,
                    maxLine: 2,
                    fontFamily: AppStrings.sfProDisplay,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                ContentVideoBuilder(
                  contentVideoList: contentList[index].courseContent ?? [],
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 26);
          },
        ),
      ],
    );
  }
}
