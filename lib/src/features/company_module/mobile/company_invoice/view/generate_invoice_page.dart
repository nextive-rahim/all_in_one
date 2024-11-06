import 'package:all_in_one/src/core/extension/sizebox_extension.dart';
import 'package:all_in_one/src/core/extension/string_extension.dart';
import 'package:all_in_one/src/core/extension/text_extension.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/validators/input_form_validators.dart';
import 'package:all_in_one/src/core/widgets/common_dropdown.dart';
import 'package:all_in_one/src/core/widgets/primary_button.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/controller/company_invoice_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/view/invoice_list_page.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/widget/company_invoice_tab.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
part '../widget/generate_invoice_button.dart';
part '../widget/generate_invoice.dart';

class GenerateCompanyInvoice extends GetView<CompanyInvoiceViewController> {
  const GenerateCompanyInvoice({super.key});

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
                padding: EdgeInsets.symmetric(horizontal: 160, vertical: 0),
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
