import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/profile/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UploadFileViewController extends GetxController {
  final ProfileRepository _repository = ProfileRepository();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  late RegistrationResponseModel profileResponseModel;

  Future<void> uploadFile(String fileLink) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      'avatar': fileLink,
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.uploadFile(requestBody);

      profileResponseModel = RegistrationResponseModel.fromJson(res);

      _pageStateController(PageState.success);

      return;
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
