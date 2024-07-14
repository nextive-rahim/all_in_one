import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/view_comment_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/view/comment_section.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/controller/is_watch_video_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/controller/student_course_content_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/view/content_section.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_price/controller/course_price_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_registration/controller/course_registration_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_registration/view/course_registration.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/root/widget/course_video_section.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/user_course_availablity/controller/user_course_availablity_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class CourseDetailMobilePage extends StatefulWidget {
  const CourseDetailMobilePage({super.key, this.collectinListData});
  final CourseModel? collectinListData;
  @override
  State<CourseDetailMobilePage> createState() => _CourseDetailMobilePageState();
}

class _CourseDetailMobilePageState extends State<CourseDetailMobilePage> {
  CourseModel? collectinListData;
  //final Function onLogout = Get.arguments[1];

  String? editorResult = '';
  final contentController = Get.find<StudentCourseContentViewController>();
  final commentController = Get.find<ViewCommentViewController>();
  final registrationController = Get.find<CourseRegistrationViewController>();
  final coursePriceController = Get.find<CoursePriceViewController>();
  final userCourseAvailablityController =
      Get.find<UserCourseAvailabilityViewController>();
  final videoController = Get.find<IsWatchVideoViewController>();
  String dropdownValue = AppStrings.courseLevelDropdown.first;
  @override
  void initState() {
    collectinListData = widget.collectinListData ?? Get.arguments;
    videoController.videolink.value = collectinListData!.introVideo ?? '';
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      contentController.getCourseContents(
        collectinListData!.id!,
        collectinListData!.coursesLevel == 'Beginner'
            ? 1
            : collectinListData!.coursesLevel == 'Intermediate'
                ? 2
                : 3,
      );
      commentController.getComments(collectinListData!.id!.toString());
      coursePriceController.checkCoursePrice(collectinListData!.id!);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          collectinListData!.title ?? "",
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 3),
          CourseDetailsVideoSection(
            collectinListData: collectinListData!,
            registrationController: registrationController,
          ),
          // CourseLevelSection(collectinListData: collectinListData!),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 10,
                  left: 10,
                  bottom: 60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CourseShareSection(collectinListData: collectinListData!),

                    const CourseContent(),
                    CommentSection(collectinListData: collectinListData!),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CourseRegistrationSection(
            collectinListData: collectinListData!,
            coursePriceViewController: coursePriceController,
            userCourseAvailabilityViewController:
                userCourseAvailablityController,
          ),
        ),
      ),
    );
  }

  Future<void> _shareLink() async {
    await Share.shareUri(Uri.parse('www.google.com'));
  }
}
