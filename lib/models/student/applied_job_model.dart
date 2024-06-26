import 'package:flutter/material.dart';

class AppliedJobResponse {
  bool? success;
  String? message;
  List<AppliedJobResponseData>? data;

  AppliedJobResponse({this.success, this.message, this.data});

  AppliedJobResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AppliedJobResponseData>[];
      json['data'].forEach((v) {
        data!.add(AppliedJobResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppliedJobResponseData {
  int? id;
  String? jobRole;
  String? workExpMin;
  String? workExpMax;
  String? paysalary;
  String? workLocation;
  String? jobDescription;
  int? userId;
  String? time;
  String? createdAt;
  String? updatedAt;

  AppliedJobResponseData(
      {this.id,
      this.jobRole,
      this.workExpMin,
      this.workExpMax,
      this.paysalary,
      this.workLocation,
      this.jobDescription,
      this.userId,
      this.time,
      this.createdAt,
      this.updatedAt});

  AppliedJobResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobRole = json['job_role'];
    workExpMin = json['work_exp_min'];
    workExpMax = json['work_exp_max'];
    paysalary = json['paysalary'];
    workLocation = json['work_location'];
    jobDescription = json['job_description'];
    userId = json['user_id'];
    time = json['time'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_role'] = jobRole;
    data['work_exp_min'] = workExpMin;
    data['work_exp_max'] = workExpMax;
    data['paysalary'] = paysalary;
    data['work_location'] = workLocation;
    data['job_description'] = jobDescription;
    data['user_id'] = userId;
    data['time'] = time;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}


extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 1280
        ? (xl ?? lg ?? md ?? sm ?? defaultVal)
        : wd >= 1024
            ? (lg ?? md ?? sm ?? defaultVal)
            : wd >= 768
                ? (md ?? sm ?? defaultVal)
                : wd >= 640
                    ? (sm ?? defaultVal)
                    : defaultVal;
  }
}