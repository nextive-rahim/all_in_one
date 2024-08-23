import 'dart:io';

import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/repository/company_profile_update_repository.dart';
import 'package:all_in_one/src/features/common_features/profile/model/profile_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CompanyProfileUpdateViewController extends GetxController {
  final CompanyProfileUpdate _repository = CompanyProfileUpdate();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  late RegistrationResponseModel signupModel;
  final RxString imagelink = ''.obs;
  final RxString fileImagelink = ''.obs;
  final RxString resumeLink = ''.obs;
  late RegistrationResponseModel profileResponseModel;
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() async {
    profileDataPopulates(Get.find<ProfileViewController>().userModel!);
    super.onInit();
  }

  Future<RegistrationResponseModel> companyProfileUpdate() async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "name": nameController.text,
      "phone": contactsNumberController.text,
      "description": employeeDescriptionController.text,
      if (imagelink.value != '') "image": imagelink.value,
      "address": addressController.text,
      "time": '',
    };

    try {
      final res = await _repository.companyProfileUpdate(body);
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

  void profileDataPopulates(UserModel user) {
    nameController.text = user.name ?? '';
    contactsNumberController.text = user.phone ?? '';
    addressController.text = user.address ?? '';
    employeeDescriptionController.text = user.description ?? '';
  }

  /// Text Editing Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactsNumberController = TextEditingController();
  TextEditingController employeeDescriptionController = TextEditingController();
}
