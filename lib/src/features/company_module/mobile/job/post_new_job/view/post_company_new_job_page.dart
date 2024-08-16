import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/post_new_job/widget/company_new_job_post_form_field.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/post_new_job/widget/post_new_job_button.dart';
import 'package:flutter/material.dart';

class PostCompanyNewJobPage extends StatefulWidget {
  const PostCompanyNewJobPage({super.key});

  @override
  State<PostCompanyNewJobPage> createState() => _PostCompanyNewJobPageState();
}

class _PostCompanyNewJobPageState extends State<PostCompanyNewJobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post new job'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Post a job', style: AppTextStyle.bold20),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CompanyNewJobPostFormField()),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const PostNewJobButton(),
    );
  }
}
