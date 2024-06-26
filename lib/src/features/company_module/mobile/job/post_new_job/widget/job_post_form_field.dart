import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/features/company_module/mobile/job/post_new_job/controller/post_company_new_job_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobPostFormField extends GetView<PostCompanyNewJobViewController> {
  const JobPostFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText('Job Role'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.jobRoleController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: AppStrings.jobTitle,
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
          labelText('Work Experience (Min)'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.workExpMinController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: AppStrings.mininumJobExperience,
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
          labelText('Work Experience (Max)'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.workExpMaxController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: 'Maximum Job Experience',
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
          labelText('Payscale'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.paySalaryController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: 'Salary Range',
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
          labelText('Work Location'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.workLocationController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: 'Location',
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
          labelText('Job Description'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.jobDescriptionController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: 'Job Description',
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
