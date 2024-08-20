import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';

class CompanyEmployeeCompletedCourseSection extends StatefulWidget {
  const CompanyEmployeeCompletedCourseSection({
    super.key,
    required this.assignCourse,
  });
  final List<CourseModel>? assignCourse;
  @override
  State<CompanyEmployeeCompletedCourseSection> createState() =>
      _CompanyEmployeeCompletedCourseSectionState();
}

class _CompanyEmployeeCompletedCourseSectionState
    extends State<CompanyEmployeeCompletedCourseSection> {
  @override
  Widget build(BuildContext context) {
    int? selectedCompletedCoursesIndex;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
            text: 'Assigned Courses :',
            color: CommonColor.blackColor1,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w600,
            fontSize: 18),
        const SizedBox(
          height: 15,
        ),
        widget.assignCourse!.isEmpty
            ? const Text(
                'No Course Assigned',
                style: TextStyle(color: AppColors.red),
              )
            : ListView.separated(
                shrinkWrap: true,
                itemCount: widget.assignCourse!.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCompletedCoursesIndex = index;
                      });
                    },
                    child: Container(
                      width: SizeConfig.screenWidth,
                      height: 85,
                      decoration: ShapeDecoration(
                        color: selectedCompletedCoursesIndex != null
                            ? selectedCompletedCoursesIndex == index
                                ? CommonColor.greyColor9
                                : Colors.white
                            : CommonColor.whiteColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 0.50,
                              color: selectedCompletedCoursesIndex != null
                                  ? selectedCompletedCoursesIndex == index
                                      ? CommonColor.blueColor2
                                      : CommonColor.greyColor18
                                  : CommonColor.greyColor18),
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
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: CommonColor.greyColor5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: CommonColor.blackColor3,
                                        blurRadius: 2,
                                        offset: Offset(0, 1),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow_outlined,
                                    color: CommonColor.purpleColor1,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWidget(
                                        text:
                                            widget.assignCourse![index].title ??
                                                '',
                                        color: CommonColor.greyColor11,
                                        maxLine: 1,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextWidget(
                                        text: widget.assignCourse![index]
                                                .totalTime ??
                                            '',
                                        color: CommonColor.greyColor11,
                                        maxLine: 1,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ],
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.more_vert,
                              color: CommonColor.purpleColor1,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 15);
                },
              ),
      ],
    );
  }
}
