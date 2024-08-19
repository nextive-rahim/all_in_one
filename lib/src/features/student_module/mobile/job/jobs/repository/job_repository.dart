import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/network/rest_client.dart';

class JobListRepository {
  Future<dynamic> fetchJobList(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.viewJobUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> fetchAppliedJobs(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.appliedJobUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> companySelectCandidateforInterview(
      Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.companySelectCandidateForInterview,
      data,
    );
    return res.data;
  }
  // Future<dynamic> fetchSavedJobs() async {
  //   final res = await RestClient.dev().get(
  //     APIType.PROTECTED,
  //     API.viewSavedJobUrl,
  //   );
  //   return res.data;
  // }

  Future<dynamic> otherCompanyJobs(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.otherCompanyJobs,
      data,
    );
    return res.data;
  }

  Future<dynamic> applyJob(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.applyJobUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> saveJob(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.saveJobUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> deleteSaveJob(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.deleteSaveJobUrl,
      data,
    );
    return res.data;
  }

  Future<dynamic> deleteCompanyJob(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.deleteCompanyJobUrl,
      data,
    );
    return res.data;
  }
}
