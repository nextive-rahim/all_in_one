import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class InterviewCardLoading extends StatelessWidget {
  const InterviewCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, ind) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      width: 0.9, color: CommonColor.greyColor18),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 24,
                  bottom: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: '',
                      color: CommonColor.blackColor2,
                      maxLine: 1,
                      fontFamily: AppStrings.sfProDisplay,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(''),
                        SizedBox(width: 10),
                        Text(''),
                      ],
                    ),

                    // widget.isFormConfirmInterviews
                    //     ? Padding(
                    //         padding: const EdgeInsets.only(top: 16),
                    //         child: Row(
                    //           children: [
                    //             Image.asset(
                    //               ImageConstant.link2,
                    //               color: CommonColor.blueColor1,
                    //             ),
                    //             const SizedBox(width: 8),
                    //             const TextWidget(
                    //               text: AppStrings.interviewLink,
                    //               color: CommonColor.blueColor1,
                    //               maxLine: 1,
                    //               fontFamily: AppStrings.sfProDisplay,
                    //               fontWeight: FontWeight.w400,
                    //               fontSize: 20,
                    //             ),
                    //           ],
                    //         ),
                    //       )
                    //     : const Offstage(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
