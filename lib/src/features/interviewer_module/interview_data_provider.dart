// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:all_in_one/models/common_model.dart';
import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/network_utils.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/model/all_interviews_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/model/list_exam_link_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/model/student_view_comment_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/model/student_course_content_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_price/model/student_course_price_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';

class InterviewDataProvider with ChangeNotifier {
  final NetworkUtility _networkUtility = NetworkUtility();

  bool dashboardProgressVisibility = true;

  List<CourseModel>? collectinListData = [];
  List<CourseModel>? collectinListDataFixed = [];
  List<ViewCourseContentResponseData> viewCourseContentData = [];
  CoursePriceResponseData coursePriceResponseData = CoursePriceResponseData();
  List<ViewCommentResponseData> viewCommentResponseDataList = [];
  List<ExamLinkModel> examLinkResponseDatalist = [];
  String interviewTestRequestMsg = '', storeInterviewerFeedbackMsg = '';
  List<JobModel>? myJobList = [];
  List<JobModel>? savedJobList = [];
  List<JobModel>? appliedJobList = [];
  List<ViewInterviewResponseData> viewInterviewList = [];
  InterviewDataProvider() {
    //_callSharedPrefs();
    //  _clearAuth();
  }
  _clearAuth() async {
    //  //final prefs = await Util.sharedPrefs;
    // prefs.clear();
    notifyListeners();
  }

  // _callSharedPrefs() async {
  //   //final prefs = await Util.sharedPrefs;
  //   if (prefs.getString(Constant.name) != null &&
  //       prefs.getString(Constant.name)!.isNotEmpty) {
  //     nameOfUser = prefs.getString(Constant.name)!;
  //     appBarTitle = AppStrings.hiText +
  //         ', ' +
  //         prefs.getString(Constant.name)! +
  //         ', ' +
  //         AppStrings.welcomeBack;
  //   } else {
  //     appBarTitle = 'Hi,';
  //   }
  //   notifyListeners();
  // }

  Future<bool> getViewInterviewData(
      BuildContext context, Function onLogout) async {
    // //final prefs = await Util.sharedPrefs;
    //  final String? auth = prefs.getString(Constant.authToken);

    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceGetRequest(
        url: API.viewInterviewUrl,
        //  body: jsonEncode(body),
        header: header);
    var response = AllViewInterviewResponse.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");

    if (response.success != null) {
      if (response.success!) {
        viewInterviewList = response.data ?? [];

        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } else {
      // onLogout();
      return false;
    }
  }

  Future<bool> fetchInterviewTestRequest(BuildContext context, String date,
      String timeSlotA, String timeSloB, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;
    // final String? auth = prefs.getString(Constant.authToken);
    // final String? userId = prefs.getString(Constant.userId);
    Map<String, dynamic> body = {
      // "user_id": userId,
      "course_id": 1,
      "date": date,
      "time_slot_a": timeSlotA,
      "time_slot_b": timeSloB
    };
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.interviewTestRequestUrl,
        body: jsonEncode(body),
        header: header);
    var response = CommonResponse.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      if (response.success!) {
        interviewTestRequestMsg = response.message ?? '';
        notifyListeners();
        return true;
      } else {
        interviewTestRequestMsg = response.message ?? '';
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> fetechStoreInterviewFeedback(BuildContext context, int id,
      String feedbackMsg, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;
    // final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {"id": id, "feedback_content": feedbackMsg};
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.storeInterviewerFeedbackUrl,
        body: jsonEncode(body),
        header: header);
    var response = CommonResponse.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      if (response.success!) {
        storeInterviewerFeedbackMsg = response.message ?? '';
        notifyListeners();
        Util.displayToast(
            context, storeInterviewerFeedbackMsg, CommonColor.greenColor1);
        return true;
      } else {
        storeInterviewerFeedbackMsg = response.message ?? '';
        Util.displayToast(
            context, storeInterviewerFeedbackMsg, CommonColor.redColors);
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> fetechConfirmInterview(
      BuildContext context, int id, String link, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;
    //  final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {"id": id, "link": link};
    Map<String, String> header = {
      //  "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.confirmInterviewUrl, body: jsonEncode(body), header: header);
    var response = CommonResponse.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      // if (response.success!) {
      //   storeInterviewerFeedbackMsg = response.message ?? '';
      //   notifyListeners();
      //   Util.displayToast(
      //       context, storeInterviewerFeedbackMsg, CommonColor.greenColor1);
      //   return true;
      // } else {
      //   storeInterviewerFeedbackMsg = response.message ?? '';
      //   Util.displayToast(
      //       context, storeInterviewerFeedbackMsg, CommonColor.redColors);
      //   notifyListeners();
      //   return false;
      // }
      notifyListeners();
      Util.displayToast(
          context, "Feedback store Successfully.", CommonColor.greenColor1);
      return true;
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> getViewCommentsData(
      BuildContext context, int id, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;
    //  final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {
      "course_id": id,
    };
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.viewCommentUrl, body: jsonEncode(body), header: header);
    var response = ViewCommentResponse.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      viewCommentResponseDataList = [];
      if (response.success!) {
        response.data?.forEach((element) {
          viewCommentResponseDataList.add(element);
        });

        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> fetchWatchVideo(
      BuildContext context, int id, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;
    // final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {
      "content_id": id,
    };
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    log("message 11111");
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.watchVideoUrl, body: jsonEncode(body), header: header);
    log("message 222");
    var response = CommonResponse.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      if (response.success!) {
        Util.displayToast(
            context, response.message ?? '', CommonColor.greenColor1);

        notifyListeners();
        return true;
      } else {
        Util.displayToast(
            context, response.message ?? '', CommonColor.redColors);
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> fetchCourseRegister(
      BuildContext context, int id, String rateId, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;

    // final String? auth = prefs.getString(Constant.authToken);
    // final String? userId = prefs.getString(Constant.userId);
    Map<String, dynamic> body = {
      "course_id": id,
      // "user_id": userId,
      "course_rate_id": rateId
    };
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.courseRegisterUrl, body: jsonEncode(body), header: header);
    var response = CommonResponse.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      if (response.success!) {
        // Util.displayToast(
        //     context, response.message ?? '', CommonColor.greenColor1);
        //  registrationMsg = response.message ?? '';
        notifyListeners();
        return true;
      } else {
        Util.displayToast(
            context, response.message ?? '', CommonColor.redColors);
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> fetchCheckUserCourseAvailability(
      BuildContext context, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;
    // final String? auth = prefs.getString(Constant.authToken);
    // final String? userId = prefs.getString(Constant.userId);
    Map<String, dynamic> body = {
      // "user_id": userId,
    };
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.checkUserCourseAvailabilityUrl,
        body: jsonEncode(body),
        header: header);
    var response = CommonResponse.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      if (response.success!) {
        Util.displayToast(
            context, response.message ?? '', CommonColor.greenColor1);

        notifyListeners();
        return true;
      } else {
        Util.displayToast(
            context, response.message ?? '', CommonColor.redColors);
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> addComment(
      BuildContext context, int id, String text, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;
    //  final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {"course_id": id, "comment_text": text};
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.addCommentUrl, body: jsonEncode(body), header: header);
    var response = CommonResponse.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      if (response.success!) {
        Util.displayToast(
            context, response.message ?? '', CommonColor.greenColor1);

        notifyListeners();
        return true;
      } else {
        Util.displayToast(
            context, response.message ?? '', CommonColor.redColors);
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> fetchListExamLink(
      BuildContext context, int id, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;
    // final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {"course_id": id};
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.listExamLinkUrl, body: jsonEncode(body), header: header);
    var response = ListExamLinkResponse.fromJson(jsonDecode(value));
    if (response.success != null) {
      if (response.success!) {
        examLinkResponseDatalist = [];
        response.data?.forEach((element) {
          examLinkResponseDatalist.add(element);
        });

        notifyListeners();
        return true;
      } else {
        Util.displayToast(
            context, response.message ?? '', CommonColor.redColors);
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> addUserExamResultStore(BuildContext context, int id, String mark,
      String projectLinks, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;
    // final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {
      "course_id": id,
      "marks": mark,
      "project_links": projectLinks
    };
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.userExamResultStoreUrl,
        body: jsonEncode(body),
        header: header);
    var response = CommonResponse.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      if (response.success!) {
        Util.displayToast(
            context, response.message ?? '', CommonColor.greenColor1);

        notifyListeners();
        return true;
      } else {
        Util.displayToast(
            context, response.message ?? '', CommonColor.redColors);
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> checkUserExamEligibility(
      BuildContext context, int id, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;
    //final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {
      "course_id": id,
    };
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.checkUserExamEligibilityUrl,
        body: jsonEncode(body),
        header: header);
    var response = CommonResponse.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      if (response.success!) {
        Util.displayToast(
            context, response.message ?? '', CommonColor.greenColor1);

        notifyListeners();
        return true;
      } else {
        Util.displayToast(
            context, response.message ?? '', CommonColor.redColors);
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> applyJob(BuildContext context, int id, Function onLogout) async {
    //  //final prefs = await Util.sharedPrefs;
    //  final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {
      "company_job_id": id,
    };
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.applyJobUrl, body: jsonEncode(body), header: header);
    var response = CommonResponse.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      if (response.success!) {
        Util.displayToast(
            context, response.message ?? '', CommonColor.greenColor1);

        notifyListeners();
        return true;
      } else {
        Util.displayToast(
            context, response.message ?? '', CommonColor.redColors);
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> saveJob(BuildContext context, int id, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;
    // final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {
      "job_id": id,
    };
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.saveJobUrl, body: jsonEncode(body), header: header);
    var response = CommonResponse.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      if (response.success!) {
        Util.displayToast(
            context, response.message ?? '', CommonColor.greenColor1);

        notifyListeners();
        return true;
      } else {
        Util.displayToast(
            context, response.message ?? '', CommonColor.redColors);
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> viewJob(BuildContext context, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;
    // final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {
      //  "job_id": id,
    };
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.viewJobUrl, body: jsonEncode(body), header: header);
    var response = JobResponseModel.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      if (response.success!) {
        myJobList = response.data ?? [];
        // Util.displayToast(
        //     context, response.message ?? '', CommonColor.greenColor1);

        notifyListeners();
        return true;
      } else {
        Util.displayToast(
            context, response.message ?? '', CommonColor.redColors);
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  Future<bool> appliedJob(BuildContext context, Function onLogout) async {
    //final prefs = await Util.sharedPrefs;
    //  final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {
      // "job_id": id,
    };
    Map<String, String> header = {
      // "Authorization": 'Bearer ${auth ?? ''}',
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        url: API.appliedJobUrl, body: jsonEncode(body), header: header);
    var response = JobResponseModel.fromJson(jsonDecode(value));
    log("Response   ::: ${jsonEncode(response)}");
    if (response.success != null) {
      if (response.success!) {
        appliedJobList = response.data ?? [];
        // Util.displayToast(
        //     context, response.message ?? '', CommonColor.greenColor1);

        notifyListeners();
        return true;
      } else {
        Util.displayToast(
            context, response.message ?? '', CommonColor.redColors);
        notifyListeners();
        return false;
      }
    } else {
      onLogout();
      // Util.logout(context);
      return false;
    }
  }

  void searchHomeCourse(String searchText) {
    Util.log(searchText);
    String searchLowerCase = searchText.toLowerCase();
    collectinListData = collectinListDataFixed!
        .where((element) =>
            ((element.title!).toLowerCase().contains(searchLowerCase)
            // ||
            //     (element.subTitle!.toString())
            //         .toLowerCase()
            //         .contains(searchLowerCase)
            ))
        .toList();

    /*
    if (mounted) {
      setState(() {});
    }
    */
    notifyListeners();
  }

  void _close(BuildContext context) {
    Navigator.pop(context, true);
  }
}
