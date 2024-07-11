import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/profile/model/profile_response_model.dart';
import 'package:all_in_one/src/features/common_features/user_details/model/user_details_model.dart';
import 'package:all_in_one/src/features/common_features/user_details/repository/user_details_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserDetailsViewController extends GetxController {
  final UserDetailsRepository _repository = UserDetailsRepository();

  RxBool rememberMe = false.obs;

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  UserDetailsResponseModelData? userDetailsResponseModelData;

  UserModel? userModel;

  Future<void> userDetails({int? userType, int? userId}) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      "user_id": userId,
      "user_type": userType
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.userDetails(requestBody);

      late UserDetailsResponseModel profileResponseModel =
          UserDetailsResponseModel.fromJson(res);
      userDetailsResponseModelData = profileResponseModel.data;
      userModel = profileResponseModel.data!.data;
      print(' Name : ${userModel!.name}');
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
