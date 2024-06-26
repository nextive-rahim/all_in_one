import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/view_comment_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/write_comment_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/model/student_view_comment_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteComment extends GetView<WriteCommentViewController> {
  const WriteComment({
    super.key,
    required this.collectinListData,
  });
  final CourseModel collectinListData;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            text: AppStrings.courseDiscussionForum,
            color: Colors.black,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () {
              controller.writeComment.value = true;
            },
            child: Card(
              child: Container(
                width: SizeConfig.screenWidth,
                height: 58,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 0.50,
                      color: CommonColor.blueColor1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: const Icon(
                        Icons.add_box_outlined,
                        color: CommonColor.blueColor1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const TextWidget(
                      text: AppStrings.writeMessage,
                      color: Colors.black,
                      maxLine: 1,
                      fontFamily: AppStrings.inter,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 00),
          Visibility(
            visible: controller.writeComment.value,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 30,
              ),
              child: Column(
                children: [
                  SizedBox(
                    // height: 281,
                    width: SizeConfig.screenWidth,

                    child: TextFormFieldWidget(
                      controller: controller.writeCommentTextController,
                      valtext: AppStrings.commonTextVal,
                      height: 45,
                      hintText: "Wirte a post ....",
                      readOnly: false,
                      maxLine: 7,
                      keyType: TextInputType.text,
                      wordLimit: 300,
                      fontFamily: AppStrings.inter,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.writeComment.value = false;
                          //controller.disable();
                        },
                        child: Container(
                          width: 120,
                          height: 44,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: CommonColor.whiteColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 0.50,
                                color: CommonColor.greyColor5,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const TextWidget(
                            text: AppStrings.cancel,
                            color: CommonColor.blackColor4,
                            maxLine: 1,
                            fontFamily: AppStrings.inter,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      GestureDetector(
                        onTap: () {
                          if (controller
                              .writeCommentTextController.text.isNotEmpty) {
                            controller
                                .writeComments(collectinListData.id!,
                                    controller.writeCommentTextController.text)
                                .then((value) {
                              Get.find<ViewCommentViewController>()
                                  .addNewComment((ViewCommentResponseData(
                                      updatedAt: DateTime.now(),
                                      username: Get.find<ProfileController>()
                                              .userModel
                                              ?.name ??
                                          '',
                                      commentText: controller
                                          .writeCommentTextController.text)));

                              controller.writeCommentTextController.text = '';
                            });
                          } else {
                            Util.displayToast(
                              context,
                              "Please make a comment",
                              CommonColor.redColors,
                            );
                          }
                        },
                        child: Container(
                          width: 120,
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
                            text: AppStrings.postNow,
                            color: CommonColor.whiteColor,
                            maxLine: 1,
                            fontFamily: AppStrings.inter,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
