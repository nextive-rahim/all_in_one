import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/network/rest_client.dart';

class CommentRepository {
  Future<dynamic> fetchStudentComment(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.viewCommentUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> fetchReply(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.viewReplyUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> writeComment(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.addCommentUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> writeReply(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.addReply,
      data,
    );
    return res.data;
  }
}
