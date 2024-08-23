// To parse this JSON data, do
//
//     final interviewerPaymentResponseModel = interviewerPaymentResponseModelFromJson(jsonString);

import 'dart:convert';

InterviewerPaymentResponseModel interviewerPaymentResponseModelFromJson(
        String str) =>
    InterviewerPaymentResponseModel.fromJson(json.decode(str));

String interviewerPaymentResponseModelToJson(
        InterviewerPaymentResponseModel data) =>
    json.encode(data.toJson());

class InterviewerPaymentResponseModel {
  bool? success;
  List<InterviewerPaymentModel>? data;

  InterviewerPaymentResponseModel({
    this.success,
    this.data,
  });

  factory InterviewerPaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      InterviewerPaymentResponseModel(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<InterviewerPaymentModel>.from(
                json["data"].map((x) => InterviewerPaymentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class InterviewerPaymentModel {
  int? id;
  int? userApplyInterviewId;
  String? date;
  String? amount;
  int? status;
  int? feedbackId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? feedbackContent;

  InterviewerPaymentModel({
    this.id,
    this.userApplyInterviewId,
    this.date,
    this.amount,
    this.status,
    this.feedbackId,
    this.createdAt,
    this.updatedAt,
    this.feedbackContent,
  });

  factory InterviewerPaymentModel.fromJson(Map<String, dynamic> json) =>
      InterviewerPaymentModel(
        id: json["id"],
        userApplyInterviewId: json["user_apply_interview_id"],
        date: json["date"],
        amount: json["amount"],
        status: json["status"],
        feedbackId: json["feedback_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        feedbackContent: json["feedback_content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_apply_interview_id": userApplyInterviewId,
        "date": date,
        "amount": amount,
        "status": status,
        "feedback_id": feedbackId,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "feedback_content": feedbackContent,
      };
}
