import 'dart:developer';

import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/formated_date_time.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/cached_network_image.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/view_reply_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/model/student_view_comment_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/widget/reply_form_field.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/widget/view_reply_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ViewCommentCard extends StatefulWidget {
  const ViewCommentCard({
    super.key,
    required this.comment,
  });
  final ViewCommentResponseData comment;
  @override
  State<ViewCommentCard> createState() => _ViewCommentCardState();
}

bool isShowReplyForm = false;
final profileController = Get.find<ProfileController>();

class _ViewCommentCardState extends State<ViewCommentCard> {
  Key? focusedCommentBoxKey = (null as Key?);
  void selectCommentToReply(Key? commentKey) {
    if (focusedCommentBoxKey == commentKey) {
      focusedCommentBoxKey = null;
      setState(() {});
    } else {
      focusedCommentBoxKey = commentKey;
      replyController.getReplys(widget.comment.id!);
      setState(() {});
    }
    log('selectCommentToReply: $focusedCommentBoxKey');
  }

  final replyController = Get.find<ViewReplyViewController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: AppCachedNetworkImage(
                imageUrl: profileController.userModel?.image,
                cachedHeight: 131,
                cachedWidth: 131,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: widget.comment.username ?? '',
                  color: CommonColor.headingTextColor1,
                  maxLine: 1,
                  fontFamily: AppStrings.sfProDisplay,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                TextWidget(
                  text:
                      '${FormatedDateTime.formatedDateTime1(widget.comment.updatedAt.toString(), inputFormat: 'yyyy-MM-dd', outputFormat: 'yMd')}, at ${FormatedDateTime.formatedTime(widget.comment.updatedAt.toString())}', //'Yesterday at 6:24 PM',
                  color: CommonColor.greyColor10,
                  maxLine: 1,
                  fontFamily: AppStrings.sfProDisplay,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                const SizedBox(height: 10),
                TextWidget(
                  text: widget.comment.commentText ?? '',
                  // "Hello there! It's great to hear that you're interested in a React dev course. React is a popular and widely used JavaScript library for building user interfaces. With React, you can create interactive and dynamic web applications that are responsive and easy to maintain.",
                  color: CommonColor.headingTextColor1,
                  maxLine: 5,
                  fontFamily: AppStrings.sfProDisplay,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    selectCommentToReply(widget.key);
                    // replyController.clear();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Text(
                    'Reply',
                    style: AppTextStyle.bold12.copyWith(
                      height: 16 / 12,
                      color: focusedCommentBoxKey == widget.key
                          ? AppColors.primary
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                (focusedCommentBoxKey == widget.key)
                    ? CommentReplyCard(comment: widget.comment)
                    : const SizedBox(),
                (focusedCommentBoxKey == widget.key)
                    ? const ViewReplyBuilder()
                    : const SizedBox(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
