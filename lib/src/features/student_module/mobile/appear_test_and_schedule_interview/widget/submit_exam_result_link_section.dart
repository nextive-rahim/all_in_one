import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/controller/sunmit_result_link_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitExamResultLinkSection
    extends GetView<SubmitResultLinkViewController> {
  const SubmitExamResultLinkSection({
    super.key,
    required this.course,
  });
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
            text: AppStrings.pasteYourResultsFromFlipgrid,
            color: CommonColor.blackColor2,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w400,
            fontSize: 16),
        const SizedBox(height: 12),
        TextFormFieldWidget(
          controller: controller.submitExamLinkController,
          valtext: AppStrings.commonTextVal,
          height: 40,
          hintText: AppStrings.pasteYourLinkHere,
          hintTextColor: CommonColor.blackColor1,
          readOnly: false,
          maxLine: 1,
          keyType: TextInputType.text,
          wordLimit: 100,
          fontFamily: AppStrings.inter,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          onChanged: (value) {},
          prefixIcon: Image.asset(ImageConstant.link1),
        ),
        const SizedBox(height: 8),
        const TextWidget(
          text: AppStrings.pleaseEnsureFlipgridOnly,
          color: CommonColor.blackColor1,
          maxLine: 2,
          fontFamily: AppStrings.inter,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        const SizedBox(height: 16),
        Container(
          width: 109,
          height: 44,
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: CommonColor.blueColor1,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 0.50,
                color: CommonColor.blueColor1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: const [
              BoxShadow(
                color: CommonColor.blackColor3,
                blurRadius: 2,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: GestureDetector(
            onTap: () {
              if (controller.submitExamLinkController.text.isNotEmpty) {
                controller.submitExamLink(course.id!).then(
                      (value) => Util.displayToast(
                        context,
                        'Successfully submitted result link',
                        Colors.black,
                      ),
                    );
                controller.isSubmittedResultLink = true;
                controller.submitExamLinkController.clear();
              } else {
                Util.displayToast(
                  context,
                  'Please enter exan result link',
                  Colors.red,
                );
              }
            },
            child: const TextWidget(
              text: AppStrings.submit,
              color: CommonColor.whiteColor,
              maxLine: 1,
              fontFamily: AppStrings.inter,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
