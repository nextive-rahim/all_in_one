import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/widgets/mobile/student_app_bar.dart';
import 'package:flutter/material.dart';

class CompanyAddEmployeePageWeb extends StatefulWidget {
  const CompanyAddEmployeePageWeb({
    super.key,
  });

  @override
  State<CompanyAddEmployeePageWeb> createState() =>
      _CompanyAddEmployeePageWebState();
}

class _CompanyAddEmployeePageWebState extends State<CompanyAddEmployeePageWeb> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            // appBar: AppBar(
            //   backgroundColor: CommonColor.whiteColor,
            //   title: const TextWidget(
            //       text: "Welcome Back",
            //       color: CommonColor.headingTextColor1,
            //       maxLine: 1,
            //       fontFamily: AppStrings.inter,
            //       fontWeight: FontWeight.w500,
            //       fontSize: 14),
            // ),

            backgroundColor: CommonColor.greyColor1,
            body: Column(
              children: [
                StudentAppBarMobile(
                  titel1: "Back",
                  title2: "Add new employee",
                  isBack: true,
                  searchHintText:
                      "Search for employees, departments and more...",
                ),
              ],
            )));
  }
}
