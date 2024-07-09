import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/common_features/authentication/root/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationViewController extends GetxController {
  final AuthenticationRepository _repository = AuthenticationRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  RegistrationResponseModel? signupModel;
  RxList<int> selectedSkillIdList = <int>[].obs;
  RxList<String> selectedSkillNameList = <String>[].obs;
  Future<void> registration(GlobalKey<FormState> formKey, userType) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "username": userNameController.text,
      "name": nameController.text,
      "password": passwordController.text,
      "confirm_password": confirmPasswordController.text,
      "user_type": userType,
      "address": "",
      "phone": phoneNumberController.text,
      "image": "",
      "resume": "",
      "skill": selectedSkillIdList,
    };

    try {
      final res = await _repository.registration(body);
      print(res['success']);
      signupModel = RegistrationResponseModel.fromJson(res);
      _pageStateController(PageState.success);
      // clearTextFields();
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }

  /// Text Editing Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void clearTextFields() {
    userNameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    nameController.clear();
  }
}
