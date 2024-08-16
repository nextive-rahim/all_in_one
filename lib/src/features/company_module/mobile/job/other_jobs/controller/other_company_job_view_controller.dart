import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
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
      jobListResponse = JobResponseModel.fromJson(res);
      otherCompany.value = jobListResponse.data ?? [];
      _pageStateController(PageState.success);

      return;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }
}
