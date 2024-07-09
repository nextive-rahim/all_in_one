import 'dart:convert';

RegistrationResponseModel registrationResponseModelFromJson(String str) =>
    RegistrationResponseModel.fromJson(json.decode(str));

String registrationResponseModelToJson(RegistrationResponseModel data) =>
    json.encode(data.toJson());

class RegistrationResponseModel {
  bool? success;
  String? message;
  String? data;

  RegistrationResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) =>
      RegistrationResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
