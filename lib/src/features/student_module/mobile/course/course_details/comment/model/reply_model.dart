// import 'dart:convert';

// ReplyResponseModel replyResponseModelFromJson(String? str) =>
//     ReplyResponseModel.fromJson(json.decode(str!));

// String? replyResponseModelToJson(ReplyResponseModel data) =>
//     json.encode(data.toJson());

// class ReplyResponseModel {
//   bool? success;
//   String? message;
//   int? error;
//   List<ReplyModel>? data;

//   ReplyResponseModel({
//     this.success,
//     this.message,
//     this.error,
//     this.data,
//   });

//   factory ReplyResponseModel.fromJson(Map<String?, dynamic> json) =>
//       ReplyResponseModel(
//         success: json["success"],
//         message: json["message"],
//         error: json["error"],
//         data: List<ReplyModel>.from(json["data"].map((x) => ReplyModel.fromJson(x))),
//       );

//   Map<String?, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "error": error,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class ReplyModel {
//   String? username;
//   String? name;
//   int? id;
//   int? courseCommentId;
//   int? replyId;
//   String? replyText;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   ReplyModel({
//     this.username,
//     this.name,
//     this.id,
//     this.courseCommentId,
//     this.replyId,
//     this.replyText,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory ReplyModel.fromJson(Map<String?, dynamic> json) => ReplyModel(
//         username: json["username"],
//         name: json["name"],
//         id: json["id"],
//         courseCommentId: json["course_comment_id"],
//         replyId: json["reply_id"],
//         replyText: json["reply_text"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//       );

//   Map<String?, dynamic> toJson() => {
//         "username": username,
//         "name": name,
//         "id": id,
//         "course_comment_id": courseCommentId,
//         "reply_id": replyId,
//         "reply_text": replyText,
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//       };
// }
