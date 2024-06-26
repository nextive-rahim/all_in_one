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

class CompanyDataProvider with ChangeNotifier {
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
    // final prefs = await Util.sharedPrefs;
    //  prefs.clear();
    notifyListeners();
  }

  // _callSharedPrefs() async {
  //   final prefs = await Util.sharedPrefs;
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

  Future<bool> applyJob(BuildContext context, int id, Function onLogout) async {
    // final prefs = await Util.sharedPrefs;
    // final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {
      "company_job_id": id,
    };
    Map<String, String> header = {
      //  "Authorization": 'Bearer ${auth ?? ''}',
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
    //final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {
      "job_id": id,
    };
    Map<String, String> header = {
      //  "Authorization": 'Bearer ${auth ?? ''}',
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
    //  final prefs = await Util.sharedPrefs;
    // final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {
      //  "job_id": id,
    };
    Map<String, String> header = {
      //"Authorization": 'Bearer ${auth ?? ''}',
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
    //  final prefs = await Util.sharedPrefs;
    // final String? auth = prefs.getString(Constant.authToken);
    Map<String, dynamic> body = {
      // "job_id": id,
    };
    Map<String, String> header = {
      ///  "Authorization": 'Bearer ${auth ?? ''}',
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

  void _close(BuildContext context) {
    Navigator.pop(context, true);
  }
}
