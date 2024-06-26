import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/model/student_view_comment_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/repository/comment_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ViewReplyViewController extends GetxController {
  final CommentRepository _repository = CommentRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  late ViewCommentResponse commentResponse;
  RxList<ViewCommentResponseData> viewCommentResponseDataList =
      <ViewCommentResponseData>[].obs;
  void viewReply(ViewCommentResponseData comment) {
    viewCommentResponseDataList.add(comment);
    update();
  }

  Future<void> getReplys(int commentId) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      "course_comment_id": commentId,
    };
    Log.debug(requestBody.toString());

    try {
      final res = await _repository.fetchReply(requestBody);
      commentResponse = ViewCommentResponse.fromJson(res);

      viewCommentResponseDataList.value = commentResponse.data ?? [];
      _pageStateController(PageState.success);

      return;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }
}
