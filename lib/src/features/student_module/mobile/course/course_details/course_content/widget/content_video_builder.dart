import 'package:all_in_one/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/controller/is_watch_video_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/model/student_course_content_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_registration/controller/course_registration_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentVideoBuilder extends StatefulWidget {
  const ContentVideoBuilder({
    super.key,
    required this.contentVideoList,
  });
  final List<CourseContent> contentVideoList;

  @override
  State<ContentVideoBuilder> createState() => _ContentVideoBuilderState();
}

// List<String> videoList = [
//   'https://www.youtube.com/watch?v=-WLd-_2RmIw',
//   'https://www.youtube.com/watch?v=nnV1fYnwbYA',
//   'https://www.youtube.com/watch?v=OTAvsKcmMq8',
// ];

class _ContentVideoBuilderState extends State<ContentVideoBuilder> {
  final videoController = Get.find<IsWatchVideoViewController>();
  final courseRegistratoinController =
      Get.find<CourseRegistrationViewController>();
  List<bool> isWachVideoList = [];
  // bool isShownVideo = false;
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.contentVideoList.length; i++) {
      if (widget.contentVideoList[i].isWatch == 1) {
        isWachVideoList.add(true);
        setState(() {});
      } else {
        isWachVideoList.add(false);
        setState(() {});
      }
    }

    print('watch Video list Length 1 :${isWachVideoList.length}');
  }

  final profileController = Get.find<ProfileController>();
  final userType = CacheService.boxAuth.read(CacheKeys.userType);

  @override
  Widget build(BuildContext context) {
    print('Watch video lIst : ${isWachVideoList.map((e) => e)}');
    if (!isWachVideoList.contains(false)) {
      courseRegistratoinController.isCourseAllVideosWatched.value = true;
      print(
          "isWatchedAllVideo :  ${courseRegistratoinController.isCourseAllVideosWatched.value}");
    }

    print(" Any UnWatched Vedio: ${isWachVideoList.contains(false)}");

    print(
        'Is  Register course : ${(userType == 1 && profileController.profileResponseModel.isSubscribed == 1)}');
    if (userType == 1 &&
        profileController.profileResponseModel.isSubscribed == 1) {
      courseRegistratoinController.isCourseAllVideosWatched.value = true;
    }
    return ListView.separated(
      shrinkWrap: true,
      itemCount: widget.contentVideoList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index2) {
        return CheckboxListTile(
          value: widget.contentVideoList[index2].isWatch == 1 ||
              isWachVideoList[index2],
          title: GestureDetector(
              onTap: () {
                print(
                    " Any UNWatched Vedio: ${isWachVideoList.contains(false)}");
                if (((userType == 1 &&
                        profileController.profileResponseModel.isSubscribed !=
                            1) ||
                    !courseRegistratoinController
                        .isCourseAllVideosWatched.value)) {
                  return Util.displayToast(
                    context,
                    "Please register the course first",
                    CommonColor.redColors,
                  );
                }
                videoController.videolink.value =
                    // 'https://www.youtube.com/watch?v=B5i-MSifHvY';
                    widget.contentVideoList[index2].videoLink ?? '';
                if (!isWachVideoList.contains(false)) {
                  courseRegistratoinController.isCourseAllVideosWatched.value =
                      true;
                  print(
                      "isWatchedAllVideo :  ${courseRegistratoinController.isCourseAllVideosWatched.value}");
                }

                if (widget.contentVideoList[index2].isWatch != 1) {
                  videoController.isWatchVideo(
                    widget.contentVideoList[index2].id!,
                    widget.contentVideoList[index2].courseId!,
                  );
                }
                setState(() {
                  isWachVideoList[index2] = true;
                });

                //  print(dataList.map((e) => e));
              },
              child: Text(widget.contentVideoList[index2].name ?? '')),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (checked) {
            //  isShownVideo = checked!;

            // setState(() {});
          },
        );
      },
      separatorBuilder: (context, index2) {
        return const SizedBox(height: 8);
      },
    );
  }

  void _onItemCheckedChange() {}
}
