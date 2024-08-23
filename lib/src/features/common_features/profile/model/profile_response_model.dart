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
  TestRequest? testRequest;

  ProfileResponseModel({
    this.success,
    this.error,
    this.message,
    this.data,
    this.examData,
    this.userSkill,
    this.isSubscribed,
    this.countSubscribedUser,
    this.testRequest,
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
        testRequest: json["test_request"] == null
            ? null
            : TestRequest.fromJson(json["test_request"]),
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
        "test_request": testRequest!.toJson(),
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
        phone: json["phone"],
        resume: json["resume"],
        address: json["address"],
        description: json["description"],
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

class TestRequest {
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

  TestRequest({
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
  });

  factory TestRequest.fromJson(Map<String, dynamic> json) => TestRequest(
        id: json["id"],
        userId: json["user_id"],
        courseId: json["course_id"],
        date: DateTime.parse(json["date"]),
        timeSlotA: json["time_slot_a"],
        timeSlotB: json["time_slot_b"],
        approvedSlotA: json["approved_slot_a"],
        approvedSlotB: json["approved_slot_b"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
      };
}
