// To parse this JSON data, do
//
//     final invoiceLinkResponseModel = invoiceLinkResponseModelFromJson(jsonString);

import 'dart:convert';

InvoiceLinkResponseModel invoiceLinkResponseModelFromJson(String str) =>
    InvoiceLinkResponseModel.fromJson(json.decode(str));

String invoiceLinkResponseModelToJson(InvoiceLinkResponseModel data) =>
    json.encode(data.toJson());

class InvoiceLinkResponseModel {
  bool? success;
  String? message;
  String? url;

  InvoiceLinkResponseModel({
    this.success,
    this.message,
    this.url,
  });

  factory InvoiceLinkResponseModel.fromJson(Map<String, dynamic> json) =>
      InvoiceLinkResponseModel(
        success: json["success"],
        message: json["message"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "url": url,
      };
}
