import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/model/interviewer_payment_model.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/repository/interviewer_payment_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class InterviewerPaymentViewController extends GetxController {
  final InterviewsPaymentRepository repository = InterviewsPaymentRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  late InterviewerPaymentResponseModel _responseModel;
  RxList<InterviewerPaymentModel> allPayments = <InterviewerPaymentModel>[].obs;
  RxList<InterviewerPaymentModel> pendingPayments =
      <InterviewerPaymentModel>[].obs;
  RxList<InterviewerPaymentModel> completedPayments =
      <InterviewerPaymentModel>[].obs;
  RxBool isInterviewRequestTab = true.obs;
  RxBool isConfirmInterviewTab = false.obs;
  RxBool isCompletedInterviewTab = false.obs;
  @override
  void onInit() {
    super.onInit();
    getInterviewerPayment();
  }

  Future<void> getInterviewerPayment() async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {};
    try {
      final res = await repository.fetchInterviewerPayment(body);
      _responseModel = InterviewerPaymentResponseModel.fromJson(res);
      // List<InterviewerPaymentModel> initialInterviewList =
      //     _responseModel.data ?? [];
      allPayments.value = _responseModel.data ?? [];

      pendingPayments.value = allPayments.where((v) => v.status == 1).toList();
      completedPayments.value =
          allPayments.where((v) => v.status == 2).toList();
      // allnterviews.value = _responseModel.data!;
      _pageStateController(PageState.success);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
    }
  }
}
