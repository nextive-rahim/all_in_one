import 'package:all_in_one/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_form_field_search.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/core/widgets/web/side_nav_bar_student.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/controller/student_home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardRegFirstTimeWebLarge extends StatefulWidget {
  const DashboardRegFirstTimeWebLarge({
    super.key,
  });

  @override
  State<DashboardRegFirstTimeWebLarge> createState() =>
      _DashboardRegFirstTimeWebLargeState();
}

class _DashboardRegFirstTimeWebLargeState
    extends State<DashboardRegFirstTimeWebLarge> {
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
    CacheService.boxAuth.read(CacheKeys.userType);
    return SafeArea(
      child: Scaffold(
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
                                  maxLine: 1,
                                  fontFamily: AppStrings.aeonikTRIAL,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 40,
                                ),
                                TextWidget(
                                  text: AppStrings.startLearningToday,
                                  color: CommonColor.headingTextColor1,
                                  maxLine: 1,
                                  fontFamily: AppStrings.sfProDisplay,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: _sizeConfig.getSize(347),
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
                              height: _sizeConfig.getSize(66),
                              hintText: AppStrings.searchForCourses,
                              readOnly: false,
                              maxLine: 1,
                              keyType: TextInputType.text,
                              wordLimit: 25,
                              fontFamily: AppStrings.inter,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              onChanged: (value) {
                                studentDashboardController
                                    .searchHomeCourse(value);
                              },
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
                          const SizedBox(width: 32),
                          SizedBox(
                            height: _sizeConfig.getSize(40),
                            width: _sizeConfig.getSize(50),
                            child: Stack(
                              children: [
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
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
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
                          children: [
                            Row(
                              children: [
                                const TextWidget(
                                    textAlign: TextAlign.center,
                                    text: AppStrings.latestCourses,
                                    color: CommonColor.headingTextColor1,
                                    maxLine: 1,
                                    fontFamily: AppStrings.aeonikTRIAL,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30),
                                SizedBox(width: _sizeConfig.getSize(8)),
                                const TextWidget(
                                  textAlign: TextAlign.center,
                                  text: AppStrings.fromTopExperts,
                                  color: CommonColor.headingTextColor1,
                                  maxLine: 1,
                                  fontFamily: AppStrings.aeonikTRIAL,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30,
                                ),
                              ],
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
                            //       return CategoryWiseCoursePage(
                            //         homeCourses:
                            //             studentDashboardController.searchCourse,
                            //         // onLogout: widget.onLogout,
                            //       );
                            //     } else {
                            //       return CategoryWiseCoursePage(
                            //         homeCourses:
                            //             studentDashboardController.homeCourses,
                            //         // onLogout: widget.onLogout,
                            //       );
                            //     }
                            //   },
                            // ),
                            // GridView.builder(
                            //   shrinkWrap: true,
                            //   itemCount:
                            //       AppStrings.dashboardFistTimeList.length,
                            //   //scrollDirection: Axis.horizontal,
                            //   gridDelegate:
                            //       SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            //     crossAxisCount: 3,
                            //     crossAxisSpacing: 30,
                            //     mainAxisSpacing: 1,
                            //     height: _sizeConfig
                            //         .getSize(500.0), //48 dp of height
                            //   ),
                            //   physics: const NeverScrollableScrollPhysics(),
                            //   itemBuilder: (context, index) {
                            //     return Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Container(
                            //           // width: _sizeConfig.getSize(362.0),
                            //           height: _sizeConfig.getSize(250.0),
                            //           //  color: CommonColor.greyColor3,
                            //           decoration: ShapeDecoration(
                            //             color: Colors.white,
                            //             shape: const Border(),
                            //             image: DecorationImage(
                            //               fit: BoxFit.fill,
                            //               image: AssetImage(
                            //                 ImageConstant
                            //                     .listOfThumbnails[index],
                            //               ),
                            //             ),
                            //           ),
                            //           alignment: Alignment.center,
                            //           child: GestureDetector(
                            //             onTap: () {
                            //               Navigator.push(
                            //                 context,
                            //                 MaterialPageRoute(
                            //                   builder: (context) =>
                            //                       const ResponsiveLayoutCourseDetailFormRegister(
                            //                     webLageScaffold:
                            //                         CourseDetailFormRegisterLargeWebPage(),
                            //                     webMediumScaffold:
                            //                         CourseDetailFormRegisterMediumWebPage(),
                            //                     webSmallScaffold:
                            //                         CourseDetailFormRegisterSmallWebPage(),
                            //                   ),
                            //                 ),
                            //               );
                            //             },
                            //             child: Container(
                            //               width: 76,
                            //               height: 76,
                            //               alignment: Alignment.center,
                            //               decoration: const ShapeDecoration(
                            //                 color: Colors.white,
                            //                 shape: CircleBorder(
                            //                     side: BorderSide.none),
                            //               ),
                            //               //color: CommonColor.whiteColor,
                            //               child: const Icon(
                            //                 Icons.play_arrow_outlined,
                            //                 size: 30,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //         SizedBox(height: _sizeConfig.getSize(10.0)),
                            //         TextWidget(
                            //           textAlign: TextAlign.center,
                            //           text: AppStrings
                            //               .dashboardFistTimeList[index],
                            //           color: CommonColor.headingTextColor1,
                            //           maxLine: 1,
                            //           fontFamily: AppStrings.sfProDisplay,
                            //           fontWeight: FontWeight.w400,
                            //           fontSize: 22,
                            //         ),
                            //         const TextWidget(
                            //           textAlign: TextAlign.center,
                            //           text: '9 Mins 80 Sec',
                            //           color: CommonColor.headingTextColor1,
                            //           maxLine: 1,
                            //           fontFamily: AppStrings.sfProDisplay,
                            //           fontWeight: FontWeight.w400,
                            //           fontSize: 16,
                            //         ),
                            //         const SizedBox(height: 50)
                            //       ],
                            //     );
                            //   },
                            // )
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
