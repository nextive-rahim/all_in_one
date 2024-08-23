part of '../view/generate_invoice_page.dart';

class _GenerateInvoiceButton extends GetView<CompanyInvoiceViewController> {
  const _GenerateInvoiceButton();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        isLoading: controller.isGeneratedInvoice.value == true,
        onTap: () {
          if (!controller.formKey.currentState!.validate()) {
            return;
          }
          if (controller.selectedEmployeeName.value == 'selecte employee') {
            Get.snackbar(
              'Warning',
              'Please select employee name',
              backgroundColor: CommonColor.redColors,
              colorText: Colors.white,
            );
            return;
          }
          FocusManager.instance.primaryFocus!.unfocus();
          controller.generateInvoice().then((value) {
            if (value.success == false) {
              return;
            }
            controller.clearTextFields();

            controller.fetchInvoices();
            Get.snackbar(
              'Successful',
              'Generate Invoice successfully',
              backgroundColor: CommonColor.greenColor1,
              colorText: Colors.white,
            );
          });
        },
        widget: const Text('Generate Invoice')
            .fontSize(16)
            .bold(FontWeight.w600)
            .color(AppColors.white),
      ),
    );
  }
}
