import 'package:all_in_one/src/core/extension/sizebox_extension.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/controller/company_invoice_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/view/invoice_list_page.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/widget/company_invoice_tab.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/widget/generate_invoice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenerateCompanyInvoice extends StatefulWidget {
  const GenerateCompanyInvoice({super.key});

  @override
  State<GenerateCompanyInvoice> createState() => _GenerateCompanyInvoiceState();
}

class _GenerateCompanyInvoiceState extends State<GenerateCompanyInvoice> {
  final controller = Get.put(CompanyInvoiceViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.fetchInvoices();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // const StudentAppBarMobile(
              //   titel1: AppStrings.companyName,
              //   title2: "manage your invoice",
              //   isBack: false,
              //   searchHintText: "",
              //   isShowNotificationIcon: false,
              // ),
              15.sh,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CompanyInvoiceTabSection(
                      firstTabViewItems: [GenerateInvoice()],
                      secondTabViewItems: [InvoiceListPage()],
                      title1: 'Generate Invoice',
                      title2: 'Invoices',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
