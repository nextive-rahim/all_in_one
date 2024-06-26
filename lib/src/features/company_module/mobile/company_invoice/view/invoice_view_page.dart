import 'package:all_in_one/src/features/company_module/mobile/company_invoice/controller/company_invoice_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

class CompanyInvoiceViewPage extends GetView<CompanyInvoiceViewController> {
  const CompanyInvoiceViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            if (!controller.isInvoiceLinkLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return PDFView(
              filePath: 'http://13.233.141.65:3000/invoice/AllinOne9.pdf',
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: true,
              pageSnap: true,
              fitPolicy: FitPolicy.BOTH,
              onError: (e) {
                //Show some error message or UI
              },
            );
          },
        ),
      ),
    );
  }
}
