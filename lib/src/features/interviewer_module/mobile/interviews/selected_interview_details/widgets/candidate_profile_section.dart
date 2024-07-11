import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/common_features/user_details/model/user_details_model.dart';
import 'package:flutter/material.dart';

class CandidateProfileSection extends StatefulWidget {
  const CandidateProfileSection({
    super.key,
    required this.user,
  });
  final UserDetailsResponseModelData? user;
  @override
  State<CandidateProfileSection> createState() =>
      _CandidateProfileSectionState();
}

class _CandidateProfileSectionState extends State<CandidateProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Stack(
                children: [
                  Container(
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
                  // Positioned.fill(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 12),
                  //     child: Align(
                  //       alignment: Alignment.bottomCenter,
                  //       child: Container(
                  //         width: 44,
                  //         height: 44,
                  //         alignment: Alignment.center,
                  //         clipBehavior: Clip.antiAlias,
                  //         decoration: ShapeDecoration(
                  //           color: Colors.white,
                  //           shape: RoundedRectangleBorder(
                  //             side: const BorderSide(
                  //                 width: 0.50, color: CommonColor.greyColor5),
                  //             borderRadius: BorderRadius.circular(8),
                  //           ),
                  //           shadows: const [
                  //             BoxShadow(
                  //               color: CommonColor.blackColor3,
                  //               blurRadius: 2,
                  //               offset: Offset(0, 1),
                  //               spreadRadius: 0,
                  //             )
                  //           ],
                  //         ),
                  //         child: const Icon(
                  //           Icons.file_download_outlined,
                  //           color: CommonColor.headingTextColor2,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 8),
              TextWidget(
                text: 'Resume of ${widget.user?.data?.name}',
                color: CommonColor.greyColor11,
                maxLine: 2,
                fontFamily: AppStrings.sfProDisplay,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
