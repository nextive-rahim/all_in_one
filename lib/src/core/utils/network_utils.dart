import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

enum HttpMethod { httpGet, httpPost, httpDelete, httpPut, httpPatch }

class FormSubmissionMultipartFile extends MultipartFile {
  Map<String, String> relatedFormId;
  FormSubmissionMultipartFile(this.relatedFormId, String field,
      Stream<List<int>> stream, int length, String fileName)
      : super(field, stream, length, filename: fileName);
}

extension HttpMethodToString on HttpMethod {
  String get stringValue {
    switch (this) {
      case HttpMethod.httpGet:
        return 'GET';
      case HttpMethod.httpPost:
        return 'POST';
      case HttpMethod.httpPut:
        return 'PUT';
      case HttpMethod.httpDelete:
        return 'DELETE';
      case HttpMethod.httpPatch:
        return 'PATCH';
      default:
        return '';
    }
  }
}

class NetworkUtility {
  Future<String> makeWebServiceGetRequest(
      {required String url, required Map<String, String> header}) async {
    final response = await http.get(Uri.parse(url), headers: header);
    log("Url : $url");
    log("header : ${jsonEncode(header)}");
    // log("body : " + body);
    log("response : ${response.body}");
    return response.body;
  }

  Future<String> makeWebServiceRequest(
      {required String url,
      required Map<String, dynamic> body,
      required Map<String, String> header}) async {
    final response =
        await http.post(Uri.parse(url), headers: header, body: body);
    log("Url : $url");
    log("header : ${jsonEncode(header)}");
    log("body : $body");
    log("response : ${response.body}");
    return response.body;
  }

  Future<String> makeWebServiceRequestJsonBody(
      {required String url,
      required String body,
      required Map<String, String> header}) async {
    final response =
        await http.post(Uri.parse(url), headers: header, body: body);
    // log("Url : $url");
    // log("header : ${jsonEncode(header)}");
    // log("body : $body");
    // log("response : ${response.body}");
    return response.body;
  }

  /*
  * * Login Change Password Forgot Password
  */

}
