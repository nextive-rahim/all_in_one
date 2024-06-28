import 'dart:convert';

ProfileResponseModel profileResponseModelFromJson(String str) =>
    ProfileResponseModel.fromJson(json.decode(str));

String profileResponseModelToJson(ProfileResponseModel data) =>
    json.encode(data.toJson());

class ProfileResponseModel {
  bool? success;
  int? error;
  String? message;
  UserModel? data;
  ExamData? examData;
  List<UserSkill>? userSkill;
  dynamic isSubscribed;
  int? countSubscribedUser;

  ProfileResponseModel({
    this.success,
    this.error,
    this.message,
    this.data,
    this.examData,
    this.userSkill,
    this.isSubscribed,
    this.countSubscribedUser,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
        success: json["success"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null ? null : UserModel.fromJson(json["data"]),
        examData: json["exam_data"] == null
            ? null
            : ExamData.fromJson(json["exam_data"]),
        isSubscribed: json["is_subscribed"],
        countSubscribedUser: json["count_subscribed_user"],
        userSkill: json["user_skill"] == null
            ? []
            : List<UserSkill>.from(
                json["user_skill"].map((x) => UserSkill.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "message": message,
        "data": data!.toJson(),
        "exam_data": examData!.toJson(),
        "is_subscribed": isSubscribed,
        "count_subscribed_user": countSubscribedUser,
        "user_skill": List<dynamic>.from(userSkill!.map((x) => x.toJson())),
      };
}

class UserModel {
  int? id;
  String? name;
  int? userId;
  String? phone;
  String? resume;
  String? address;
  String? description;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.name,
    this.userId,
    this.phone,
    this.resume,
    this.address,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        phone: json["phone"] == '' ? 'N/A' : json["phone"],
        resume: json["resume"] == '' ? null : json["resume"],
        address: json["address"] == '' ? 'N/A' : json["address"],
        description: json["description"] == '' ? 'N/A' : json["description"],
        image: json["image"] == ''
            ? 'https://nextivesolution.sgp1.cdn.digitaloceanspaces.com/static/not-found.jpg'
            : json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "phone": phone,
        "resume": resume,
        "address": address,
        "description": description,
        "image": image,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

class ExamData {
  int? id;
  dynamic examUrlId;
  int? courseId;
  int? userId;
  String? examStatus;
  String? marks;
  String? projectLinks;
  DateTime? createdAt;
  DateTime? updatedAt;

  ExamData({
    this.id,
    this.examUrlId,
    this.courseId,
    this.userId,
    this.examStatus,
    this.marks,
    this.projectLinks,
    this.createdAt,
    this.updatedAt,
  });

  factory ExamData.fromJson(Map<String, dynamic> json) => ExamData(
        id: json["id"],
        examUrlId: json["exam_url_id"],
        courseId: json["course_id"],
        userId: json["user_id"],
        examStatus: json["exam_status"],
        marks: json["marks"],
        projectLinks: json["project_links"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "exam_url_id": examUrlId,
        "course_id": courseId,
        "user_id": userId,
        "exam_status": examStatus,
        "marks": marks,
        "project_links": projectLinks,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

class UserSkill {
  int? id;
  int? skillId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? skill;

  UserSkill({
    this.id,
    this.skillId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.skill,
  });

  factory UserSkill.fromJson(Map<String, dynamic> json) => UserSkill(
        id: json["id"],
        skillId: json["skill_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        skill: json["skill"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "skill_id": skillId,
        "user_id": userId,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "skill": skill,
      };
}
