import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/repository/job_list_repository.dart';
import 'package:get/get.dart';

class JobsViewController extends GetxController {
  final JobListRepository _repository = JobListRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  late RegistrationResponseModel signupModel;
  final RxBool isSavedJob = false.obs;
  //late JobResponseModel jobListResponse;
  RxList<JobModel> savedJobList = <JobModel>[].obs;

  RxList<JobModel> myJobList = <JobModel>[].obs;
  RxList<JobModel> appiedJobList = <JobModel>[].obs;
  @override
  void onInit() async {
    await getjobList();
    // savedjobList();
    super.onInit();
  }

  Future<void> getjobList() async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      //"course_id": courseId,
    };

    //Log.debug(requestBody.toString());

    try {
      final res = await _repository.fetchJobList(requestBody);
      JobResponseModel jobListResponse = JobResponseModel.fromJson(res);
      myJobList.value = jobListResponse.data ?? [];
      savedJobList.value =
          jobListResponse.data!.where((v) => v.isSaved != 0).toList();
      appiedJobList.value =
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

  // Future<void> savedjobList() async {
  //   //_pageStateController(PageState.loading);

  //   try {
  //     final res = await _repository.fetchSavedJobs();
  //     JobResponseModel jobListResponse = JobResponseModel.fromJson(res);
  //     savedJobList.value = jobListResponse.data ?? [];
  //     // _pageStateController(PageState.success);

  //     return;
  //   } catch (e, stackTrace) {
  //     Log.error(e.toString());
  //     Log.error(stackTrace.toString());
  //     _pageStateController(PageState.error);
  //     return;
  //   }
  // }

  Future<RegistrationResponseModel> saveJob(int id) async {
    // _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "job_id": id,
    };

    try {
      final res = await _repository.saveJob(body);

      signupModel = RegistrationResponseModel.fromJson(res);
      // _pageStateController(PageState.success);
      // savedJobList.add();
      // savedjobList();
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

      getjobList();
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
