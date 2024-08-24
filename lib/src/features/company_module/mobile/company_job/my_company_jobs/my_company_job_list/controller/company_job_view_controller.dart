import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/repository/job_repository.dart';
import 'package:get/get.dart';

class CompanyJobViewController extends GetxController {
  final JobListRepository _repository = JobListRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  late RegistrationResponseModel signupModel;

  
  //late JobResponseModel jobListResponse;
  int? companyJonID;
  UserDetail? user;
  RxList<UserDetail>? appliedCandidateList = <UserDetail>[].obs;
  RxList<UserDetail>? seletedCandidate = <UserDetail>[].obs;
  RxList<UserDetail>? unSeletedCandidate = <UserDetail>[].obs;
  Future<void> fileterList() async {
    unSeletedCandidate!.remove(user);
    seletedCandidate!.add(user!);
  }

  RxList<JobModel> companyJobList = <JobModel>[].obs;
  @override
  void onInit() async {
    await getCompanyjobList();
    // savedjobList();
    super.onInit();
  }

  Future<void> getCompanyjobList() async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      //"course_id": courseId,
    };

    //Log.debug(requestBody.toString());

    try {
      final res = await _repository.fetchJobList(requestBody);
      JobResponseModel jobListResponse = JobResponseModel.fromJson(res);
      companyJobList.value = jobListResponse.data ?? [];

      _pageStateController(PageState.success);

      return;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }

  Future<RegistrationResponseModel>
      companySelecteCandidateForInterview() async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "company_job_id": companyJonID,
      "user_id": user?.id,
    };

    try {
      final res = await _repository.companySelectCandidateforInterview(body);
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

  Future<RegistrationResponseModel> deleteCompanyJob(int id) async {
    Map<String, dynamic> body = {
      "job_id": id,
    };

    try {
      final res = await _repository.deleteCompanyJob(body);

      signupModel = RegistrationResponseModel.fromJson(res);

      // getjobList();
      return signupModel;

      // clearTextFields();
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
    }
    return signupModel;
  }
}
