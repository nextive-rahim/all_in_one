import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/repository/company_profile_update_repository.dart';
import 'package:all_in_one/src/features/profile/model/profile_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyProfileUpdateViewController extends GetxController {
  final CompanyProfileUpdate _repository = CompanyProfileUpdate();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  late RegistrationResponseModel signupModel;
  final RxString imagelink = ''.obs;
  final formKey = GlobalKey<FormState>();
  Future<RegistrationResponseModel> companyProfileUpdate() async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "name": nameController.text,
      "email": emailController.text,
      "phone": contactsNumberController.text,
      "descripton": employeeDescriptionController.text,
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

  void profileDataPopulate(UserModel user) {
    nameController.text = user.name ?? '';
    contactsNumberController.text = user.phone ?? '';
    employeeDescriptionController.text = user.description ?? '';
  }

  /// Text Editing Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactsNumberController = TextEditingController();
  TextEditingController employeeDescriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
}
