import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/empty_screen.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/controller/student_home_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/widget/course_card_loading.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/widget/category_with_course_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWithCoursePage extends StatefulWidget {
  const CategoryWithCoursePage({super.key});

  @override
  State<CategoryWithCoursePage> createState() => _CategoryWithCoursePageState();
}

class _CategoryWithCoursePageState extends State<CategoryWithCoursePage> {
  final studentDashboardController = Get.put(StudentHomeViewController());

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   studentDashboardController.getStudentHomeData();
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      resizeToAvoidBottomInset: false,
      // backgroundColor: CommonColor.greyColor1,
      body: RefreshIndicator(
        onRefresh: () async {
          studentDashboardController.getStudentHomeData();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 65,
              right: 65,
              // top: 30,
              bottom: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const StudentAppBarMobile(
                //   titel1: AppStrings.welcomeBackJoydeepForDemo,
                //   title2: AppStrings.startLearningToday,
                //   isBack: false,
                //   searchHintText: AppStrings.searchForCourses,
                //   // onSearchListener: (value) {
                //   //   studentDashboardController.searchHomeCourse(value);
                //   // },
                // ),
                const SizedBox(height: 20),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.courses,
                        style: TextStyle(
                          color: CommonColor.greyColor4,
                          fontSize: 20,
                          fontFamily: AppStrings.aeonikTRIAL,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' ${AppStrings.forYou}',
                        style: TextStyle(
                          color: CommonColor.greyColor4,
                          fontSize: 18,
                          fontFamily: AppStrings.aeonikTRIAL,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () {
                    if (studentDashboardController.pageState ==
                        PageState.loading) {
                      return const CourseCardLoading();
                    }
                    if (studentDashboardController.homeCourses.isEmpty) {
                      return const EmptyScreen();
                    }
                    // if (studentDashboardController.searchCourse.isNotEmpty) {
                    //   return CategoryWithCourseBuilder(
                    //     categories: studentDashboardController.searchCourse,
                    //     // onLogout: widget.onLogout,
                    //   );
                    // } else {

                    return CategoryWithCourseBuilder(
                      categories: studentDashboardController.homeCourses,
                      // onLogout: widget.onLogout,
                    );
                    //  }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
