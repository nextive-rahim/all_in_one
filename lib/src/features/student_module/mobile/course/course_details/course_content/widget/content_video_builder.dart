import 'package:all_in_one/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/controller/is_watch_video_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/model/student_course_content_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_registration/controller/course_registration_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentVideoBuilder extends StatefulWidget {
  const ContentVideoBuilder({
    super.key,
    required this.contentVideoList,
    required this.index,
  });
  final int index;
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

  // bool isShownVideo = false;
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.contentVideoList.length; i++) {
      if (widget.contentVideoList[i].isWatch == 1) {
        courseRegistratoinController.isWatchAllVideoList.add(true);
      } else {
        courseRegistratoinController.isWatchAllVideoList.add(false);
      }
    }
    if (!courseRegistratoinController.isWatchAllVideoList.contains(false)) {
      courseRegistratoinController.isCourseVideoWatched.value = true;
    }
  }

  final profileController = Get.find<ProfileController>();
  final userType = CacheService.boxAuth.read(CacheKeys.userType);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: widget.contentVideoList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index2) {
        return CheckboxListTile(
          value: widget.contentVideoList[index2].isWatch == 1 ||
              courseRegistratoinController.isWatchAllVideoList[index2],
          title: GestureDetector(
              onTap: () {
                if (userType == 1 &&
                    (courseRegistratoinController.courseRegistered.value ||
                        profileController.profileResponseModel.isSubscribed !=
                            1)) {
                  return Util.displayToast(
                    context,
                    "Please register the course first",
                    CommonColor.redColors,
                  );
                }
                videoController.videolink.value =
                    // 'https://www.youtube.com/watch?v=B5i-MSifHvY';
                    widget.contentVideoList[index2].videoLink ?? '';
                if (!courseRegistratoinController.isWatchAllVideoList
                    .contains(false)) {
                  courseRegistratoinController.isCourseVideoWatched.value =
                      true;
                }
                courseRegistratoinController.isCourseVideoWatched.value = true;
                if (widget.contentVideoList[index2].isWatch != 1) {
                  videoController.isWatchVideo(
                    widget.contentVideoList[index2].id!,
                    widget.contentVideoList[index2].courseId!,
                  );
                }
                setState(() {
                  courseRegistratoinController.isWatchAllVideoList[index2] =
                      true;
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
