// To parse this JSON data, do
//
//     final listExamLinkResponse = listExamLinkResponseFromJson(jsonString);

import 'dart:convert';

ListExamLinkResponse listExamLinkResponseFromJson(String str) =>
    ListExamLinkResponse.fromJson(json.decode(str));

String listExamLinkResponseToJson(ListExamLinkResponse data) =>
    json.encode(data.toJson());

class ListExamLinkResponse {
  bool? success;
  String? message;
  List<ExamLinkModel>? data;

  ListExamLinkResponse({
    this.success,
    this.message,
    this.data,
  });

  factory ListExamLinkResponse.fromJson(Map<String, dynamic> json) =>
      ListExamLinkResponse(
        success: json["success"],
        message: json["message"],
        data: List<ExamLinkModel>.from(
            json["data"].map((x) => ExamLinkModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ExamLinkModel {
  int? id;
  int? courseId;
  String? url;
  String? status;

  ExamLinkModel({
    this.id,
    this.courseId,
    this.url,
    this.status,
  });

  factory ExamLinkModel.fromJson(Map<String, dynamic> json) => ExamLinkModel(
        id: json["id"],
        courseId: json["course_id"],
        url: json["url"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "url": url,
        "status": status,
      };
}
