import 'package:all_in_one/src/features/student_module/mobile/course/course_details/root/view/course_details_mobile_page.dart';
import 'package:all_in_one/src/features/student_module/web/course_detail/course_detail_form_reg_large_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveLayoutCourseDetailFormRegister extends StatelessWidget {
  // final Widget webLageScaffold;
  // final Widget webMediumScaffold;
  // final Widget webSmallScaffold;
  const ResponsiveLayoutCourseDetailFormRegister({
    super.key,
    // required this.webLageScaffold,
    // required this.webMediumScaffold,
    // required this.webSmallScaffold,
  });

  // @override
  // State<ResponsiveLayoutDashboardFirstTime> createState() =>
  //     _ResponsiveLayoutDashboardFirstTimeState();
// }

// class _ResponsiveLayoutDashboardFirstTimeState
//     extends State<ResponsiveLayoutDashboardFirstTime> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print(constraints.maxWidth);
      if (constraints.maxWidth > 1100) {
        return CourseDetailFormRegisterLargeWebPage(
            collectinListData: Get.arguments!);
      } else if (constraints.minWidth > 650) {
        return const Text('data');
       // const CourseDetailFormRegisterMediumWebPage();
      } else {
        return CourseDetailMobilePage(
          collectinListData: Get.arguments!,
        );
      }
    });
  }
}

// class Responsive extends StatelessWidget {
//   final Widget? mobile;
//   final Widget? tablet;
//   final Widget? desktop;

//   const Responsive({
//     super.key,
//     @required this.mobile,
//     @required this.tablet,
//     @required this.desktop,
//   });

// // This size work fine on my design, maybe you need some customization depends on your design

//   // This isMobile, isTablet, isDesktop helep us later
//   static bool isMobile(BuildContext context) =>
//       MediaQuery.of(context).size.width < 650;

//   static bool isTablet(BuildContext context) =>
//       MediaQuery.of(context).size.width < 1100 &&
//       MediaQuery.of(context).size.width >= 650;

//   static bool isDesktop(BuildContext context) =>
//       MediaQuery.of(context).size.width >= 1100;

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ResponsibleViewController());
//     return LayoutBuilder(
//       // If our width is more than 1100 then we consider it a desktop
//       builder: (context, constraints) {
//         print("Screen Width : ${constraints.maxWidth}");
//         print("Screen  Height: ${constraints.maxHeight}");
//         controller.screenHeight.value = constraints.maxHeight;
//         controller.screenWidth.value = constraints.maxWidth;
//         if (constraints.maxWidth >= 1100) {
//           controller.isDesktop.value = true;
//           return desktop!;
//         }
//         // If width it less then 1100 and more then 650 we consider it as tablet
//         else if (constraints.maxWidth >= 650) {
//           controller.isTablet.value = true;
//           return tablet!;
//         }
//         // Or less then that we called it mobile
//         else {
//           controller.isMobile.value = true;
//           return mobile!;
//         }
//       },
//     );
//   }
// }
