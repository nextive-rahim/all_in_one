import 'package:all_in_one/src/core/theme/text_style.dart';
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
  final List<CategoryWiseCourseModel> homeCourses;
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.homeCourses[index].name ?? '',
              style: AppTextStyle.bold18,
            ),
            _CourseBuilder(
              controller: widget.controller,
              courseList: widget.homeCourses[index].collectinList,
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
    required this.controller,
  });

  // final int categoryIndex;
  final List<CourseModel>? courseList;
  final CompanyAssignedCouseViewController controller;

  @override
  State<_CourseBuilder> createState() => _CourseBuilderState();
}

class _CourseBuilderState extends State<_CourseBuilder> {
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
        return Container(
            width: 360,
            margin: const EdgeInsets.only(right: 0),
            child: CompanyAssingnedCoursesCard(
              onTap: () {
                selectedsID(course);
              },
              course: course,
              isSelectItem: widget.controller.courseIDList.contains(course.id),
            ));
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
