import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/authentication/login/model/login_response_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/notification/repository/notification_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SendNotificationViewController extends GetxController {
  final NotificationRepository _repository = NotificationRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  late LoginResponseModel loginModel;

  Future<void> sendNotification({int? userId, String? text}) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      "users_id": userId,
      "text": text,
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.sendNotification(requestBody);

      loginModel = LoginResponseModel.fromJson(res);

      _pageStateController(PageState.success);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }
}
