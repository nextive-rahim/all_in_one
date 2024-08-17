import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/validators/input_form_validators.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/post_new_job/controller/post_company_new_job_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyNewJobPostFormField
    extends GetView<PostCompanyNewJobViewController> {
  const CompanyNewJobPostFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          OutlinedInputField(
            labelText: 'Job Role',
            controller: controller.jobRoleController,
            hintText: AppStrings.jobTitle,
            validator: InputFieldValidator.name(),
          ),
          OutlinedInputField(
            labelText: 'Work Experience (Min)',
            controller: controller.workExpMinController,
            hintText: AppStrings.mininumJobExperience,
            validator: InputFieldValidator.name(),
            keyboardType: TextInputType.number,
          ),
          OutlinedInputField(
            labelText: 'Work Experience (Max)',
            controller: controller.workExpMaxController,
            hintText: 'Maximum Job Experience',
            validator: InputFieldValidator.name(),
            keyboardType: TextInputType.number,
          ),
          OutlinedInputField(
            labelText: 'Payscale',
            controller: controller.paySalaryController,
            hintText: 'Salary Range',
            validator: InputFieldValidator.name(),
          ),
          OutlinedInputField(
            labelText: 'Work Location',
            controller: controller.workLocationController,
            hintText: 'Location',
            validator: InputFieldValidator.name(),
          ),
          OutlinedInputField(
            labelText: 'Job Description',
            controller: controller.jobDescriptionController,
            hintText: 'Job Description',
            maxLines: 5,
            validator: InputFieldValidator.name(),
          ),
        ],
      ),
    );
  }
}
