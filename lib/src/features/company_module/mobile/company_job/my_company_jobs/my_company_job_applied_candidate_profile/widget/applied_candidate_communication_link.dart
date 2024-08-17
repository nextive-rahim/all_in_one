part of '../view/company_job_applied_candidate_profile.dart';

class AppliedCandidateCommunicationLink extends StatelessWidget {
  const AppliedCandidateCommunicationLink({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            SupportLink.hotlineSupport('01718663032');
          },
          child: Container(
            width: SizeConfig.screenWidth,
            height: 44,
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 0.50, color: CommonColor.greyColor5),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstant.send1,
                  color: CommonColor.headingTextColor2,
                ),
                const SizedBox(width: 10),
                const TextWidget(
                  text: AppStrings.call,
                  color: CommonColor.headingTextColor2,
                  maxLine: 1,
                  fontFamily: AppStrings.inter,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () {
            SupportLink.emailSupport('rahimsr983@gmail.com');
          },
          child: Container(
            width: SizeConfig.screenWidth,
            height: 44,
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 0.50, color: CommonColor.greyColor5),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstant.send1,
                  color: CommonColor.headingTextColor2,
                ),
                const SizedBox(width: 10),
                const TextWidget(
                  text: AppStrings.email,
                  color: CommonColor.headingTextColor2,
                  maxLine: 1,
                  fontFamily: AppStrings.inter,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SupportLink {
  static Future<void> hotlineSupport(String path) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: path,
    );
    await urlLauncher(
      launchUri.toString(),
    );
  }

  static Future<void> emailSupport(String path) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: path,
    );
    await urlLauncher(
      launchUri.toString(),
    );
  }
}
