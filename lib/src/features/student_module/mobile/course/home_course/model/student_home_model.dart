import 'dart:convert';

CategoryWiseCourseResponseModel categoryWiseCourseResponseModelFromJson(
        String str) =>
    CategoryWiseCourseResponseModel.fromJson(json.decode(str));

String categoryWiseCourseResponseModelToJson(
        CategoryWiseCourseResponseModel data) =>
    json.encode(data.toJson());

class CategoryWiseCourseResponseModel {
  bool? success;
  String? message;
  int? error;
  List<CategoryWiseCourseModel>? data;

  CategoryWiseCourseResponseModel({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  factory CategoryWiseCourseResponseModel.fromJson(Map<String, dynamic> json) =>
      CategoryWiseCourseResponseModel(
        success: json["success"],
        message: json["message"],
        error: json["error"],
        data: List<CategoryWiseCourseModel>.from(
            json["data"].map((x) => CategoryWiseCourseModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CategoryWiseCourseModel {
  int? id;
  String? name;
  int? order;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<CourseModel>? collectinList;

  CategoryWiseCourseModel({
    this.id,
    this.name,
    this.order,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.collectinList,
  });

  factory CategoryWiseCourseModel.fromJson(Map<String, dynamic> json) =>
      CategoryWiseCourseModel(
        id: json["id"],
        name: json["name"],
        order: json["order"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        collectinList: List<CourseModel>.from(
            json["collectinList"].map((x) => CourseModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "order": order,
        "is_active": isActive,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "collectinList":
            List<dynamic>.from(collectinList!.map((x) => x.toJson())),
      };
}

class CourseModel {
  String? title;
  String? thumbnailImage;
  String? introVideo;
  String? subTitle;
  String? totalTime;
  String? description;
  String? author;
  String? coursesLevel;
  int? id;

  CourseModel({
    this.title,
    this.thumbnailImage,
    this.introVideo,
    this.subTitle,
    this.totalTime,
    this.description,
    this.author,
    this.coursesLevel,
    this.id,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        title: json["title"],
        thumbnailImage: json["thumbnail_image"],
        introVideo: json["intro_video"],
        subTitle: json["sub_title"],
        totalTime: json["total_time"],
        description: json["description"],
        author: json["author"],
        coursesLevel: json["courses_level"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "thumbnail_image": thumbnailImage,
        "intro_video": introVideo,
        "sub_title": subTitle,
        "total_time": totalTime,
        "description": description,
        "author": author,
        "courses_level": coursesLevel,
        "id": id,
      };
}
