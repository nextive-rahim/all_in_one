class LoginResponseModel {
  bool? success;
  String? message;
  LoginResponseData? data;
  String? token;

  LoginResponseModel({this.success, this.message, this.data, this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data =
        json['data'] != null ? LoginResponseData.fromJson(json['data']) : null;

    if (json['token'] != null) token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (token != null) {
      data['token'] = token;
    }
    return data;
  }
}

class LoginResponseData {
  int? id;
  String? username;
  int? userType;
  dynamic empId;
  dynamic registrationNo;

  LoginResponseData({
    this.id,
    this.username,
    this.userType,
    this.empId,
    this.registrationNo,
  });

  LoginResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    userType = json['user_type'];
    empId = json['emp_id'];
    registrationNo = json['registration_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['user_type'] = userType;
    data['emp_id'] = empId;
    data['registration_no'] = registrationNo;
    return data;
  }
}
