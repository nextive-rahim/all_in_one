import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/model/incoice_link_model.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/model/invoice_model.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/repository/company_invoice_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyInvoiceViewController extends GetxController {
  final CompanyInvoiceRepository _repository = CompanyInvoiceRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  final formKey = GlobalKey<FormState>();
  final RxList<InvoiceModel> invoice = <InvoiceModel>[].obs;
  late InvoiceResponseModel invoiceModel;
  InvoiceResponseModel? invoiceResponseModel;
  InvoiceLinkResponseModel? invoiceLinkResponseModel =
      InvoiceLinkResponseModel();
  Rx<String> selectedEmployeeName = 'selecte employee'.obs;
  RxBool isInvoiceLinkLoading = false.obs;
  RxBool isGeneratedInvoice = false.obs;

  @override
  void onInit() async {
    hourController.addListener(addInputs);
    daysController.addListener(addInputs);
    await fetchInvoices();

    super.onInit();
  }

  void addInputs() {
    // Parse input values; use 0.0 if parsing fails
    final num1 = double.tryParse(hourController.text) ?? 0.0;
    final num2 = double.tryParse(daysController.text) ?? 0.0;
    final sum = num1 * num2;
    // Update resultController with the sum
    amountController.text = sum.toString();
  }

  Future<void> fetchInvoices() async {
    _pageStateController(PageState.loading);

    try {
      final res = await _repository.fetchInvoices();
      InvoiceResponseModel jobListResponse = InvoiceResponseModel.fromJson(res);
      invoice.value = jobListResponse.data ?? [];
      _pageStateController(PageState.success);

      return;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return;
    }
  }

  Future<InvoiceResponseModel> generateInvoice() async {
    // print(!formKey.currentState!.validate());

    isGeneratedInvoice.value = true;

    Map<String, dynamic> requestBody = {
      'name': selectedEmployeeName.value,
      'hour': hourController.text,
      'days': daysController.text,
      'amount': amountController.text,
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.generateInvoice(requestBody);

      invoiceModel = InvoiceResponseModel.fromJson(res);

      isGeneratedInvoice.value = false;

      return invoiceModel;

      //  Get.offAllNamed(Routes.dashboard);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      isGeneratedInvoice.value = false;
    }
    return InvoiceResponseModel(success: false);
  }

  Future<InvoiceLinkResponseModel> invoiceLink(int invoiceId) async {
    isInvoiceLinkLoading.value = false;

    Map<String, dynamic> requestBody = {
      'id': invoiceId,
    };

    Log.debug(requestBody.toString());

    try {
      final res = await _repository.getInvoiceLink(requestBody);

      invoiceLinkResponseModel = InvoiceLinkResponseModel.fromJson(res);

      isInvoiceLinkLoading.value = true;

      return invoiceLinkResponseModel!;
      //clearTextFields();
      //  Get.offAllNamed(Routes.dashboard);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
      return invoiceLinkResponseModel!;
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

  // @override
  // void onClose() {
  //   // TODO: implement onClose
  //   super.onClose();
  // }
  @override
  void dispose() {
    hourController.dispose();
    daysController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    // Dispose controllers to free up resources
    hourController.dispose();
    daysController.dispose();
    amountController.dispose();
    super.onClose();
  }
}
