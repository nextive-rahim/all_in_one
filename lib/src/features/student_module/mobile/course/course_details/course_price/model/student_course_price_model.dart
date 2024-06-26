class CoursePriceResponse {
  bool? success;
  String? message;
  int? error;
  List<CoursePriceResponseData>? data;

  CoursePriceResponse({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  CoursePriceResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    error = json['error'];
    data = List<CoursePriceResponseData>.from(
        json["data"].map((x) => CoursePriceResponseData.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CoursePriceResponseData {
  int? id;
  int? courseId;
  String? price;
  String? discount;
  String? description;
  dynamic days;
  String? createdAt;
  String? updatedAt;
  String? name;
  int? courseReteId;

  CoursePriceResponseData(
      {this.id,
      this.courseId,
      this.price,
      this.discount,
      this.description,
      this.days,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.courseReteId});

  CoursePriceResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    price = json['price'];
    discount = json['discount'];
    description = json['description'];
    days = json['days'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    courseReteId = json['courseReteId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_id'] = courseId;
    data['price'] = price;
    data['discount'] = discount;
    data['description'] = description;
    data['days'] = days;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['name'] = name;
    data['courseReteId'] = courseReteId;
    return data;
  }
}
