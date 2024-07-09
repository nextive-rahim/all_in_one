import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/view_reply_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/write_reply_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/model/student_view_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentReplyCard extends GetView<WriteReplyViewController> {
  const CommentReplyCard({
    super.key,
    required this.comment,
  });
  final ViewCommentResponseData comment;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormFieldWidget(
            controller: controller.repleCommentTextController,
            valtext: AppStrings.commonTextVal,
            height: 60,
            hintText: "Wirte a reply ....",
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 300,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
            onPressed: () {
              if (controller.repleCommentTextController.text.isEmpty) {
                return Util.displayToast(
                  context,
                  "Please make a reply",
                  CommonColor.redColors,
                );
              }
              controller
                  .addReply(
                comment.id!,
                controller.repleCommentTextController.text,
              )
                  .then((value) {
                Get.find<ViewReplyViewController>().viewReply(
                    (ViewCommentResponseData(
                        updatedAt: DateTime.now(),
                        username:
                            Get.find<ProfileController>().userModel?.name ?? '',
                        replyText:
                            controller.repleCommentTextController.text)));

                controller.repleCommentTextController.text = '';
              });
            },
            icon: const Icon(
              Icons.send,
              size: 30,
              color: AppColors.blueDarker,
            ))
      ],
    );
  }
}
