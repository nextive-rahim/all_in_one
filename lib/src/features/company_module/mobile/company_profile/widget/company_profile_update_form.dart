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
          OutlinedInputField(
            labelText: 'Company Name',
            controller: controller.nameController,
            hintText: 'Add company name',
            //validator: InputFieldValidator.name(),
          ),
          OutlinedInputField(
            labelText: 'Address',
            controller: controller.addressController,
            hintText: 'Add Address',
            // validator: InputFieldValidator.name(),
          ),
          OutlinedInputField(
            labelText: 'Contact no.',
            controller: controller.contactsNumberController,
            hintText: 'Add contact number',
            // validator: InputFieldValidator.name(),
          ),
          OutlinedInputField(
            labelText: 'Company Description',
            controller: controller.employeeDescriptionController,
            hintText: 'Company Description',
            maxLines: 5,
            // validator: InputFieldValidator.name(),
          ),
        ],
      ),
    );
  }
}
