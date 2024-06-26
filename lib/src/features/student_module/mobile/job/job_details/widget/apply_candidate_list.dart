import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppliedCandidateList extends StatefulWidget {
  const AppliedCandidateList({super.key});

  @override
  State<AppliedCandidateList> createState() => _AppliedCandidateListState();
}

class _AppliedCandidateListState extends State<AppliedCandidateList> {
  List<String> appliedProfilesList = [
    "Andrew Simon (2029635)",
    "Cameron Williamson (2029635)",
    "Jacob Jones (2029635)",
    "Floyd Miles (2029635)",
    "Darlene Robertson",
    "Darrell Steward",
  ];
  List<String> selectedProfilesList = [
    "Mathew Simon (2029635)",
    "Cameron Williamson (2029635)",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: CommonColor.greyColor15,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
              bottom: 60,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const TextWidget(
                  textAlign: TextAlign.center,
                  text: AppStrings.appliedProfiles,
                  color: CommonColor.blackColor1,
                  maxLine: 1,
                  fontFamily: AppStrings.sfProDisplay,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                const SizedBox(height: 15),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: appliedProfilesList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.companyJobAppliedCandidateProfile);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            ImageConstant.link2,
                            color: CommonColor.greyColor4,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextWidget(
                              textAlign: TextAlign.start,
                              text: appliedProfilesList[index],
                              color: CommonColor.greyColor4,
                              maxLine: 1,
                              fontFamily: AppStrings.sfProDisplay,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                const TextWidget(
                    textAlign: TextAlign.center,
                    text: AppStrings.selectedProfiles,
                    color: CommonColor.greyColor4,
                    maxLine: 1,
                    fontFamily: AppStrings.sfProDisplay,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
                const SizedBox(height: 15),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: selectedProfilesList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Image.asset(
                          ImageConstant.link2,
                          color: CommonColor.greyColor4,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        TextWidget(
                          textAlign: TextAlign.start,
                          text: selectedProfilesList[index],
                          color: CommonColor.greyColor4,
                          maxLine: 1,
                          fontFamily: AppStrings.sfProDisplay,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
