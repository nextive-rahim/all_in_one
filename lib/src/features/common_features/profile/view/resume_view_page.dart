import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/text_style.dart';
import 'package:all_in_one/src/core/widgets/common_pdf_viewer.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/controller/download_invoice_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResumeViewPage extends StatelessWidget {
  const ResumeViewPage({super.key});

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
                      controller.dowmloadInvoice(url);
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
            Expanded(
              child: CommonPDFViewer(pdfLink: url),
            ),
          ],
        ));
  }
}
