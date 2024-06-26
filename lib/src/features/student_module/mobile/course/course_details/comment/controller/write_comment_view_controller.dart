import 'package:all_in_one/models/common_model.dart';
import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/repository/comment_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class WriteCommentViewController extends GetxController {
  final CommentRepository _repository = CommentRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  RxBool writeComment = false.obs;
  final writeCommentTextController = TextEditingController();
  late CommonResponse commentResponse;

  Future<void> writeComments(
    int id,
    String text,
  ) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      "course_id": id,
      "comment_text": text,
    };

    try {
      final res = await _repository.writeComment(requestBody);
      commentResponse = CommonResponse.fromJson(res);

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
