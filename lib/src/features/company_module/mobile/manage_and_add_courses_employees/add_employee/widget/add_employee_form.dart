import 'package:all_in_one/src/core/service/file/file_service.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/controller/added_new_employee_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddedNewEmployeeFormField
    extends GetView<AddedNewEmployeeViewController> {
  const AddedNewEmployeeFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText('Employee Id*'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.employeeController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: '123456',
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
          labelText('Name*'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.nameController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: AppStrings.name,
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
          labelText('On site email address'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.emailController,
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
            height: 45,
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
          labelText('Degination'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.deginationController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: 'Degination',
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
          labelText('Skills'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.skillsController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: 'Added employee skills',
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
          labelText('Upload Resume'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.uploadResumeController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: 'Only PDF',
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
            suffixIcon: IconButton(
              onPressed: () async {
                FileModel? file = await FileService().pickAFile(pdfOnly: true);
                controller.imagelink.value = file!.path;
              },
              icon: const Icon(Icons.upload),
            ),
          ),
          labelText('Employee Description'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.employeeDescriptionController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: 'Employee Description',
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
