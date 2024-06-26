import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/view_comment_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/widget/view_comment_card.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ViewCommentBuilder extends GetView<ViewCommentViewController> {
  const ViewCommentBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.viewCommentResponseDataList.length,
        separatorBuilder: (context, ind) {
          return const SizedBox(height: 15);
        },
        itemBuilder: (context, index) {
          return ViewCommentCard(
            key: ValueKey(index),
            comment: controller.viewCommentResponseDataList[index],
          );
        },
      );
    });
  }
}
