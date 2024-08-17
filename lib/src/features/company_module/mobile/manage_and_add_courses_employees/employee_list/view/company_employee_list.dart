import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/widget/employee_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyEmployeeListPageMobile extends StatefulWidget {
  const CompanyEmployeeListPageMobile({super.key});

  @override
  State<CompanyEmployeeListPageMobile> createState() =>
      _CompanyEmployeeListPageMobileState();
}

class _CompanyEmployeeListPageMobileState
    extends State<CompanyEmployeeListPageMobile> {
  final controller = Get.put(EmployeeListViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.greyColor1,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getEmployeeList();
          },
          child: Column(
            children: [
              // StudentAppBarMobile(
              //   titel1: AppStrings.companyName,
              //   title2: "Company Tagline here",
              //   isBack: false,
              //   searchHintText: "Search for employees, departments and more...",
              //   onSearchListener: (value) {},
              //   isShowNotificationIcon: false,
              // ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const SizedBox(height: 17),
                            // const EmployeeListFilterSection(),
                            const SizedBox(height: 14),
                            _addEmployeeButton(),
                            const SizedBox(height: 30),
                            const EmployeeListSection(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addEmployeeButton() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.companyAddEmployeePageMobile);
      },
      child: Container(
        width: 160,
        height: 40,
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFCFD4DC)),
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0C101828),
              blurRadius: 2,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 20,
            ),
            SizedBox(width: 5),
            Text(
              'Add new employee',
              style: TextStyle(
                color: Color(0xFF344053),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
