import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/empty_screen.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/controller/student_home_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/widget/category_wise_course_builder.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/widget/course_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWiseCoursePage extends StatefulWidget {
  const CategoryWiseCoursePage({
    super.key,
    required this.title,
// required this.categoryWiseCourse,
  });
  final String? title;
//final List<CourseModel> categoryWiseCourse;
  @override
  State<CategoryWiseCoursePage> createState() => _CategoryWiseCoursePageState();
}

class _CategoryWiseCoursePageState extends State<CategoryWiseCoursePage> {
  final studentDashboardController = Get.put(StudentHomeViewController());
//final List<CourseCard> courseList=Get.arguments;
  String? title;
  // Map<String, dynamic>? arguments;
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    studentDashboardController.categoryWiseCourse.value =
        CacheService.boxAuth.read(CacheKeys.categoryWisecourseList);
    //setState(() {
    // arguments = Get.arguments;
    title = widget.title;
    // });

    //studentDashboardController.getStudentHomeData();
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String id = Get.parameters['title'] ?? 'Unknown ID';
    print(id);
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        title: Text(title ?? 'no found'),
      ),
      resizeToAvoidBottomInset: false,
      // backgroundColor: CommonColor.greyColor1,
      body: RefreshIndicator(
        onRefresh: () async {
          studentDashboardController.getStudentHomeData();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              // top: 30,
              bottom: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // StudentAppBarMobile(
                //   titel1: AppStrings.welcomeBackJoydeepForDemo,
                //   title2: AppStrings.startLearningToday,
                //   isBack: false,
                //   searchHintText: AppStrings.searchForCourses,
                //   onSearchListener: (value) {
                //     studentDashboardController.searchHomeCourse(value);
                //   },
                // ),
                const SizedBox(height: 30),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.courses,
                        style: TextStyle(
                          color: CommonColor.greyColor4,
                          fontSize: 18,
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
                    if (studentDashboardController.categoryWiseCourse.isEmpty) {
                      return const EmptyScreen();
                    }
                    if (studentDashboardController.searchCourse.isNotEmpty) {
                      return CategoryWiseCourseBuilder(
                        courseList: studentDashboardController.searchCourse,
                        // onLogout: widget.onLogout,
                      );
                    } else {
                      return CategoryWiseCourseBuilder(
                        courseList:
                            studentDashboardController.categoryWiseCourse,
                        // onLogout: widget.onLogout,
                      );
                    }
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
