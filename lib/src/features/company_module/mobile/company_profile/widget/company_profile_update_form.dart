import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/controller/company_profile_update_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyProfileUpdateFormField
    extends GetView<CompanyProfileUpdateViewController> {
  const CompanyProfileUpdateFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText('Company Name'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.nameController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: 'Nextive Solution',
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
          labelText('Address'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.addressController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: 'example@gmail.com',
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
          labelText('Contact no.'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.contactsNumberController,
            valtext: AppStrings.commonTextVal,
            hintText: 'Contact number',
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
          labelText('Company Description'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.employeeDescriptionController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: 'Company Description',
            readOnly: false,
            maxLine: 5,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget labelText(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        top: 20,
      ),
      child: Title(
        color: AppColors.black,
        child: Text(title),
      ),
    );
  }
}
