part of '../view/company_job_applied_candidate_profile.dart';

class CompanySelecteCandidateForInterview extends StatelessWidget {
  const CompanySelecteCandidateForInterview({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.snackbar(
          'Successfully',
          'Selected Candidate for Interview',
          backgroundColor: CommonColor.greenColor1,
        );
      },
      child: Container(
        width: SizeConfig.screenWidth,
        height: 44,
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
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
          color: CommonColor.headingTextColor2,
          maxLine: 1,
          fontFamily: AppStrings.inter,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
