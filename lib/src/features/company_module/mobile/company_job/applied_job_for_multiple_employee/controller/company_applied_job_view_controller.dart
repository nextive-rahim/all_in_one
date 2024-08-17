import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/applied_job_for_multiple_employee/repository/company_applied_job_repository.dart';
import 'package:get/get.dart';

class CompanyAppliedJobViewController extends GetxController {
  final CompanyAppliedJobRepository _repository = CompanyAppliedJobRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  late RegistrationResponseModel signupModel;
  final RxList<int> courseIDList = <int>[].obs;

  Future<RegistrationResponseModel> companyAppliedjob(int employeeID) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "company_job_id": employeeID,
      "applied_by": courseIDList,
    };

    try {
      final res = await _repository.companyAppliedjob(body);
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
}
