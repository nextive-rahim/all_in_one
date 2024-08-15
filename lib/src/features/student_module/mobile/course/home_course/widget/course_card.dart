import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
    this.onTap,
  });
  final CourseModel course;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 232,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: const Border(),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(course.thumbnailImage ?? ''),
            ),
          ),
          child: GestureDetector(
            onTap: onTap ??
                () {
                  if (kIsWeb) {
                    Get.rootDelegate.toNamed(
                      Routes.courseDetailMobilePage,
                      arguments: course,
                    );
                    return;
                  }
                  Get.toNamed(
                    Routes.courseDetailMobilePage,
                    arguments: course,
                  );
                },
            child: Container(
              width: 76,
              height: 76,
              alignment: Alignment.center,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(side: BorderSide.none),
              ),
              child: const Icon(
                Icons.play_arrow_outlined,
                size: 30,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextWidget(
          textAlign: TextAlign.center,
          text: course.title ?? '',
          color: CommonColor.headingTextColor1,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w400,
          fontSize: 22,
        ),
        TextWidget(
          textAlign: TextAlign.center,
          text: course.totalTime ?? '',
          color: CommonColor.headingTextColor1,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        const SizedBox(height: 30)
      ],
    );
  }
}
