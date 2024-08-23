import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/widgets/common_pdf_viewer.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/controller/download_invoice_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// class CompanyInvoiceViewPage extends GetView<CompanyInvoiceViewController> {
//   const CompanyInvoiceViewPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Obx(
//           () {
//             if (!controller.isInvoiceLinkLoading.value) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return PDFView(
//               filePath: 'http://13.233.141.65:3000/invoice/AllinOne9.pdf',
//               enableSwipe: true,
//               swipeHorizontal: false,
//               autoSpacing: false,
//               pageFling: true,
//               pageSnap: true,
//               fitPolicy: FitPolicy.BOTH,
//               onError: (e) {
//                 //Show some error message or UI
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class CompanyInvoiceViewPage extends StatelessWidget {
  const CompanyInvoiceViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DownloadInvoiceViewController());
    String url = Get.arguments;
    String name = url.split('/').last;
    return Scaffold(
        //  key: controller.key,
        appBar: AppBar(
          title: Text(name),
          actions: [
            Obx(
              () => IconButton(
                  onPressed: () async {
                    controller.permissionReady =
                        await controller.checkPermission();
                    if (controller.permissionReady) {
                      await controller.prepareSaveDir();
                      controller.dowmloadInvoice(
                          'https://www.sldttc.org/allpdf/21583473018.pdf');
                    }
                  },
                  icon: controller.dowdloadProgress.value == 0
                      ? const Icon(
                          Icons.download,
                          color: CommonColor.whiteColor,
                        )
                      : controller.dowdloadProgress.value == 100
                          ? const Icon(
                              Icons.download_done,
                              color: CommonColor.whiteColor,
                            )
                          : Text(
                              '${controller.dowdloadProgress.value}%',
                              style: AppTextStyle.bold16.copyWith(
                                color: AppColors.white,
                              ),
                            )),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Text(
                    'SSL Certificate Error',
                    style: AppTextStyle.bold16.copyWith(color: AppColors.red),
                  ),
                  const Text(
                    'Copy the link and paste it in the web browser to view the invoice.',
                    style: AppTextStyle.bold14,
                  ),
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: url));
                        Get.snackbar('Success', "Copied to Clipboard",
                            colorText: CommonColor.whiteColor,
                            backgroundColor: CommonColor.greenColor1);
                      },
                      icon: const Icon(
                        Icons.copy,
                        color: CommonColor.purpleColor1,
                      ))
                ],
              ),
            ),
            const Expanded(
              child: CommonPDFViewer(
                  pdfLink: 'https://pdfobject.com/pdf/sample.pdf'),
            ),
          ],
        ));
  }
}
