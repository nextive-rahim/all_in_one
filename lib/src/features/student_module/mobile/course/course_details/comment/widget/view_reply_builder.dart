import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/view_reply_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/widget/reply_card.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ViewReplyBuilder extends GetView<ViewReplyViewController> {
  const ViewReplyBuilder({super.key});

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
          return ReplyCard(
            comment: controller.viewCommentResponseDataList[index],
          );
        },
      );
    });
  }
}
