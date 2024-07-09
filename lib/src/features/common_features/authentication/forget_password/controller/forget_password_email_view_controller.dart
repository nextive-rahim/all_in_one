import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/authentication/login/model/login_response_model.dart';
import 'package:all_in_one/src/features/common_features/authentication/root/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ForgetPasswordEmailViewController extends GetxController {
  final AuthenticationRepository _repository = AuthenticationRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  late LoginResponseModel loginModel;

  Future<void> forgetPasswordEmail(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      'username': userNameController.text.replaceAll('-', ''),
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.forgetPasswordEmail(requestBody);

      loginModel = LoginResponseModel.fromJson(res);

      _pageStateController(PageState.success);

      return;
      //clearTextFields();
      //  Get.offAllNamed(Routes.dashboard);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }

  /// Text Editing Controllers
  TextEditingController userNameController = TextEditingController();

  void clearTextFields() {
    userNameController.clear();
  }
}
