import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/post_new_job/controller/post_company_new_job_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/post_new_job/widget/company_new_job_post_form_field.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/post_new_job/widget/post_new_job_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCompanyNewJobPage extends GetView<PostCompanyNewJobViewController> {
  const PostCompanyNewJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Obx(
          () => Text(
              controller.isFromPostEdit.value ? 'Edit Job' : 'Post new job'),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 190),
                child: Text('Post a job', style: AppTextStyle.bold20),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(
                        right: 200,
                        left: 200,
                        bottom: 70,
                      ),
                      child: CompanyNewJobPostFormField()),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const PostNewJobButton(),
    );
  }
}
