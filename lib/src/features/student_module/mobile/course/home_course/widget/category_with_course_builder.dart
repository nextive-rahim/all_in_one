import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/widget/course_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWithCourseBuilder extends StatelessWidget {
  const CategoryWithCourseBuilder({
    super.key,
    required this.categories,
  });
  final RxList<CategoryWiseCourseModel> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, categoryIndex) {
        return categories.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          categories[categoryIndex].name ?? "",
                          style: AppTextStyle.bold18,
                        ),
                      ),
                      // RoundedButton(
                      //   title: TextConstants.seeAll,
                      //   radius: 6,
                      //   onPressed: () {
                      //     onTapped(categoryIndex);
                      //   },
                      // ),
                      GestureDetector(
                        onTap: () {
                          //  onTapped(categoryIndex);
                        },
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if (kIsWeb) {
                                  Get.rootDelegate.toNamed(
                                      Routes.categoryWiseCourse,
                                      arguments: categories[categoryIndex]
                                          .collectinList);
                                  return;
                                }
                                Get.toNamed(
                                  Routes.categoryWiseCourse,
                                  arguments: [
                                    categories[categoryIndex].collectinList,
                                    categories[categoryIndex].name,
                                  ],
                                );
                              },
                              child: Text(
                                'See All',
                                style: AppTextStyle.bold16.copyWith(
                                  color: AppColors.lightBlack60,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppColors.lightBlack60,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 20,
                    ),
                    child: _CourseBuilder(
                      // categoryIndex: categoryIndex,
                      courseList: categories[categoryIndex].collectinList,
                    ),
                  ),
                ],
              )
            : const Offstage();
      },
    );
  }
}

class _CourseBuilder extends StatelessWidget {
  const _CourseBuilder({
    // required this.categoryIndex,
    required this.courseList,
  });

  // final int categoryIndex;
  final List<CourseModel>? courseList;

  @override
  Widget build(BuildContext context) {
    if (courseList!.isEmpty) {
      return Center(
        child: Image.asset(
          '',
          height: 150,
          fit: BoxFit.contain,
        ),
      );
    }
    return SizedBox(
      height: 245,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courseList!.length,
        primary: false,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, courseIndex) {
          CourseModel course = courseList![courseIndex];
          return Container(
            width: 280,
            margin: const EdgeInsets.only(right: 15),
            child: CourseCard(course: course),
          );
        },
      ),
    );
  }
}
