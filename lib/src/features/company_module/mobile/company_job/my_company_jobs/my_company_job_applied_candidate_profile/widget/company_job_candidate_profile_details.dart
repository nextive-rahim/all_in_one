part of '../view/company_job_applied_candidate_profile.dart';

class CompanyJobCandidateProfileDetails
    extends GetView<UserDetailsViewController> {
  const CompanyJobCandidateProfileDetails({
    super.key,
    // required this.user,
  });
  // final UserDetailsResponseModelData user;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: AppStrings.employeeDescription,
          color: CommonColor.blackColor1,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        const SizedBox(height: 8),
        TextWidget(
          text: controller.userDetailsModel!.data?.description ?? '',
          color: CommonColor.greyColor6,
          maxLine: 100,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        const SizedBox(height: 30),
        const TextWidget(
          text: AppStrings.topSkills,
          color: CommonColor.blackColor1,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        const SizedBox(height: 15),
        controller.userDetailsModel!.userSkill == null
            ? const Offstage()
            : Wrap(
                direction: Axis.horizontal,
                spacing: 3.0,
                runSpacing: 8.0,
                children: [
                  for (int i = 0;
                      i < controller.userDetailsModel!.userSkill!.length;
                      i++)
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 10,
                      ),
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
                      child: TextWidget(
                        textAlign: TextAlign.center,
                        text:
                            controller.userDetailsModel!.userSkill![i].skill ??
                                '',
                        color: CommonColor.greyColor11,
                        maxLine: 1,
                        fontFamily: AppStrings.inter,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
        const SizedBox(height: 30),
        // const TextWidget(
        //     text: AppStrings.completedCourses,
        //     color: CommonColor.blackColor1,
        //     maxLine: 1,
        //     fontFamily: AppStrings.sfProDisplay,
        //     fontWeight: FontWeight.w600,
        //     fontSize: 18),
        // const SizedBox(
        //   height: 15,
        // ),
        //  CompletedCourseVideoListBuilder()

        const TextWidget(
          text: AppStrings.evaluations,
          color: CommonColor.blackColor1,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                urlLauncher(controller.userDetailsModel!.data?.resume ?? '');
              },
              child: Row(
                children: [
                  const TextWidget(
                    text: AppStrings.projectLink,
                    color: CommonColor.blueColor1,
                    maxLine: 1,
                    fontFamily: AppStrings.inter,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    ImageConstant.link2,
                    color: CommonColor.blueColor1,
                    height: 15,
                    width: 15,
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Stack(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(Routes.resume, arguments: '');
              },
              child: Container(
                width: 199,
                height: 142,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.cv),
                    fit: BoxFit.fill,
                  ),
                  gradient: LinearGradient(
                    begin: const Alignment(0.00, -1.00),
                    end: const Alignment(0, 1),
                    colors: [Colors.black.withOpacity(0), Colors.black],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextWidget(
          text: 'Resume of ${controller.userDetailsModel!.data?.name}',
          color: CommonColor.greyColor11,
          maxLine: 2,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ],
    );
  }
}
