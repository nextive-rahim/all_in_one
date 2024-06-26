import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/controller/student_course_content_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/widget/content_title_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseContent extends GetView<StudentCourseContentViewController> {
  const CourseContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: 1,
          color: CommonColor.greyColor5,
        ),
        // const SizedBox(height: 35),
        const TextWidget(
          text: AppStrings.courseContent,
          color: CommonColor.headingTextColor1,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        const SizedBox(height: 12),
        Container(
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 10,
          ),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 20,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                if (controller.pageState == PageState.loading) {
                  return const Offstage();
                }
                return ContentTileBuilder(
                    contentList: controller.contentTileList);
              }),
              const SizedBox(height: 15),
              const TextWidget(
                text: AppStrings.endOfYourCourse,
                color: CommonColor.greyColor7,
                maxLine: 1,
                fontFamily: AppStrings.sfProDisplay,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
