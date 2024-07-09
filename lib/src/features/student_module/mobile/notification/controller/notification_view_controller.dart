import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/notification/model/notification_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/notification/repository/notification_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NotificationViewController extends GetxController {
  final NotificationRepository _repository = NotificationRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  late NotificationResponseModel notificationResponseModel;
  late RegistrationResponseModel sendNotificationModel;

  RxList<NotificationModel> notificationList = <NotificationModel>[].obs;

  @override
  void onInit() {
    fetchNotification();
    super.onInit();
  }

  Future<void> fetchNotification() async {
    _pageStateController(PageState.loading);

    try {
      final res = await _repository.fetchNotification();
      notificationResponseModel = NotificationResponseModel.fromJson(res);
      notificationList.value = notificationResponseModel.data ?? [];
      _pageStateController(PageState.success);

      return;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }

  Future<RegistrationResponseModel> sendNotification(int id) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "company_job_id": id,
    };

    try {
      final res = await _repository.sendNotification(body);

      sendNotificationModel = RegistrationResponseModel.fromJson(res);
      _pageStateController(PageState.success);
      return sendNotificationModel;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
    }
    return sendNotificationModel;
  }
}
