import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/widget/add_employee_form.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/widget/add_new_employee_button.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/widget/added_employee_image_by_company.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyAddEmployeePageMobile extends StatefulWidget {
  const CompanyAddEmployeePageMobile({super.key});

  @override
  State<CompanyAddEmployeePageMobile> createState() =>
      _CompanyAddEmployeePageMobileState();
}

class _CompanyAddEmployeePageMobileState
    extends State<CompanyAddEmployeePageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Added New employee'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // StudentAppBarMobile(
            //   isShowNotificationIcon: false,
            //   titel1: AppStrings.recommendedJobsForYou,
            //   title2: AppStrings.youSelectJobsApplyOrSaveLater,
            //   isBack: true,
            //   searchHintText: AppStrings.searchForJobs,
            //   // onSearchListener: (value) {},
            // ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Added New Employee :',
                style: AppTextStyle.bold20,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      AddedEployeeImageByCompany(),
                      AddedNewEmployeeFormField(),
                      //  _AddedCoursesForEmployee()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AddedNewEmployeeButton(),
    );
  }
}

class _AddedCoursesForEmployee extends StatelessWidget {
  const _AddedCoursesForEmployee();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Assigned Courses'),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.companyAssignedCourses);
            },
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: const Padding(
                padding: EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text(
                      'Assing courses',
                      style: AppTextStyle.bold12,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
