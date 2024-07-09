// To parse this JSON data, do
//
//     final skillResponseModel = skillResponseModelFromJson(jsonString);

import 'dart:convert';

SkillResponseModel skillResponseModelFromJson(String str) =>
    SkillResponseModel.fromJson(json.decode(str));

String skillResponseModelToJson(SkillResponseModel data) =>
    json.encode(data.toJson());

class SkillResponseModel {
  bool? success;
  String? message;
  int? error;
  List<SkillsModel>? data;

  SkillResponseModel({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  factory SkillResponseModel.fromJson(Map<String, dynamic> json) =>
      SkillResponseModel(
        success: json["success"],
        message: json["message"],
        error: json["error"],
        data: List<SkillsModel>.from(
            json["data"].map((x) => SkillsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SkillsModel {
  int? id;
  String? skill;
  int? type;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  SkillsModel({
    this.id,
    this.skill,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory SkillsModel.fromJson(Map<String, dynamic> json) => SkillsModel(
        id: json["id"],
        skill: json["skill"],
        type: json["type"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "skill": skill,
        "type": type,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
