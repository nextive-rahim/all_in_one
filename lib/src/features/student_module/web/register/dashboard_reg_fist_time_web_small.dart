// import 'package:all_in_one/src/core/utils/colors.dart';
// import 'package:all_in_one/src/core/utils/size_config.dart';
// import 'package:all_in_one/src/core/utils/strings.dart';
// import 'package:all_in_one/src/core/widgets/mobile/student_app_bar.dart';
// import 'package:all_in_one/src/core/widgets/text_widget.dart';
// import 'package:all_in_one/src/core/widgets/web/side_nav_bar_student.dart';
// import 'package:all_in_one/src/features/student_module/mobile/course/home_course/controller/student_home_view_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DashboardRegFirstTimeWebSmall extends StatefulWidget {
//   const DashboardRegFirstTimeWebSmall({
//     super.key,
//   });

//   @override
//   State<DashboardRegFirstTimeWebSmall> createState() =>
//       _DashboardRegFirstTimeWebSmallState();
// }

// class _DashboardRegFirstTimeWebSmallState
//     extends State<DashboardRegFirstTimeWebSmall> {
//   // final _searchController = TextEditingController();
//   final studentDashboardController = Get.find<StudentHomeViewController>();

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       studentDashboardController.getStudentHomeData();
//     });
//     // TODO: implement initState
//     super.initState();
//   }

//   bool jobDropdownOpen = false;
//   final SizeConfig _sizeConfig = SizeConfig();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: CommonColor.greyColor1,
//         body: Row(
//           children: [
//             SideNavBarStudent(
//               jobDropdownOpen: jobDropdownOpen,
//               screenLarge: false,
//               onChangedjobDropdown: (val) {
//                 setState(() {
//                   jobDropdownOpen = !jobDropdownOpen;
//                 });
//               },
//               onChangedNavigation: (val) {},
//             ),
//             Expanded(
//               child: Column(
//                 children: [
//                   Container(
//                     color: CommonColor.whiteColor,
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                         left: _sizeConfig.getSize(20),
//                         right: _sizeConfig.getSize(20),
//                         top: _sizeConfig.getSize(30),
//                         bottom: _sizeConfig.getSize(30),
//                       ),
//                       child: StudentAppBarMobile(
//                         titel1: AppStrings.welcomeBackJoydeepForDemo,
//                         title2: AppStrings.startLearningToday,
//                         isBack: false,
//                         searchHintText: AppStrings.searchForCourses,
//                         onSearchListener: (value) {
//                           studentDashboardController.searchHomeCourse(value);
//                         },
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                           left: 20,
//                           right: 20,
//                           top: 20,
//                           bottom: 25,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             FittedBox(
//                               child: Row(
//                                 children: [
//                                   const TextWidget(
//                                       textAlign: TextAlign.center,
//                                       text: AppStrings.latestCourses,
//                                       color: CommonColor.headingTextColor1,
//                                       maxLine: 1,
//                                       fontFamily: AppStrings.aeonikTRIAL,
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 16),
//                                   SizedBox(
//                                     width: _sizeConfig.getSize(8),
//                                   ),
//                                   const TextWidget(
//                                       textAlign: TextAlign.center,
//                                       text: AppStrings.fromTopExperts,
//                                       color: CommonColor.headingTextColor1,
//                                       maxLine: 2,
//                                       fontFamily: AppStrings.aeonikTRIAL,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 16),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             // Obx(
//                             //   () {
//                             //     if (studentDashboardController.pageState ==
//                             //         PageState.loading) {
//                             //       return const CourseCardLoading();
//                             //     }
//                             //     if (studentDashboardController
//                             //         .homeCourses.isEmpty) {
//                             //       return const EmptyScreen();
//                             //     }
//                             //     if (studentDashboardController
//                             //         .searchCourse.isNotEmpty) {
//                             //       return StudentHomeCourseBuilder(
//                             //         homeCourses:
//                             //             studentDashboardController.searchCourse,
//                             //         // onLogout: widget.onLogout,
//                             //       );
//                             //     } else {
//                             //       return StudentHomeCourseBuilder(
//                             //         homeCourses:
//                             //             studentDashboardController.homeCourses,
//                             //         // onLogout: widget.onLogout,
//                             //       );
//                             //     }
//                             //   },
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
