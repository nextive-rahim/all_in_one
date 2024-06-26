import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/core/widgets/web/side_nav_bar_student.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/view_comment_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/write_comment_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/view/comment_section.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/controller/student_course_content_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/view/content_section.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_level/view/course_level_section.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_price/controller/course_price_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_registration/controller/course_registration_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_registration/view/course_registration.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/root/widget/course_video_section.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/user_course_availablity/controller/user_course_availablity_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class CourseDetailFormRegisterLargeWebPage extends StatefulWidget {
  const CourseDetailFormRegisterLargeWebPage({
    super.key,
    required this.collectinListData,
  });
  final CourseModel collectinListData;

  @override
  State<CourseDetailFormRegisterLargeWebPage> createState() =>
      _CourseDetailFormRegisterLargeWebPageState();
}

class _CourseDetailFormRegisterLargeWebPageState
    extends State<CourseDetailFormRegisterLargeWebPage> {
  //final HtmlEditorController controller = HtmlEditorController();
  String? editorResult = '';
  final ScrollController _scrollController1 = ScrollController(),
      _scrollController2 = ScrollController();

  final List<List<String>> _selectedValues = [[], [], []];

  final contentController = Get.put(StudentCourseContentViewController());
  final commentController = Get.put(ViewCommentViewController());
  final registrationController = Get.put(CourseRegistrationViewController());
  final coursePriceController = Get.put(CoursePriceViewController());
  final criteCommentViewController = Get.put(WriteCommentViewController());
  final userCourseAvailablityController =
      Get.put(UserCourseAvailabilityViewController());
  // final commentController = Get.find<StudentCommentViewController>();
  // final registrationController = Get.find<CourseRegistrationViewController>();
  // final coursePriceController = Get.find<CoursePriceViewController>();
  // final userCourseAvailablityController =
  //     Get.find<UserCourseAvailabilityViewController>();
  String dropdownValue = AppStrings.courseLevelDropdown.first;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      contentController.getCourseContents(widget.collectinListData.id!, 1);
      commentController.getComments(widget.collectinListData.id!.toString());
      coursePriceController.checkCoursePrice(widget.collectinListData.id!);
    });

    super.initState();
  }

  void _onItemCheckedChange(String itemValue, bool checked, int index1) {
    setState(() {
      if (checked) {
        _selectedValues[index1].add(itemValue);
      } else {
        _selectedValues[index1].remove(itemValue);
      }
    });
  }

  bool jobDropdownOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: SingleChildScrollView(
                controller: _scrollController1,
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 53,
                    right: 43,
                    left: 20,
                    bottom: 60,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: CommonColor.blackColor,
                              size: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const TextWidget(
                            text: "Back",
                            color: CommonColor.headingTextColor1,
                            maxLine: 1,
                            fontFamily: AppStrings.inter,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ],
                      ),
                      const SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            child: SizedBox(
                              child: TextWidget(
                                textAlign: TextAlign.start,
                                text: widget.collectinListData.title ?? '',
                                color: CommonColor.blackColor1,
                                maxLine: 2,
                                fontFamily: AppStrings.aeonikTRIAL,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: () {
                              shareLink();
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              padding: const EdgeInsets.all(8),
                              clipBehavior: Clip.antiAlias,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.50,
                                      color: CommonColor.greyColor5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Icon(Icons.share_outlined),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: widget.collectinListData.totalTime ?? '',
                              style: const TextStyle(
                                color: CommonColor.greyColor6,
                                fontSize: 12,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: ' / By ${widget.collectinListData.author}',
                              style: const TextStyle(
                                color: CommonColor.greyColor6,
                                fontSize: 12,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: SizeConfig.screenWidth,
                        height: 373,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Colors.black.withOpacity(0.05000000074505806),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: CourseDetailsVideoSection(
                          collectinListData: widget.collectinListData,
                          registrationController: registrationController,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CourseRegistrationSection(
                        collectinListData: widget.collectinListData,
                        coursePriceViewController: coursePriceController,
                        userCourseAvailabilityViewController:
                            userCourseAvailablityController,
                      ),
                      const SizedBox(height: 21),
                      CommentSection(
                          collectinListData: widget.collectinListData),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 76,
                  right: 28,
                  left: 8,
                  bottom: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CourseLevelSection(),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _scrollController2,
                        scrollDirection: Axis.vertical,
                        child: Container(
                          width: 422,
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                            bottom: 10,
                          ),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x0C000000),
                                blurRadius: 20,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CourseContent(),

                                // ListView.separated(
                                //   shrinkWrap: true,
                                //   itemCount: AppStrings.courseContentList.length,
                                //   physics: const NeverScrollableScrollPhysics(),
                                //   itemBuilder: (context, index1) {
                                //     return ExpansionTile(
                                //       initiallyExpanded: true,
                                //       title: TextWidget(
                                //           textAlign: TextAlign.start,
                                //           text: AppStrings
                                //               .courseContentList[index1],
                                //           color: CommonColor.blackColor2,
                                //           maxLine: 2,
                                //           fontFamily: AppStrings.sfProDisplay,
                                //           fontWeight: FontWeight.w600,
                                //           fontSize: 16),
                                //       subtitle: const TextWidget(
                                //           text: '1 / 3  |  19 min',
                                //           color: CommonColor.blackColor2,
                                //           maxLine: 1,
                                //           fontFamily: AppStrings.sfProDisplay,
                                //           fontWeight: FontWeight.w400,
                                //           fontSize: 12),
                                //       children: [
                                //         ListView.separated(
                                //           shrinkWrap: true,
                                //           itemCount: AppStrings
                                //               .courseContentSubList[index1]
                                //               .length,
                                //           physics:
                                //               const NeverScrollableScrollPhysics(),
                                //           itemBuilder: (context, index2) {
                                //             final checked =
                                //                 _selectedValues[index1].contains(
                                //                     AppStrings
                                //                             .courseContentSubList[
                                //                         index1][index2]);
                                //             return CheckboxListTile(
                                //               value: checked,
                                //               title: Text(
                                //                   AppStrings.courseContentSubList[
                                //                       index1][index2]),
                                //               controlAffinity:
                                //                   ListTileControlAffinity.leading,
                                //               onChanged: (checked) =>
                                //                   _onItemCheckedChange(
                                //                       AppStrings
                                //                               .courseContentSubList[
                                //                           index1][index2],
                                //                       checked!,
                                //                       index1),
                                //             );
                                //           },
                                //           separatorBuilder: (context, index2) {
                                //             return const SizedBox(
                                //               height: 8,
                                //             );
                                //           },
                                //         )
                                //       ],
                                //     );
                                //   },
                                //   separatorBuilder: (context, index) {
                                //     return const SizedBox(
                                //       height: 26,
                                //     );
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Future<void> shareLink() async {
    await Share.shareUri(Uri.parse('www.google.com'));
  }
}
