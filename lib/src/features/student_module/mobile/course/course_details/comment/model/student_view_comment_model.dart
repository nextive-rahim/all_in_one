// To parse this JSON data, do
//
//     final viewCommentResponse = viewCommentResponseFromJson(jsonString);

import 'dart:convert';

ViewCommentResponse viewCommentResponseFromJson(String str) =>
    ViewCommentResponse.fromJson(json.decode(str));

String viewCommentResponseToJson(ViewCommentResponse data) =>
    json.encode(data.toJson());

class ViewCommentResponse {
  bool? success;
  String? message;
  int? error;
  List<ViewCommentResponseData>? data;

  ViewCommentResponse({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  factory ViewCommentResponse.fromJson(Map<String, dynamic> json) =>
      ViewCommentResponse(
        success: json["success"],
        message: json["message"],
        error: json["error"],
        data: List<ViewCommentResponseData>.from(
            json["data"].map((x) => ViewCommentResponseData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ViewCommentResponseData {
  int? id;
  int? courseId;
  int? userId;
  dynamic replyId;
  String? commentText;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? username;
  String? replyText;
  int? userType;
  String? name;

  ViewCommentResponseData({
    this.id,
    this.courseId,
    this.userId,
    this.replyId,
    this.commentText,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.userType,
    this.replyText,
    this.name,
  });

  factory ViewCommentResponseData.fromJson(Map<String, dynamic> json) =>
      ViewCommentResponseData(
        id: json["id"],
        courseId: json["course_id"],
        userId: json["user_id"],
        replyId: json["reply_id"],
        commentText: json["comment_text"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        username: json["username"],
        userType: json["user_type"],
        replyText: json["reply_text"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "user_id": userId,
        "reply_id": replyId,
        "comment_text": commentText,
        "is_active": isActive,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "username": username,
        "userId": userId,
        "name": name,
        "user_type": userType,
        "reply_text": replyText,
      };
}
