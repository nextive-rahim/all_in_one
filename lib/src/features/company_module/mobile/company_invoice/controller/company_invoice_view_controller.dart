import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/model/incoice_link_model.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/model/invoice_model.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/repository/company_invoice_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CompanyInvoiceViewController extends GetxController {
  final CompanyInvoiceRepository _repository = CompanyInvoiceRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  final formKey = GlobalKey<FormState>();
  final RxList<InvoiceModel> invoice = <InvoiceModel>[].obs;
  late InvoiceResponseModel invoiceModel;
  InvoiceResponseModel? invoiceResponseModel;
  InvoiceLinkResponseModel? invoiceLinkResponseModel;
  String? selectedEmployeeName;
  RxBool isInvoiceLinkLoading = false.obs;
  @override
  void onInit() async {
    await fetchInvoices();
    super.onInit();
  }

  Future<void> fetchInvoices() async {
    // _pageStateController(PageState.loading);

    try {
      final res = await _repository.fetchInvoices();
      InvoiceResponseModel jobListResponse = InvoiceResponseModel.fromJson(res);
      invoice.value = jobListResponse.data ?? [];
      //  _pageStateController(PageState.success);

      return;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }

  Future<void> generateInvoice() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    _pageStateController(PageState.loading);

    Map<String, dynamic> requestBody = {
      'name': selectedEmployeeName,
      'hour': hourController.text,
      'days': daysController.text,
      'amount': amountController.text,
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.generateInvoice(requestBody);

      invoiceModel = InvoiceResponseModel.fromJson(res);

      _pageStateController(PageState.success);

      return;
      //clearTextFields();
      //  Get.offAllNamed(Routes.dashboard);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }

  Future<void> invoiceLink(int invoiceId) async {
    isInvoiceLinkLoading.value = false;

    Map<String, dynamic> requestBody = {
      'id': invoiceId,
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.getInvoiceLink(requestBody);

      invoiceLinkResponseModel = InvoiceLinkResponseModel.fromJson(res);

      isInvoiceLinkLoading.value = true;

      return;
      //clearTextFields();
      //  Get.offAllNamed(Routes.dashboard);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }

  /// Text Editing Controllers
  final hourController = TextEditingController();
  final daysController = TextEditingController();
  final amountController = TextEditingController();

  void clearTextFields() {
    hourController.clear();
    daysController.clear();
    amountController.clear();
  }
}
