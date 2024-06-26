import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/profile/model/profile_response_model.dart';
import 'package:all_in_one/src/features/profile/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileiewController extends GetxController {
  final ProfileRepository _repository = ProfileRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  late RegistrationResponseModel signupModel;
  final RxString imagelink = ''.obs;
  final formKey = GlobalKey<FormState>();
  Future<RegistrationResponseModel> updateProfile() async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "name": nameController.text,
      "phone": contactsNumberController.text,
      if (uploadResumeController.text.isNotEmpty)
        "resume": uploadResumeController,
      "description": employeeDescriptionController.text,
      if (uploadResumeController.text.isNotEmpty) "image": imageController.text,
      "address": addressController.text,
      // "skill": skillsController.text,
      "time": '',
    };

    try {
      final res = await _repository.updateProfile(body);
      print(res['success']);
      signupModel = RegistrationResponseModel.fromJson(res);
      _pageStateController(PageState.success);
      return signupModel;
      // clearTextFields();
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
    }
    return signupModel;
  }

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
  // TextEditingController employeeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController contactsNumberController = TextEditingController();
  TextEditingController uploadResumeController = TextEditingController();
  TextEditingController employeeDescriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  // TextEditingController skillsController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  void profileDataPopulate(UserModel user) {
    nameController.text = user.name ?? '';
    contactsNumberController.text = user.phone ?? '';
    employeeDescriptionController.text = user.description ?? '';
    addressController.text = user.address ?? '';
  }

  void clearTextFields() {
    // employeeController.clear();
    nameController.clear();
    contactsNumberController.clear();
    uploadResumeController.clear();
    employeeDescriptionController.clear();
    timeController.clear();
    imageController.clear();
    addressController.clear();
    // skillsController.clear();
  }
}
