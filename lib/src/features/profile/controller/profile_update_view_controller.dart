import 'dart:io';

import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/profile/model/profile_response_model.dart';
import 'package:all_in_one/src/features/profile/repository/profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UpdateProfileiewController extends GetxController {
  final ProfileRepository _repository = ProfileRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  late RegistrationResponseModel signupModel;
  final RxString imagelink = ''.obs;
  final formKey = GlobalKey<FormState>();
  RxList<int> selectedSkillIdList = <int>[].obs;
  RxList<String> selectedSkillNameList = <String>[].obs;
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
      if (imagelink.value != '') "image": imagelink.value,
      "address": addressController.text,
      if (selectedSkillIdList.isNotEmpty) "skill": selectedSkillIdList,
      "time": '',
    };

    try {
      final res = await _repository.updateProfile(body);

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

  Future<String> uploadFile(File file) async {
    _pageStateController(PageState.loading);
    String fileName = file.path.split('/').last;

    Map<String, dynamic> requestBody = {
      "avatar": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.uploadFile(requestBody);

      profileResponseModel = RegistrationResponseModel.fromJson(res);

      _pageStateController(PageState.success);

      return profileResponseModel.data ?? '';
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return profileResponseModel.data ?? '';
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
  TextEditingController skillsController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  void profileDataPopulate(UserModel user) {
    nameController.text = user.name ?? '';
    contactsNumberController.text = user.phone ?? '';
    employeeDescriptionController.text = user.description ?? '';
    addressController.text = user.address ?? '';
  }

  // void clearTextFields() {
  //   // employeeController.clear();
  //   nameController.clear();
  //   contactsNumberController.clear();
  //   uploadResumeController.clear();
  //   employeeDescriptionController.clear();
  //   timeController.clear();
  //   imageController.clear();
  //   addressController.clear();
  //   // skillsController.clear();
  // }
}
