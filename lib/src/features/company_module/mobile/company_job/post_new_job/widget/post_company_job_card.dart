import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/post_new_job/controller/post_company_new_job_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class PostCompanyJob extends GetView<PostCompanyNewJobViewController> {
  const PostCompanyJob({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.isFromPostEdit.value = false;
        controller.clearTextFields().then((v) {
          context.pushNamed(Routes.postCompanyNewJob);
          // Get.toNamed(Routes.postCompanyNewJob);
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: 149,
          height: 36,
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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              SizedBox(width: 8),
              TextWidget(
                text: AppStrings.postNewJob,
                color: CommonColor.blackColor1,
                maxLine: 1,
                fontFamily: AppStrings.inter,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
