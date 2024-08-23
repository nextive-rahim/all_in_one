import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_employee_profile/widget/delete_assigned_course.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyEmployeeCompletedCourseSection
    extends GetView<CompanyEmployeeListViewController> {
  const CompanyEmployeeCompletedCourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.assignedCouseList.isEmpty) {
        return const Column(
          children: [
            TextWidget(
                text: 'Assigned Courses :',
                color: CommonColor.blackColor1,
                maxLine: 1,
                fontFamily: AppStrings.sfProDisplay,
                fontWeight: FontWeight.w600,
                fontSize: 18),
            SizedBox(height: 15),
            Text(
              'No Course Assigned',
              style: TextStyle(color: AppColors.red),
            ),
          ],
        );
      }
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
          const SizedBox(height: 15),
          ListView.separated(
            shrinkWrap: true,
            itemCount: controller.assignedCouseList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _AssignedCourseCard(
                assignCourse: controller.assignedCouseList[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15);
            },
          ),
        ],
      );
    });
  }
}

class _AssignedCourseCard extends StatelessWidget {
  const _AssignedCourseCard({
    required this.assignCourse,
  });
  final CourseModel? assignCourse;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: SizeConfig.screenWidth,
        height: 85,
        decoration: ShapeDecoration(
          color: CommonColor.greyColor9,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.50, color: CommonColor.greyColor18),
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
                            width: 0.50, color: CommonColor.greyColor5),
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
                          text: assignCourse!.title ?? '',
                          color: CommonColor.greyColor11,
                          maxLine: 1,
                          fontFamily: AppStrings.sfProDisplay,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                      const SizedBox(
                        height: 8,
                      ),
                      TextWidget(
                          text: assignCourse!.totalTime ?? '',
                          color: CommonColor.greyColor11,
                          maxLine: 1,
                          fontFamily: AppStrings.sfProDisplay,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ],
                  ),
                ],
              ),
              DeletedAssignCourse(
                course: assignCourse!,
              )
              // const Icon(
              //   Icons.more_vert,
              //   color: CommonColor.purpleColor1,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
