import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_form_field_search.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/core/widgets/web/side_nav_bar_student.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/controller/student_home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardRegFirstTimeWebMedium extends StatefulWidget {
  const DashboardRegFirstTimeWebMedium({
    super.key,
  });

  @override
  State<DashboardRegFirstTimeWebMedium> createState() =>
      _DashboardRegFirstTimeWebMediumState();
}

class _DashboardRegFirstTimeWebMediumState
    extends State<DashboardRegFirstTimeWebMedium> {
  final _searchController = TextEditingController();

  final studentDashboardController = Get.find<StudentHomeViewController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      studentDashboardController.getStudentHomeData();
    });
    // TODO: implement initState
    super.initState();
  }

  bool jobDropdownOpen = false;
  final SizeConfig _sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
        body: Row(
          children: [
            SideNavBarStudent(
              jobDropdownOpen: jobDropdownOpen,
              screenLarge: true,
              onChangedjobDropdown: (val) {
                setState(() {
                  jobDropdownOpen = !jobDropdownOpen;
                });
              },
              onChangedNavigation: (val) {},
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 163,
                    color: CommonColor.whiteColor,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: _sizeConfig.getSize(44),
                        right: _sizeConfig.getSize(109),
                        top: _sizeConfig.getSize(44),
                        bottom: _sizeConfig.getSize(10),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                      text: AppStrings.welcomeBackJoydeep,
                                      color: CommonColor.headingTextColor1,
                                      maxLine: 2,
                                      fontFamily: AppStrings.aeonikTRIAL,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 35),
                                  TextWidget(
                                      text: AppStrings.startLearningToday,
                                      color: CommonColor.headingTextColor1,
                                      maxLine: 2,
                                      fontFamily: AppStrings.sfProDisplay,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18),
                                ],
                              )),
                          const SizedBox(
                            width: 32,
                          ),
                          Container(
                            width: _sizeConfig.getSize(320),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x0C000000),
                                  blurRadius: 50,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: TextFormFieldSearchWidget(
                              controller: _searchController,
                              valtext: AppStrings.commonTextVal,
                              height: _sizeConfig.getSize(60),
                              hintText: AppStrings.searchForCourses,
                              readOnly: false,
                              maxLine: 1,
                              keyType: TextInputType.text,
                              wordLimit: 25,
                              fontFamily: AppStrings.inter,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              onChanged: (value) {},
                              suffixIcon: const Icon(
                                Icons.close,
                                color: Colors.grey,
                                size: 16,
                              ),
                              onSuffixTap: () {
                                setState(() {
                                  _searchController.text = '';
                                });
                              },
                              preffixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 16,
                              ),
                              onPreffixTap: () {
                                setState(() {
                                  // hintUsernameHelperText = !hintUsernameHelperText;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          SizedBox(
                            height: _sizeConfig.getSize(40),
                            width: _sizeConfig.getSize(50),
                            child: Stack(children: [
                              const Positioned(
                                left: 0,
                                bottom: 0,
                                child: Icon(
                                  Icons.notifications_none_outlined,
                                  color: CommonColor.headingTextColor1,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: SizedBox(
                                  height: _sizeConfig.getSize(30),
                                  width: _sizeConfig.getSize(30),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      //set border radius more than 50% of height and width to make circle
                                    ),
                                    color: CommonColor.whiteColor,
                                    elevation: 5,
                                    child: const TextWidget(
                                        textAlign: TextAlign.center,
                                        text: '2',
                                        color: CommonColor.headingTextColor1,
                                        maxLine: 1,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                ),
                              )
                            ]),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: _sizeConfig.getSize(44),
                          right: _sizeConfig.getSize(150),
                          top: _sizeConfig.getSize(37),
                          bottom: _sizeConfig.getSize(50),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Row(
                                children: [
                                  const TextWidget(
                                      textAlign: TextAlign.center,
                                      text: AppStrings.latestCourses,
                                      color: CommonColor.headingTextColor1,
                                      maxLine: 2,
                                      fontFamily: AppStrings.aeonikTRIAL,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25),
                                  SizedBox(
                                    width: _sizeConfig.getSize(8),
                                  ),
                                  const TextWidget(
                                      textAlign: TextAlign.center,
                                      text: AppStrings.fromTopExperts,
                                      color: CommonColor.headingTextColor1,
                                      maxLine: 2,
                                      fontFamily: AppStrings.aeonikTRIAL,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 25),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: _sizeConfig.getSize(31),
                            ),
                            // Obx(
                            //   () {
                            //     if (studentDashboardController.pageState ==
                            //         PageState.loading) {
                            //       return const CourseCardLoading();
                            //     }
                            //     if (studentDashboardController
                            //         .homeCourses.isEmpty) {
                            //       return const EmptyScreen();
                            //     }
                            //     if (studentDashboardController
                            //         .searchCourse.isNotEmpty) {
                            //       return StudentHomeCourseBuilderWeb(
                            //         homeCourses:
                            //             studentDashboardController.searchCourse,
                            //         // onLogout: widget.onLogout,
                            //       );
                            //     } else {
                            //       return StudentHomeCourseBuilderWeb(
                            //         homeCourses:
                            //             studentDashboardController.homeCourses,
                            //         // onLogout: widget.onLogout,
                            //       );
                            //     }
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
