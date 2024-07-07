import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_price/controller/course_price_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_registration/controller/course_registration_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/user_course_availablity/controller/user_course_availablity_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseRegistrationSection
    extends GetView<CourseRegistrationViewController> {
  const CourseRegistrationSection({
    super.key,
    required this.collectinListData,
    required this.coursePriceViewController,
    required this.userCourseAvailabilityViewController,
  });
  final CourseModel collectinListData;
  final CoursePriceViewController coursePriceViewController;
  final UserCourseAvailabilityViewController
      userCourseAvailabilityViewController;
  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    final userType = CacheService.boxAuth.read(CacheKeys.userType);
    if (userType == 2) {
      controller.appearInTest.value = true;
    }
    return Column(
      children: [
        Obx(
          () {
            if (coursePriceViewController.pageState == PageState.loading) {
              return Container(
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.lightBlack10,
                ),
              );
            }
            return controller.appearInTest.value ||
                    profileController.profileResponseModel.isSubscribed == 1 ||
                    controller.isWatchAllVideoList.contains(false)
                ? GestureDetector(
                    onTap: () {
                      if (controller.isCourseVideoWatched.value) {
                        // userCourseAvailabilityViewController
                        //     .checkUserCourseAvailability()
                        //     .then(
                        //   (value) {

                        Get.toNamed(
                          Routes.appearTestAndScheduleInterviewMobilePage,
                          arguments: [
                            collectinListData,
                            () {},
                          ],
                        );
                        // },
                        // );
                      } else {
                        Util.displayToast(
                            context,
                            "Please watch the all videos first",
                            CommonColor.redColors);
                      }
                    },
                    child: Container(
                      width: SizeConfig.screenWidth,
                      height: 44,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: CommonColor.blueColor1,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 0.50,
                            color: CommonColor.blueColor1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: CommonColor.blackColor3,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: CommonColor.whiteColor,
                            size: 24,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppStrings.appearInTest,
                            style: TextStyle(
                              color: CommonColor.whiteColor,
                              fontSize: 16,
                              fontFamily: AppStrings.inter,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      // Util.showLoader(context);
                      controller
                          .checkCourseRegistration(
                              collectinListData.id!,
                              coursePriceViewController
                                  .coursePriceReponseData[0].courseReteId
                                  .toString())
                          .then((value) {
                        Get.find<ProfileController>().profile();
                        courseRegistrationSuccessfulBottomSheet(
                                controller.registration.message, context)
                            .then((value) {
                          //if (true) {
                          controller.appearInTest.value = true;
                          controller.courseRegistered.value = true;
                          // }
                        });
                      });
                    },
                    child: Container(
                      width: SizeConfig.screenWidth,
                      height: 44,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: CommonColor.blueColor1,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 0.50,
                            color: CommonColor.blueColor1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const TextWidget(
                        text: AppStrings.registerInThisCourse,
                        color: CommonColor.whiteColor,
                        maxLine: 1,
                        fontFamily: AppStrings.inter,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  );
          },
        ),
      ],
    );
  }

  Future<bool> courseRegistrationSuccessfulBottomSheet(
      String msg, BuildContext context) async {
    return await showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 60,
              ),
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    height: 215,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 100,
                          offset: Offset(0, 4),
                          spreadRadius: 5,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 17,
                        left: 21,
                        top: 15,
                        bottom: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.check_circle_outline_outlined,
                                color: CommonColor.greenColor1,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const TextWidget(
                                  text: AppStrings.courseRegistrationSuccessful,
                                  color: CommonColor.greenColor1,
                                  maxLine: 2,
                                  fontFamily: AppStrings.aeonikTRIAL,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                              const SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context, true);
                                },
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  padding: const EdgeInsets.all(8),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: CommonColor.greyColor5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: CommonColor.blackColor3,
                                        blurRadius: 2,
                                        offset: Offset(0, 1),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(),
                                    child: const Icon(
                                      Icons.clear,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextWidget(
                            text: msg,
                            //'You have successfully registered to this couse - React Native IOS and Android App Development for Beginners (KM0063)',
                            color: CommonColor.blackColor1,
                            maxLine: 5,
                            fontFamily: AppStrings.sfProDisplay,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ) ??
        false; //if showDialouge had returned null, then return false
  }
}
