import 'package:all_in_one/src/features/company_module/mobile/company_profile/controller/company_profile_update_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/widget/company_logo_update_section.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/widget/company_profile_update_button.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/widget/company_profile_update_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyProfileUpdatePage
    extends GetView<CompanyProfileUpdateViewController> {
  const CompanyProfileUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        actions: const [],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 200),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CompanyLogoUpdateSection(),
                  CompanyProfileUpdateFormField()
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CompanyProfileUpdateButton(),
    );
  }
}
