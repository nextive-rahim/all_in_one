import 'package:all_in_one/src/features/company_module/mobile/company_profile/controller/company_profile_update_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/widget/company_logo_update_section.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/widget/company_profile_update_button.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/widget/company_profile_update_form.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyProfileUpdatePage
    extends GetView<CompanyProfileUpdateViewController> {
  CompanyProfileUpdatePage({super.key}) {
    controller.profileDataPopulate(Get.find<ProfileController>().userModel!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
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
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(0.0),
        child: CompanyProfileUpdateButton(),
      ),
    );
  }
}
