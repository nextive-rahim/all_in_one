import 'package:all_in_one/src/core/gobal_function.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeCard extends StatefulWidget {
  const EmployeeCard({
    super.key,
    required this.employee,
  });
  final EmployeeModel employee;

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  Future<void> hotlineSupport() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '01718663032',
    );
    await urlLauncher(
      launchUri.toString(),
    );
  }

  Future<void> emailSupport() async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: 'rahimsr983@gmail.com',
    );
    await urlLauncher(
      launchUri.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: 183,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 20,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 21, 30, 21),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(
                  Routes.companyEmployeeProfilePage,
                  arguments: widget.employee,
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFECECEC),
                      shape: CircleBorder(),
                    ),
                    child: Text(
                      getInitials(widget.employee.name ?? ''),
                      style: const TextStyle(
                        color: Color(0xFF5A5959),
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(width: 21),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.employee.name ?? '',
                          style: const TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.employee.degination ?? '',
                          style: const TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.employee.descripton ?? '',
                          maxLines: 2,
                          style: const TextStyle(
                            color: Color(0xFF8A8A8A),
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: SizeConfig.screenWidth,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    //  strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          hotlineSupport();
                        },
                        child: const Icon(Icons.call_outlined)),
                    const SizedBox(width: 24),
                    InkWell(
                        onTap: () {
                          emailSupport();
                        },
                        child: const Icon(Icons.mail_outline_outlined))
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      Routes.companyAssignedCourses,
                      arguments: widget.employee,
                    );
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
            )
          ],
        ),
      ),
    );
  }

  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';
}
