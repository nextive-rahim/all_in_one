part of '../view/company_job_applied_candidate_profile.dart';

class _CompanyJobCandidateProfileHeader extends StatelessWidget {
  const _CompanyJobCandidateProfileHeader({required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 76,
            height: 76,
            alignment: Alignment.center,
            decoration: const ShapeDecoration(
              color: CommonColor.greyColor15,
              shape: CircleBorder(),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                userModel.image ?? '',
                cacheHeight: 129,
                cacheWidth: 199,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(noImageFound);
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextWidget(
            textAlign: TextAlign.center,
            text: userModel.name ?? '',
            color: CommonColor.blackColor1,
            maxLine: 1,
            fontFamily: AppStrings.aeonikTRIAL,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
          const SizedBox(height: 8),
          TextWidget(
            text: userModel.phone ?? '',
            color: CommonColor.blackColor1,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
