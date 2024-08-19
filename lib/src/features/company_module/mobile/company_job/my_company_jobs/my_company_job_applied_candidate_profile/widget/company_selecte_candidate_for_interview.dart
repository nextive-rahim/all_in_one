part of '../view/company_job_applied_candidate_profile.dart';

class CompanySelecteCandidateForInterview
    extends GetView<CompanyJobViewController> {
  const CompanySelecteCandidateForInterview({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (controller.user?.isSelected == 1) {
          Get.snackbar(
            'Attention!!',
            'Already selected for interview.',
            backgroundColor: CommonColor.redColors,
            colorText: AppColors.white,
          );
          return;
        }

        controller.companySelecteCandidateForInterview().then((v) {
          if (v.success == true) {
            Get.back();
            Get.snackbar(
              'Successfully',
              'Selected Candidate for Interview.',
              backgroundColor: CommonColor.greenColor1,
            );
            controller.getjobList();
          }
        });
      },
      child: Container(
        width: SizeConfig.screenWidth,
        height: 44,
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: controller.user?.isSelected == 1
              ? Colors.grey
              : CommonColor.purpleColor1,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.50, color: CommonColor.greyColor5),
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
        child: const TextWidget(
          text: AppStrings.selectForCompanyInterview,
          color: CommonColor.whiteColor,
          maxLine: 1,
          fontFamily: AppStrings.inter,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
