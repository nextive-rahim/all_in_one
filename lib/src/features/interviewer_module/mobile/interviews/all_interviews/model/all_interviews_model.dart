import 'dart:convert';

AllViewInterviewResponse viewInterviewResponseFromJson(String str) =>
    AllViewInterviewResponse.fromJson(json.decode(str));

String viewInterviewResponseToJson(AllViewInterviewResponse data) =>
    json.encode(data.toJson());

class AllViewInterviewResponse {
  bool? success;
  String? message;
  List<ViewInterviewResponseData>? data;

  AllViewInterviewResponse({
    this.success,
    this.message,
    this.data,
  });

  factory AllViewInterviewResponse.fromJson(Map<String, dynamic> json) =>
      AllViewInterviewResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ViewInterviewResponseData>.from(
                json["data"].map((x) => ViewInterviewResponseData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ViewInterviewResponseData {
  int? id;
  int? userId;
  int? courseId;
  DateTime? date;
  String? timeSlotA;
  String? timeSlotB;
  dynamic approvedSlotA;
  dynamic approvedSlotB;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? username;
  int? userType;
  String? title;
  String? thumbnailImage;
  String? totalTime;
  String? author;
  String? interviewLink;

  ViewInterviewResponseData({
    this.id,
    this.userId,
    this.courseId,
    this.date,
    this.timeSlotA,
    this.timeSlotB,
    this.approvedSlotA,
    this.approvedSlotB,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.userType,
    this.title,
    this.thumbnailImage,
    this.totalTime,
    this.author,
    this.interviewLink,
  });

  factory ViewInterviewResponseData.fromJson(Map<String, dynamic> json) =>
      ViewInterviewResponseData(
        id: json["id"],
        userId: json["user_id"],
        courseId: json["course_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        timeSlotA: json["time_slot_a"],
        timeSlotB: json["time_slot_b"],
        approvedSlotA: json["approved_slot_a"],
        approvedSlotB: json["approved_slot_b"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        username: json["username"],
        userType: json["user_type"],
        title: json["title"],
        thumbnailImage: json["thumbnail_image"],
        totalTime: json["total_time"],
        author: json["author"],
        interviewLink: json["interview_meeting_link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "course_id": courseId,
        "date": date!.toIso8601String(),
        "time_slot_a": timeSlotA,
        "time_slot_b": timeSlotB,
        "approved_slot_a": approvedSlotA,
        "approved_slot_b": approvedSlotB,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "username": username,
        "user_type": userType,
        "title": title,
        "thumbnail_image": thumbnailImage,
        "total_time": totalTime,
        "author": author,
        "interview_meeting_link": interviewLink,
      };
}
