import 'package:all_in_one/src/features/company_module/mobile/company_job/applied_job_for_multiple_employee/controller/company_applied_job_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/applied_job_for_multiple_employee/widget/company_applied_job_card.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';

class CompanyAppliedJobBuilder extends StatefulWidget {
  const CompanyAppliedJobBuilder({
    super.key,
    required this.homeCourses,
    required this.controller,
  });
  final List<EmployeeModel> homeCourses;
  final CompanyAppliedJobViewController controller;
  @override
  State<CompanyAppliedJobBuilder> createState() =>
      _CompanyAppliedJobBuilderState();
}

class _CompanyAppliedJobBuilderState extends State<CompanyAppliedJobBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      shrinkWrap: true,
      itemCount: widget.homeCourses.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CompanyAppliedJonCard(
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

  selectedsID(EmployeeModel course) {
    if (!widget.controller.courseIDList.contains(course.id)) {
      widget.controller.courseIDList.add(course.id!);
      setState(() {});
    } else {
      widget.controller.courseIDList.remove(course.id);
      setState(() {});
    }
  }
}
