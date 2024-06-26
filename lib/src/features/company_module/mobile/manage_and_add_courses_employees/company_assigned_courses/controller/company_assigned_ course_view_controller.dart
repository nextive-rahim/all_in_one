import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/repository/company_assigned_course_repository.dart';
import 'package:get/get.dart';

class CompanyAssignedCouseViewController extends GetxController {
  final CompanyAssignedCourseRepository _repository =
      CompanyAssignedCourseRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  late RegistrationResponseModel signupModel;
  final RxList<int> courseIDList = <int>[].obs;

  Future<RegistrationResponseModel> companyAssingedCourse(
      int employeeID) async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> body = {
      "employee_id": employeeID,
      "course_id": courseIDList,
    };

    try {
      final res = await _repository.commanpanyAssignedCourse(body);
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
