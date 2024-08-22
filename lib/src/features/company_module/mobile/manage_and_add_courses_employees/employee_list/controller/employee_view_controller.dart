import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/common_features/authentication/login/model/login_response_model.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/model/registration_response_model.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/repository/employee_repository.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EmployeeListViewController extends GetxController {
  final EmployeeListRepository _repository = EmployeeListRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  late RegistrationResponseModel signupModel;
  late EmployeeModelResponse employeeListResponse;
  EmployeeModel? employeeModel;
  RxList<EmployeeModel> employeeList = <EmployeeModel>[].obs;
  final RxList<CourseModel> assignedCouseList = <CourseModel>[].obs;
  @override
  void onInit() async {
    getEmployeeList();
    super.onInit();
  }

  Future<void> getEmployeeList() async {
    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      //"course_id": courseId,
    };

    //Log.debug(requestBody.toString());

    try {
      final res = await _repository.fetchhEmployeeList(requestBody);
      employeeListResponse = EmployeeModelResponse.fromJson(res);
      employeeList.value = employeeListResponse.data ?? [];
      _pageStateController(PageState.success);

      return;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }

  Future<LoginResponseModel> deleteEmployee(int employeeID) async {
    // _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      "employee_id": employeeID,
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.deleteEmployee(requestBody);
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(res);

      // _pageStateController(PageState.success);

      return loginResponseModel;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      // _pageStateController(PageState.error);
      return LoginResponseModel();
    }
  }

  Future<RegistrationResponseModel> deleteAssingCourse(
      int courseID, int employeeID) async {
    Map<String, dynamic> body = {
      "employee_id": employeeID,
      "course_id": courseID,
    };

    try {
      final res = await _repository.deleteAssingedCourse(body);

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
