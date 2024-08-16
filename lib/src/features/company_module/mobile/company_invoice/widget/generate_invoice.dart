import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/controller/company_invoice_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:all_in_one/src/core/extension/sizebox_extension.dart';
import 'package:all_in_one/src/core/extension/string_extension.dart';
import 'package:all_in_one/src/core/extension/text_extension.dart';
import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/validators/input_form_validators.dart';
import 'package:all_in_one/src/core/widgets/common_dropdown.dart';
import 'package:all_in_one/src/core/widgets/primary_button.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:get/get.dart';

class GenerateInvoice extends StatefulWidget {
  const GenerateInvoice({super.key});

  @override
  State<GenerateInvoice> createState() => _GenerateInvoiceState();
}

class _GenerateInvoiceState extends State<GenerateInvoice> {
  final controller = Get.find<CompanyInvoiceViewController>();
  final employeControler = Get.find<EmployeeListViewController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(getFormattedDate(DateTime.now())!)
            .fontSize(20)
            .bold(FontWeight.w600),
        25.sh,
        const Text('Generated Monthly Invoice')
            .fontSize(17)
            .bold(FontWeight.w600),
        20.sh,
        Text(
          'Name of the Employee',
          style: AppTextStyle.medium14.copyWith(color: AppColors.black),
        ),
        const SizedBox(height: 6),
        Obx(() {
          if (controller.pageState == PageState.loading) {
            return const CircularProgressIndicator();
          }
          return CommonPopupMenu(
            onSelected: (String value) {
              setState(() {
                controller.selectedEmployeeName = value;
              });
            },
            data:
                employeControler.employeeList.map((e) => e.name ?? '').toList(),
            selectedValue: controller.selectedEmployeeName ?? 'Select employee',
          );
        }),
        10.sh,
        Form(
          key: controller.formKey,
          child: Column(
            children: [
              OutlinedInputField(
                labelText: 'Hours',
                controller: controller.hourController,
                hintText: 'No. of working hours',
                validator: InputFieldValidator.name(),
                keyboardType: TextInputType.number,
              ),
              OutlinedInputField(
                labelText: 'Days',
                controller: controller.daysController,
                hintText: 'No. of working days',
                validator: InputFieldValidator.name(),
                keyboardType: TextInputType.number,
              ),
              OutlinedInputField(
                labelText: 'Amount',
                controller: controller.amountController,
                hintText: 'Total amount',
                validator: InputFieldValidator.name(),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        20.sh,
        PrimaryButton(
          isLoading: controller.pageState == PageState.loading,
          onTap: () {
            if (controller.selectedEmployeeName == null) {
              Get.snackbar(
                'Warning',
                'Please select employee name',
                backgroundColor: CommonColor.redColors,
                colorText: Colors.white,
              );
              return;
            }
            controller.generateInvoice().then((value) {
              controller.fetchInvoices();
              Get.snackbar(
                'Successful',
                'Generate Invoice successfully',
                backgroundColor: CommonColor.purpleColor1,
                colorText: Colors.white,
              );
            });
          },
          widget: const Text('Generate Invoice')
              .fontSize(16)
              .bold(FontWeight.w600)
              .color(AppColors.white),
        )
      ],
    );
  }
}
