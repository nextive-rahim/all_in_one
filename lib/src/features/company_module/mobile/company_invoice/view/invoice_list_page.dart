import 'package:all_in_one/src/core/extension/string_extension.dart';
import 'package:all_in_one/src/core/gobal_function.dart';
import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/controller/company_invoice_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceListPage extends GetView<CompanyInvoiceViewController> {
  const InvoiceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.pageState == PageState.loading) {
        return const CircularProgressIndicator();
      }
      return ListView.builder(
          itemCount: controller.invoice.length,
          shrinkWrap: true,
          reverse: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  urlLauncher(
                      'http://13.233.141.65:3000/invoice/AllinOne9.pdf');
                  // controller.invoiceLink(controller.invoice[index].id!);
                  // Get.toNamed(Routes.companyInvoicePage);
                },
                title: Text(controller.invoice[index].name ?? ''),
                subtitle: Text(
                    getFormattedDateTime(controller.invoice[index].createdAt)!),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primary,
                ),
              ),
            );
          });
    });
  }
}
