import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseEngagementPage extends StatefulWidget {
  const ChooseEngagementPage({super.key});

  @override
  State<ChooseEngagementPage> createState() => _ChooseEngagementPageState();
}

class _ChooseEngagementPageState extends State<ChooseEngagementPage> {
  int? _selectedIndex;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.whiteColor,
      appBar: AppBar(
        title: const Text('Choose Engagement'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 18,
              top: 16,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _headerIsMounted(),
                const SizedBox(height: 30),
                ListView.separated(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, ind) {
                    return const SizedBox(height: 8);
                  },
                  itemBuilder: (context, index) {
                    return index == 1
                        ? const Offstage()
                        : _buildItem(index, 118);
                  },
                ),
                const SizedBox(height: 18),
                GestureDetector(
                  onTap: () {
                    if (_selectedIndex != null) {
                      Get.toNamed(Routes.registration,
                          arguments: (_selectedIndex! + 1).toString());
                    } else {
                      Util.displayErrorToast(
                        context,
                        AppStrings.chooseEngagementMsg,
                      );
                    }
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _selectedIndex != null
                          ? CommonColor.purpleColor1
                          : CommonColor.headingTextColor1,
                    ),
                    alignment: Alignment.center,
                    child: const TextWidget(
                      text: AppStrings.continueTxt,
                      color: CommonColor.whiteColor,
                      maxLine: 1,
                      fontFamily: AppStrings.inter,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 41),
                Container(
                  width: SizeConfig.screenWidth,
                  height: 1,
                  color: CommonColor.backgroundColor2,
                ),
                const SizedBox(
                  height: 21,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: CommonColor.headingTextColor1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const TextWidget(
                          text: AppStrings.termsOfUse,
                          color: CommonColor.headingTextColor1,
                          maxLine: 1,
                          fontFamily: AppStrings.aeonikTRIAL,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: CommonColor.headingTextColor1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const TextWidget(
                          text: AppStrings.dataCollectionRights,
                          color: CommonColor.headingTextColor1,
                          maxLine: 1,
                          fontFamily: AppStrings.aeonikTRIAL,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: CommonColor.headingTextColor1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const TextWidget(
                          text: AppStrings.privacyAndPolicy,
                          color: CommonColor.headingTextColor1,
                          maxLine: 1,
                          fontFamily: AppStrings.aeonikTRIAL,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const TextWidget(
                  text: AppStrings.appVersion,
                  color: CommonColor.lightGreyForText1,
                  maxLine: 1,
                  fontFamily: AppStrings.aeonikTRIAL,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
                const SizedBox(height: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onItemCheckedChange(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  Widget _buildItem(int index, double height) {
    return GestureDetector(
      onTap: () {
        _onItemCheckedChange(index);
      },
      child: Container(
        height: height,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: _selectedIndex == index
                  ? CommonColor.purpleColor1
                  : CommonColor.borderColor1,
            ),
            borderRadius: BorderRadius.circular(8),
            color: CommonColor.whiteColor),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: CommonColor.purpleColor4,
                ),
                child: const Icon(
                  Icons.layers,
                  size: 15,
                  color: CommonColor.purpleColor1,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: AppStrings.chooseEngagementContetTitles[index]
                              .split(' ')
                              .first,
                          color: CommonColor.headingTextColor2,
                          maxLine: 1,
                          fontFamily: AppStrings.inter,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        const SizedBox(width: 5),
                        TextWidget(
                          text: AppStrings.chooseEngagementContetTitles[index]
                              .split(' ')
                              .last,
                          color: CommonColor.hintTextColor,
                          maxLine: 1,
                          fontFamily: AppStrings.inter,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ],
                    ),
                    TextWidget(
                      text: AppStrings.chooseEngagementContents[index],
                      color: CommonColor.hintTextColor,
                      maxLine: 5,
                      fontFamily: AppStrings.inter,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: CommonColor.textFieldBorderColor),
                    borderRadius: BorderRadius.circular(100),
                    color: _selectedIndex == index
                        ? CommonColor.purpleColor1
                        : CommonColor.whiteColor),
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerIsMounted() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageConstant.appLogo,
          height: 50,
          width: 50,
          fit: BoxFit.fill,
        ),
        const SizedBox(width: 18),
        const TextWidget(
          text: AppStrings.chooseEngagement,
          color: CommonColor.headingTextColor1,
          maxLine: 1,
          fontFamily: AppStrings.aeonikTRIAL,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        const SizedBox(height: 10),
        const TextWidget(
          text: AppStrings.welcomeMsgReg,
          color: CommonColor.headingTextColor1,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        )
      ],
    );
  }
}
