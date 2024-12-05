import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/authentication/login/model/login_response_model.dart';
import 'package:all_in_one/src/features/common_features/authentication/root/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginViewController extends GetxController {
  final AuthenticationRepository _repository = AuthenticationRepository();

  RxBool rememberMe = false.obs;

  toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  late LoginResponseModel loginModel;
  final formKey = GlobalKey<FormState>();
  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      'username': userNameController.text,
      'password': passwordController.text,
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.login(requestBody);

      loginModel = LoginResponseModel.fromJson(res);

      if (rememberMe.value == true) {
        //TODO: Implement remember me
      }
      _pageStateController(PageState.success);

      CacheService.boxAuth
          .write(CacheKeys.userType, loginModel.data?.userType ?? 0);
      CacheService.boxAuth.write(CacheKeys.userId, loginModel.data?.id ?? 0);
      CacheService.boxAuth.write(CacheKeys.token, loginModel.token);
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

  Future<void> resentOtpForVerifyMail() async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      'username': userNameController.text,
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.resentOtpForVerifyMail(requestBody);

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
  TextEditingController passwordController = TextEditingController();

  void clearTextFields() {
    userNameController.clear();
    passwordController.clear();
  }
}
