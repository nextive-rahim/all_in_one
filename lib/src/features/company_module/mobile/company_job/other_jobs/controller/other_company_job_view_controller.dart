import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/repository/job_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OtherCompanyJobsViewController extends GetxController {
  final JobListRepository _repository = JobListRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;

  late JobResponseModel jobListResponse;
  RxList<JobModel> otherCompany = <JobModel>[].obs;
  late RegistrationResponseModel signupModel;
  final RxBool isSavedJob = false.obs;
  //late JobResponseModel jobListResponse;
  RxList<JobModel> companySavedJobList = <JobModel>[].obs;

  RxList<JobModel> companyAppiedJobList = <JobModel>[].obs;
  @override
  void onInit() async {
    getOtherCompanyjobList();
    super.onInit();
  }

  Future<void> getOtherCompanyjobList() async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      //"course_id": courseId,
    };

    //Log.debug(requestBody.toString());

    try {
      final res = await _repository.otherCompanyJobs(requestBody);
      JobResponseModel jobListResponse = JobResponseModel.fromJson(res);
      otherCompany.value = jobListResponse.data ?? [];

      companySavedJobList.value =
          jobListResponse.data!.where((v) => v.isSaved != 0).toList();
      companyAppiedJobList.value =
          jobListResponse.data!.where((v) => v.isApplied != 0).toList();
      _pageStateController(PageState.success);

      return;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }

  Future<RegistrationResponseModel> saveJob(int id) async {
    // _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "job_id": id,
    };

    try {
      final res = await _repository.saveJob(body);

      signupModel = RegistrationResponseModel.fromJson(res);

      return signupModel;
      // clearTextFields();
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
    }
    return signupModel;
  }

  Future<RegistrationResponseModel> deleteSaveJob(int id) async {
    Map<String, dynamic> body = {
      "job_id": id,
    };

    try {
      final res = await _repository.deleteSaveJob(body);

      signupModel = RegistrationResponseModel.fromJson(res);

      getOtherCompanyjobList();
      return signupModel;

      // clearTextFields();
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
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

  Future<RegistrationResponseModel> applyJob(int id) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "company_job_id": id,
    };

    try {
      final res = await _repository.applyJob(body);

      signupModel = RegistrationResponseModel.fromJson(res);
      _pageStateController(PageState.success);
      return signupModel;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
    }
    return signupModel;
  }
}