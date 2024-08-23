import 'dart:convert';

InvoiceResponseModel invoiceResponseModelFromJson(String str) =>
    InvoiceResponseModel.fromJson(json.decode(str));

String invoiceResponseModelToJson(InvoiceResponseModel data) =>
    json.encode(data.toJson());

class InvoiceResponseModel {
  bool? success;
  int? error;
  String? message;
  List<InvoiceModel>? data;

  InvoiceResponseModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  factory InvoiceResponseModel.fromJson(Map<String, dynamic> json) =>
      InvoiceResponseModel(
        success: json["success"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<InvoiceModel>.from(
                json["data"].map((x) => InvoiceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class InvoiceModel {
  int? id;
  String? name;
  String? hour;
  String? days;
  String? amount;
  String? date;
  int? companyId;
  DateTime? createdAt;
  DateTime? updatedAt;

  InvoiceModel({
    this.id,
    this.name,
    this.hour,
    this.days,
    this.amount,
    this.date,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
        id: json["id"],
        name: json["name"],
        hour: json["hour"],
        days: json["days"],
        amount: json["amount"],
        date: json["date"],
        companyId: json["company_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "hour": hour,
        "days": days,
        "amount": amount,
        "date": date,
        "company_id": companyId,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
