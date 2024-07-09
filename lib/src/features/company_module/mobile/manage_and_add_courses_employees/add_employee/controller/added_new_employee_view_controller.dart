import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/repository/added_new_employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddedNewEmployeeViewController extends GetxController {
  final AddedNewEmployeeRepository _repository = AddedNewEmployeeRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  late RegistrationResponseModel signupModel;
  final RxString imagelink = ''.obs;
  final formKey = GlobalKey<FormState>();
  Future<RegistrationResponseModel> addedNewEmployee() async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "emp_id": employeeController.text,
      "name": nameController.text,
      "on_site_email": emailController.text,
      "phone": contactsNumberController.text,
      "resume": uploadResumeController.text,
      "descripton": employeeDescriptionController.text,
      "user_type": 2,
      "degination": deginationController.text,
      "key_skill": skillsController.text,
      "time": '',
    };

    try {
      final res = await _repository.addedNewEmployee(body);
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

  /// Text Editing Controllers
  TextEditingController employeeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactsNumberController = TextEditingController();
  TextEditingController uploadResumeController = TextEditingController();
  TextEditingController employeeDescriptionController = TextEditingController();
  TextEditingController deginationController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  void clearTextFields() {
    employeeController.clear();
    nameController.clear();
    contactsNumberController.clear();
    uploadResumeController.clear();
    employeeDescriptionController.clear();
    timeController.clear();
    emailController.clear();
    deginationController.clear();
    skillsController.clear();
  }
}
