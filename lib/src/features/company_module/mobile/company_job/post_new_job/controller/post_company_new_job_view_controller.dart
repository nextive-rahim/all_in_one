import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/post_new_job/repository/post_new_job_repository.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCompanyNewJobViewController extends GetxController {
  final PostNewJobRepository _repository = PostNewJobRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  late RegistrationResponseModel signupModel;
  JobModel? job;
  RxBool isFromPostEdit = false.obs;
  final formKey = GlobalKey<FormState>();
  Future<RegistrationResponseModel> postNewJob() async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "job_role": jobRoleController.text,
      "work_exp_min": workExpMinController.text,
      "work_exp_max": workExpMaxController.text,
      "paysalary": paySalaryController.text,
      "work_location": workLocationController.text,
      "job_description": jobDescriptionController.text,
      "time": '',
    };

    try {
      final res = await _repository.postNewJob(body);
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

  Future<RegistrationResponseModel> editCompanyJob(int id) async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "id": id,
      "job_role": jobRoleController.text,
      "work_exp_min": workExpMinController.text,
      "work_exp_max": workExpMaxController.text,
      "paysalary": paySalaryController.text,
      "work_location": workLocationController.text,
      "job_description": jobDescriptionController.text,
      // "time": '',
    };

    try {
      final res = await _repository.editCompanyJob(body);
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
  TextEditingController jobRoleController = TextEditingController();
  TextEditingController workExpMinController = TextEditingController();
  TextEditingController workExpMaxController = TextEditingController();
  TextEditingController paySalaryController = TextEditingController();
  TextEditingController workLocationController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  Future<void> clearTextFields() async {
    jobRoleController.clear();
    workExpMinController.clear();
    paySalaryController.clear();
    workLocationController.clear();
    jobDescriptionController.clear();
    timeController.clear();
    workExpMaxController.clear();
  }

  Future<void> popolateTextFormField(JobModel job) async {
    jobRoleController.text = job.jobRole ?? '';
    workExpMinController.text = job.workExpMin ?? '';
    paySalaryController.text = job.paysalary ?? '';
    workLocationController.text = job.workLocation ?? '';
    jobDescriptionController.text = job.jobDescription ?? '';
    timeController.text = '';
    workExpMaxController.text = job.workExpMax ?? '';
  }
}
