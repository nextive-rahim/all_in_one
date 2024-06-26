import 'dart:convert';

ViewCourseContentResponseData viewCourseContentResponseDataFromJson(
        String str) =>
    ViewCourseContentResponseData.fromJson(json.decode(str));

String viewCourseContentResponseDataToJson(
        ViewCourseContentResponseData data) =>
    json.encode(data.toJson());

class ViewCourseContentResponseData {
  bool? success;
  String? message;
  int? error;
  List<ContentTittle>? data;

  ViewCourseContentResponseData({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  factory ViewCourseContentResponseData.fromJson(Map<String, dynamic> json) =>
      ViewCourseContentResponseData(
        success: json["success"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null
            ? []
            : List<ContentTittle>.from(
                json["data"].map((x) => ContentTittle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ContentTittle {
  int? id;
  String? name;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<CourseContent>? courseContent;

  ContentTittle({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.courseContent,
  });

  factory ContentTittle.fromJson(Map<String, dynamic> json) => ContentTittle(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        courseContent: json["course_content"] == null
            ? []
            : List<CourseContent>.from(
                json["course_content"].map((x) => CourseContent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "course_content":
            List<dynamic>.from(courseContent!.map((x) => x.toJson())),
      };
}

class CourseContent {
  int? id;
  int? courseId;
  int? levelId;
  String? name;
  String? duration;
  String? imageUrl;
  String? videoLink;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isWatch;

  CourseContent({
    this.id,
    this.courseId,
    this.levelId,
    this.name,
    this.duration,
    this.imageUrl,
    this.videoLink,
    this.createdAt,
    this.updatedAt,
    this.isWatch,
  });

  factory CourseContent.fromJson(Map<String, dynamic> json) => CourseContent(
        id: json["id"],
        courseId: json["course_id"],
        levelId: json["level_id"],
        name: json["name"],
        duration: json["duration"],
        imageUrl: json["image_url"],
        videoLink: json["video_link"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isWatch: json["is_watch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "level_id": levelId,
        "name": name,
        "duration": duration,
        "image_url": imageUrl,
        "video_link": videoLink,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "is_watch": isWatch,
      };
}
