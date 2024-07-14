import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_test_request/controller/interviewer_test_request_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewerTestResultPendingCard
    extends GetView<InterviewerTestRequestViewController> {
  const InterviewerTestResultPendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 26,
        left: 18,
        right: 16,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstant.verificationPending,
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.5,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 50,
          ),
          const TextWidget(
            text: AppStrings.verificationPending,
            color: CommonColor.greyColor6,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              controller.isInterviewerApproved.value = true;
              print(controller.isInterviewerApproved.value);
            },
            child: Container(
              width: 165,
              height: 40,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 0.50,
                    color: CommonColor.greyColor5,
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(ImageConstant.refresh),
                  const SizedBox(width: 10),
                  const Text(
                    AppStrings.refresh,
                    style: TextStyle(
                      color: CommonColor.blackColor4,
                      fontSize: 14,
                      fontFamily: AppStrings.inter,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
