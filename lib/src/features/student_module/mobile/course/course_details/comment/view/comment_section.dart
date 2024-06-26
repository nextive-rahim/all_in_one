import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/view_comment_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/widget/view_comment_builder.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/widget/write_comment_card.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentSection extends GetView<ViewCommentViewController> {
  const CommentSection({
    super.key,
    required this.collectinListData,
  });
  final CourseModel collectinListData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WriteComment(collectinListData: collectinListData),
        const ViewCommentBuilder(),
        const SizedBox(height: 25),
      ],
    );
  }
}
