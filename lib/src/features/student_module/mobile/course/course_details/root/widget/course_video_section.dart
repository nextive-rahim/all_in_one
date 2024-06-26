import 'package:all_in_one/src/core/controller/video_player_view_controller.dart';
import 'package:all_in_one/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/controller/is_watch_video_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_registration/controller/course_registration_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDetailsVideoSection extends StatefulWidget {
  const CourseDetailsVideoSection({
    super.key,
    required this.collectinListData,
    required this.registrationController,
  });
  final CourseModel collectinListData;
  final CourseRegistrationViewController registrationController;

  @override
  State<CourseDetailsVideoSection> createState() =>
      _CourseDetailsVideoSectionState();
}

class _CourseDetailsVideoSectionState extends State<CourseDetailsVideoSection> {
  final videoController = Get.find<IsWatchVideoViewController>();
  final userType = CacheService.boxAuth.read(CacheKeys.userType);
  @override
  void initState() {
    // videoController.playVideo(widget.collectinListData.introVideo!);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    if (userType == 2) {
      widget.registrationController.courseRegistered.value = true;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            if (widget.registrationController.courseRegistered.value ||
                profileController.profileResponseModel.isSubscribed == 1) {
              // PersistentNavBarNavigator.pushNewScreen(
              //   context,
              //   screen: YoutubePlayerFullscreen(
              //       videoId: (collectinListData.introVideo!
              //           .split("v=")
              //           .last) //'lNQJNImBsKY',
              //       ),
              //   withNavBar: false, // OPTIONAL VALUE. True by default.
              //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
              // ).then((value) {
              //   registrationController.isCourseVideoWatched.value = true;
              // });
            } else {
              Util.displayToast(context, "Please register your course",
                  CommonColor.redColors);
            }
          },
          child: Obx(
            () {
              return CommonVideoPlayer(
                key: ValueKey(videoController.videolink.value),
                videoLink: videoController.videolink.value,
                autoPlayVideo: true,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        // TextWidget(
        //   textAlign: TextAlign.start,
        //   text: widget.collectinListData.subTitle ??
        //       '', //'Introduction to React for beginners',
        //   color: CommonColor.blackColor1,
        //   maxLine: 2,
        //   fontFamily: AppStrings.sfProDisplay,
        //   fontWeight: FontWeight.w400,
        //   fontSize: 16,
        // ),
        // TextWidget(
        //   textAlign: TextAlign.start,
        //   text: '0:00 / ${widget.collectinListData.totalTime}', //'0:00 / 7:48',
        //   color: CommonColor.greyColor6,
        //   maxLine: 2,
        //   fontFamily: AppStrings.sfProDisplay,
        //   fontWeight: FontWeight.w400,
        //   fontSize: 12,
        // ),
        const SizedBox(height: 14),
      ],
    );
  }
}
