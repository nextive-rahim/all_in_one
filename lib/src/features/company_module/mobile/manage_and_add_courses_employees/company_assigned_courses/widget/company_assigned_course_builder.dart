import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/controller/company_assigned_%20course_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/widget/company_assigned_course_card.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/controller/student_home_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyAssigniedCourseBuilder extends GetView<StudentHomeViewController> {
  const CompanyAssigniedCourseBuilder({
    super.key,
    // required this.homeCourses,
  });
  // final List<CategoryWiseCourseModel> homeCourses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      shrinkWrap: true,
      itemCount: controller.homeCourses.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.homeCourses[index].name ?? '',
              style: AppTextStyle.bold18,
            ),
            _CourseBuilder(
              courseList: controller.homeCourses[index].collectinList,
            ),
          ],
        );
      },
    );
  }
}

class _CourseBuilder extends StatefulWidget {
  const _CourseBuilder({
    // required this.categoryIndex,
    required this.courseList,
  });

  // final int categoryIndex;
  final List<CourseModel>? courseList;

  @override
  State<_CourseBuilder> createState() => _CourseBuilderState();
}

class _CourseBuilderState extends State<_CourseBuilder> {
  final controller = Get.find<CompanyAssignedCouseViewController>();
  final employeeController = Get.find<CompanyEmployeeListViewController>();
  final couseController = Get.find<StudentHomeViewController>();
  @override
  Widget build(BuildContext context) {
    if (widget.courseList!.isEmpty) {
      return Center(
        child: Image.asset(
          '',
          height: 150,
          fit: BoxFit.contain,
        ),
      );
    }
    return ListView.builder(
      itemCount: widget.courseList!.length,
      primary: false,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, courseIndex) {
        CourseModel course = widget.courseList![courseIndex];

        final bool alreadyAssinged = couseController
            .employeeModel!.assignCourse!
            .any((v) => v.id == course.id);

        return Container(
            width: 360,
            margin: const EdgeInsets.only(right: 0),
            child: CompanyAssingnedCoursesCard(
              onTap: () {
                if (alreadyAssinged) {
                  return;
                }
                selectedsID(course);
              },
              course: course,
              isSelectItem: alreadyAssinged ||
                  controller.courseIDList.contains(course.id),
            ));
      },
    );
  }

  selectedsID(CourseModel course) {
    if (!controller.courseIDList.contains(course.id)) {
      controller.courseIDList.add(course.id!);
      setState(() {});
    } else {
      controller.courseIDList.remove(course.id);
      setState(() {});
    }
  }
}
