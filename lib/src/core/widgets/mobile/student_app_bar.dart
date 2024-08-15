import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_form_field_search.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentAppBarMobile extends StatefulWidget {
  final String? titel1;
  final String? title2;
  final bool? isBack;
  final String? searchHintText;
  final bool isShowNotificationIcon;
  final Function(String)? onSearchListener;
  const StudentAppBarMobile({
    super.key,
    required this.titel1,
    required this.title2,
    required this.isBack,
    required this.searchHintText,
    this.onSearchListener,
    this.isShowNotificationIcon = true,
  });

  @override
  State<StudentAppBarMobile> createState() => _StudentAppBarMobileState();
}

class _StudentAppBarMobileState extends State<StudentAppBarMobile> {
  final _searchController = TextEditingController();
  final profileController = Get.find<ProfileViewController>();
  @override
  void initState() {
    super.initState();
  }

  final SizeConfig _sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        left: 10,
        right: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.isBack!
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 16,
                            color: CommonColor.greyColor12,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const TextWidget(
                          text: "Back", //AppStrings.welcomeBackJoydeep,
                          color: CommonColor.greyColor12,
                          maxLine: 1,
                          fontFamily: AppStrings.inter,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ],
                    )
                  : Obx(() {
                      if (profileController.pageState == PageState.loading) {
                        return const Offstage();
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: profileController.userModel?.name ??
                                widget.titel1!, //AppStrings.welcomeBackJoydeep,
                            color: CommonColor.headingTextColor1,
                            maxLine: 2,
                            fontFamily: AppStrings.aeonikTRIAL,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                          const SizedBox(height: 7),
                          TextWidget(
                            text: profileController.userModel?.address ??
                                widget.title2 ??
                                '', //AppStrings.startLearningToday,
                            color: CommonColor.greyColor6,
                            maxLine: 2,
                            fontFamily: AppStrings.sfProDisplay,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ],
                      );
                    }),
              const SizedBox(width: 32),
              widget.isShowNotificationIcon
                  ? SizedBox(
                      height: 40,
                      width: 40,
                      child: Stack(
                        children: [
                          const Positioned(
                            left: 0,
                            bottom: 0,
                            child: Icon(
                              Icons.notifications_none_outlined,
                              color: CommonColor.headingTextColor1,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 3,
                            child: SizedBox(
                              height: 28,
                              width: 28,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                color: CommonColor.whiteColor,
                                elevation: 5,
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 3.0),
                                  child: TextWidget(
                                    textAlign: TextAlign.center,
                                    text: '2',
                                    color: CommonColor.headingTextColor1,
                                    maxLine: 1,
                                    fontFamily: AppStrings.sfProDisplay,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : const Offstage(),
            ],
          ),
          if (widget.onSearchListener != null) const SizedBox(height: 16),
          if (widget.onSearchListener != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: SizedBox(
                // width: _sizeConfig.getSize(347),
                child: TextFormFieldSearchWidget(
                  controller: _searchController,
                  valtext: AppStrings.commonTextVal,
                  height: _sizeConfig.getSize(66),
                  hintText: widget.searchHintText!,
                  readOnly: false,
                  maxLine: 1,
                  keyType: TextInputType.text,
                  wordLimit: 25,
                  fontFamily: AppStrings.inter,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  onChanged: (value) {
                    widget.onSearchListener!(value);
                  },
                  // suffixIcon: const Icon(
                  //   Icons.close,
                  //   color: Colors.grey,
                  //   size: 16,
                  // ),
                  // onSuffixTap: () {
                  //   setState(() {
                  //     _searchController.text = '';
                  //   });
                  // },
                  preffixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 16,
                  ),
                  onPreffixTap: () {
                    setState(() {
                      // hintUsernameHelperText = !hintUsernameHelperText;
                    });
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
