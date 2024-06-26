import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/repository/job_list_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AppliedJobsViewController extends GetxController {
  final JobListRepository _repository = JobListRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  late RegistrationResponseModel signupModel;
  final RxBool isSavedJob = false.obs;
  late JobResponseModel jobListResponse;
  RxList<JobModel> appiedJobList = <JobModel>[].obs;

  @override
  void onInit() {
    appliedjobList();
    super.onInit();
  }

  Future<void> appliedjobList() async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      //"course_id": courseId,
    };

    //Log.debug(requestBody.toString());

    try {
      final res = await _repository.fetchAppliedJobs(requestBody);
      jobListResponse = JobResponseModel.fromJson(res);
      appiedJobList.value = jobListResponse.data ?? [];
      _pageStateController(PageState.success);

      return;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
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
