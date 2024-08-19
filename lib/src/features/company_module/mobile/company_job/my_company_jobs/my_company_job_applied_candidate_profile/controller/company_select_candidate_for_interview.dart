// import 'package:all_in_one/src/core/page_state/state.dart';
// import 'package:all_in_one/src/core/widgets/logger.dart';
// import 'package:all_in_one/src/features/common_features/authentication/registration/model/registration_response_model.dart';
// import 'package:all_in_one/src/features/company_module/mobile/company_job/post_new_job/repository/post_new_job_repository.dart';
// import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
// import 'package:get/get.dart';

// class CompanySelecteCandidateForInterviewViewController extends GetxController {
//   final PostNewJobRepository _repository = PostNewJobRepository();

//   /// Page State
//   final Rx<PageState> _pageStateController = Rx(PageState.initial);

//   get pageState => _pageStateController.value;
//   late RegistrationResponseModel signupModel;
//   JobModel? job;
//   RxBool isFromPostEdit = false.obs;

//   Future<RegistrationResponseModel> companySelecteCandidateForInterview(
//       {int? companyJobID, int? userID}) async {
//     // if (!formKey.currentState!.validate()) {
//     //   return;
//     // }

//     _pageStateController(PageState.loading);

//     Map<String, dynamic> body = {
//       "company_job_id": companyJobID,
//       "user_id": userID,
//     };

//     try {
//       final res = await _repository.companySelectCandidateforInterview(body);
//       print(res['success']);
//       signupModel = RegistrationResponseModel.fromJson(res);
//       _pageStateController(PageState.success);
//       return signupModel;
//       // clearTextFields();
//     } catch (e, stackTrace) {
//       Log.error(e.toString());
//       Log.error(stackTrace.toString());
//       _pageStateController(PageState.error);
//     }
//     return signupModel;
//   }
// }
