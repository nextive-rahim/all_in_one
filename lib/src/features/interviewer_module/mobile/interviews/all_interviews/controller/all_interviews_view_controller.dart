import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/model/all_interviews_model.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/repository/all_interviews_repository.dart';
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
  List<ViewInterviewResponseData> allnterviews = [];
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
      allnterviews = _responseModel.data!;
      _pageStateController(PageState.success);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      Get.snackbar(
        'Failed',
        'Fetching all interviews failed',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
