import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/controller/company_assigned_%20course_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/widget/company_assigned_course_card.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';

class CompanyAssigniedCourseBuilder extends StatefulWidget {
  const CompanyAssigniedCourseBuilder({
    super.key,
    required this.homeCourses,
    required this.controller,
  });
  final List<CourseModel> homeCourses;
  final CompanyAssignedCouseViewController controller;
  @override
  State<CompanyAssigniedCourseBuilder> createState() =>
      _CompanyAssigniedCourseBuilderState();
}

class _CompanyAssigniedCourseBuilderState
    extends State<CompanyAssigniedCourseBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      shrinkWrap: true,
      itemCount: widget.homeCourses.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CompanyAssingnedCoursesCard(
          onTap: () {
            selectedsID(widget.homeCourses[index]);
          },
          course: widget.homeCourses[index],
          isSelectItem: widget.controller.courseIDList
              .contains(widget.homeCourses[index].id),
        );
      },
    );
  }

  selectedsID(CourseModel course) {
    if (!widget.controller.courseIDList.contains(course.id)) {
      widget.controller.courseIDList.add(course.id!);
      setState(() {});
    } else {
      widget.controller.courseIDList.remove(course.id);
      setState(() {});
    }
  }
}
