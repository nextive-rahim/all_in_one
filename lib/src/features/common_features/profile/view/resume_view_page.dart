import 'package:all_in_one/src/core/widgets/common_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResumeViewPage extends StatelessWidget {
  const ResumeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Resume'),
        ),
        body: CommonPDFViewer(pdfLink: Get.arguments));
  }
}
