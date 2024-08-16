import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/model/all_interviews_model.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/repository/all_interviews_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AllInterviewsViewController extends GetxController {
  final InterviewsRepository repository = InterviewsRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  late AllViewInterviewResponse _responseModel;
  RxList<ViewInterviewResponseData> allnterviews =
      <ViewInterviewResponseData>[].obs;
  RxList<ViewInterviewResponseData> comfirmedInterviewList =
      <ViewInterviewResponseData>[].obs;
  RxList<ViewInterviewResponseData> completedInterviewList =
      <ViewInterviewResponseData>[].obs;
  RxBool isInterviewRequestTab = true.obs;
  RxBool isConfirmInterviewTab = false.obs;
  RxBool isCompletedInterviewTab = false.obs;
  @override
  void onInit() {
    super.onInit();
    getAllInterviews();
  }

  Future<void> getAllInterviews() async {
    _pageStateController(PageState.loading);

    try {
      final res = await repository.fetchAllInterviews();
      _responseModel = AllViewInterviewResponse.fromJson(res);
      List<ViewInterviewResponseData> initialInterviewList =
          _responseModel.data ?? [];
      allnterviews.value =
          initialInterviewList.where((v) => v.status == 1).toList();

      comfirmedInterviewList.value =
          initialInterviewList.where((v) => v.status == 2).toList();
      completedInterviewList.value =
          initialInterviewList.where((v) => v.status == 3).toList();
      // allnterviews.value = _responseModel.data!;
      _pageStateController(PageState.success);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      Get.snackbar(
        'Failed',
        'Fetching all interviews failed',
        snackPosition: SnackPosition.TOP,
        backgroundColor: CommonColor.redColors,
        colorText: Colors.white,
      );
    }
  }

  Future<void> completeInterviewRequest(int id) async {
    _pageStateController(PageState.loading);
    Map<String, dynamic> body = {"id": id};

    try {
      await repository.completeInterview(body);

      _pageStateController(PageState.success);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      Get.snackbar(
        'Failed',
        'Interview Not Confirmed',
        snackPosition: SnackPosition.TOP,
        backgroundColor: CommonColor.redColors,
        colorText: Colors.white,
      );
    }
  }
}
