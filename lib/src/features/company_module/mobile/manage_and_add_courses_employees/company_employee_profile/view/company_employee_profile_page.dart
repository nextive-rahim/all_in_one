import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_employee_profile/widget/company_employee_completed_course_section.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_employee_profile/widget/company_employee_description_section.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_employee_profile/widget/company_employee_evaluations_section.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_employee_profile/widget/company_employee_profile_contact_section.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_employee_profile/widget/company_employee_profile_header.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_employee_profile/widget/company_employee_skill_section.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyEmployeeProfilePage extends StatefulWidget {
  const CompanyEmployeeProfilePage({super.key});

  @override
  State<CompanyEmployeeProfilePage> createState() =>
      _CompanyEmployeeProfilePageState();
}

class _CompanyEmployeeProfilePageState
    extends State<CompanyEmployeeProfilePage> {
  final companyEmployeeController =
      Get.put(CompanyEmployeeListViewController());
  final EmployeeModel employee = Get.arguments;
  bool jobAppliedStatus = false;

  @override
  void initState() {
    companyEmployeeController.employeeModel = Get.arguments;
    companyEmployeeController.assignedCouseList.value = employee.assignCourse!;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.name ?? ''),
      ),
      backgroundColor: CommonColor.greyColor1,
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CompanyEmployeeProfileHeader(employee: employee),
                          const SizedBox(height: 10),
                          CompanyEmployeeProfileContactSection(
                              employee: employee),
                          const SizedBox(height: 30),
                          CompanyEmployeeProfileDescriptionSection(
                              employee: employee),
                          const SizedBox(height: 30),
                          CompanyEmployeeSkillSection(user: employee),
                          const SizedBox(height: 30),
                          const CompanyEmployeeCompletedCourseSection(),
                          const SizedBox(height: 30),
                          CompanyEmployeeProfileEvaluationSection(
                              employee: employee)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> jobAppliedBottomSheet() async {
    return await showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 60),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Container(
                      height: 154,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 100,
                            offset: Offset(0, 4),
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 17, left: 21, top: 15, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.check_circle_outline_outlined,
                                  color: CommonColor.greenColor1,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const TextWidget(
                                    text: "Job Applied",
                                    color: CommonColor.greenColor1,
                                    maxLine: 2,
                                    fontFamily: AppStrings.aeonikTRIAL,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                                const SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    padding: const EdgeInsets.all(8),
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
                                    child: Container(
                                        width: 20,
                                        height: 20,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(),
                                        child: const Icon(
                                          Icons.clear,
                                          size: 18,
                                        )),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const TextWidget(
                                text:
                                    'You have successfully applied to this job from Glan Management Consultancy',
                                color: CommonColor.blackColor1,
                                maxLine: 5,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ],
                        ),
                      ));
                }),
              );
            }) ??
        false; //if showDialouge had returned null, then return false
  }
}
