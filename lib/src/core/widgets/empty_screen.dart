import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    super.key,
    this.onTap,
    this.title,
  });
  final void Function()? onTap;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 20,
        bottom: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: title ?? AppStrings.latestCourses,
                  style: const TextStyle(
                    color: CommonColor.greyColor4,
                    fontSize: 18,
                    fontFamily: AppStrings.aeonikTRIAL,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const TextSpan(
                  text: ' ${AppStrings.fromTopExperts}',
                  style: TextStyle(
                    color: CommonColor.greyColor4,
                    fontSize: 18,
                    fontFamily: AppStrings.aeonikTRIAL,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.59,
            child: Stack(
              alignment: Alignment.center,
              // fit: StackFit.expand,
              fit: StackFit.loose,
              children: [
                Positioned.fill(
                  child: SizedBox(
                    width: SizeConfig.screenWidth,
                    child: Image.asset(
                      ImageConstant.emptyCourse,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    bottom: SizeConfig.screenHeight * 0.13,
                    child: Column(
                      children: [
                        const TextWidget(
                            textAlign: TextAlign.center,
                            text: AppStrings.coursesUnavailable,
                            color: CommonColor.blackColor1,
                            maxLine: 1,
                            fontFamily: AppStrings.sfProDisplay,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Row(
                            children: [
                              Image.asset(ImageConstant.refresh),
                              const SizedBox(
                                width: 16,
                              ),
                              const TextWidget(
                                  textAlign: TextAlign.center,
                                  text: AppStrings.refresh,
                                  color: CommonColor.greyColor11,
                                  maxLine: 1,
                                  fontFamily: AppStrings.sfProDisplay,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
