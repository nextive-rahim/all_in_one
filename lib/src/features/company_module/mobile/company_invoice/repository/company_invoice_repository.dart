import 'package:all_in_one/src/core/network/endpoints.dart';
import 'package:all_in_one/src/core/network/rest_client.dart';

class CompanyInvoiceRepository {
  Future<dynamic> generateInvoice(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.companyGenerateInvoice,
      data,
    );
    return res.data;
  }

  Future<dynamic> getInvoiceLink(Map<String, dynamic> data) async {
    final res = await RestClient.dev().post(
      APIType.PROTECTED,
      API.companyInvoiceLink,
      data,
    );
    return res.data;
  }

  Future<dynamic> fetchInvoices() async {
    final res = await RestClient.dev().get(
      APIType.PROTECTED,
      API.companyViewInvoice,
    );
    return res.data;
  }
}
