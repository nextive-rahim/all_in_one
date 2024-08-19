import 'dart:convert';

import 'package:all_in_one/src/features/common_features/profile/model/profile_response_model.dart';

UserDetailsResponseModel userDetailsResponseModelFromJson(String str) =>
    UserDetailsResponseModel.fromJson(json.decode(str));

String userDetailsResponseModelToJson(UserDetailsResponseModel data) =>
    json.encode(data.toJson());

class UserDetailsResponseModel {
  bool? success;
  int? error;
  String? message;
  UserDetailsResponseModelData? data;

  UserDetailsResponseModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  factory UserDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsResponseModel(
        success: json["success"],
        error: json["error"],
        message: json["message"],
        data: UserDetailsResponseModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "message": message,
        "data": data!.toJson(),
      };
}

class UserDetailsResponseModelData {
  String? userName;
  int? userType;
  UserModel? data;
  ExamData? examData;
  List<UserSkill>? userSkill;
  // int? isSubscribed;

  UserDetailsResponseModelData({
    this.userName,
    this.userType,
    this.data,
    this.examData,
    this.userSkill,
    //this.isSubscribed,
  });

  factory UserDetailsResponseModelData.fromJson(Map<String, dynamic> json) =>
      UserDetailsResponseModelData(
        userName: json['user_name'],
        userType: json["user_type"],
        data: UserModel.fromJson(json["data"]),
        examData: json["exam_data"] == null
            ? null
            : ExamData.fromJson(json["exam_data"]),
        userSkill: json["user_skill"] == null
            ? null
            : List<UserSkill>.from(
                json["user_skill"].map((x) => UserSkill.fromJson(x))),
        // isSubscribed: json["is_subscribed"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "user_type": userType,
        "data": data!.toJson(),
        "exam_data": examData!.toJson(),
        "user_skill": List<dynamic>.from(userSkill!.map((x) => x.toJson())),
        // "is_subscribed": isSubscribed,
      };
}
