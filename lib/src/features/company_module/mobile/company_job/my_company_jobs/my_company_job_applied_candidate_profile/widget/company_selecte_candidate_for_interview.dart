part of '../view/company_job_applied_candidate_profile.dart';

class CompanySelecteCandidateForInterview
    extends GetView<CompanyJobViewController> {
  const CompanySelecteCandidateForInterview({super.key});

  @override
  Widget build(BuildContext context) {
    final userdetailsController = Get.find<UserDetailsViewController>();

    return Obx(
      () => InkWell(
        onTap: () {
          if (userdetailsController.isSelectedCadidate.value == true ||
              controller.user?.isSelected == 1 ||
              userdetailsController.isFrom == IsCadidateSelect.seleted.name) {
            SnackBarService.showErrorSnackBar(
                'Already selected for interview.');

            return;
          }

          controller.companySelecteCandidateForInterview().then((v) {
            if (v.success == true) {
              userdetailsController.isSelectedCadidate.value = true;
              controller.fileterList().then((v) {
                controller.appliedCandidateList!.refresh();
                controller.seletedCandidate!.refresh();
                // Get.back();
                SnackBarService.showInfoSnackBar(
                    'Selected Candidate for Interview.');

                controller.getCompanyjobList();
              });
            }
          });
        },
        child: Container(
          width: SizeConfig.screenWidth,
          height: 44,
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: userdetailsController.isSelectedCadidate.value == true ||
                    controller.user?.isSelected == 1 ||
                    userdetailsController.isFrom ==
                        IsCadidateSelect.seleted.name
                ? Colors.grey
                : CommonColor.purpleColor1,
            shape: RoundedRectangleBorder(
              side:
                  const BorderSide(width: 0.50, color: CommonColor.greyColor5),
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
      ),
    );
  }
}
