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
  const ChooseEngagementPage({
    super.key,
  });

  @override
  State<ChooseEngagementPage> createState() => _ChooseEngagementPageState();
}

class _ChooseEngagementPageState extends State<ChooseEngagementPage> {
  int? _selectedIndex;
  @override
  void initState() {
    super.initState();
  }

  final SizeConfig _sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1000) {
        return _forMobile();
      } else {
        return _forWeb();
      }
    });
    // return SafeArea(
    //     child: Scaffold(
    //   backgroundColor: CommonColor.whiteColor,
    //   body: (defaultTargetPlatform == TargetPlatform.iOS ||
    //           defaultTargetPlatform == TargetPlatform.android ||
    //           MediaQuery.of(context).size.width < 800)
    //       ? _forMobile()
    //       : _forWeb(),
    // ));
  }

  Widget _forWeb() {
    return Scaffold(
      backgroundColor: CommonColor.whiteColor,
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: _sizeConfig.width * 0.56,
              height: _sizeConfig.height,
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.only(
                  left: 88,
                  right: 81,
                  top: 16,
                  bottom: 16,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _headerForWeb(),
                      SizedBox(
                        height: _sizeConfig.getSize(58),
                      ),
                      TextWidget(
                          text: AppStrings.chooseEngagement,
                          color: CommonColor.headingTextColor1,
                          maxLine: 1,
                          fontFamily: AppStrings.inter,
                          fontWeight: FontWeight.w600,
                          fontSize: _sizeConfig.getFontSize(20)),
                      SizedBox(
                        height: _sizeConfig.getSize(30),
                      ),
                      ListView.separated(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, ind) {
                          return const SizedBox(
                            height: 8,
                          );
                        },
                        itemBuilder: (context, index) {
                          return _buildItem(index, 72);
                        },
                      ),
                      SizedBox(
                        height: _sizeConfig.getSize(22),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_selectedIndex != null) {
                            Get.toNamed(Routes.registration);
                          } else {
                            Util.displayToast(
                                context,
                                AppStrings.chooseEngagementMsg,
                                CommonColor.redColors);
                          }
                        },
                        child: Container(
                          height: _sizeConfig.getSize(60),
                          width: _sizeConfig.getSize(171),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: CommonColor.headingTextColor1),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                  text: AppStrings.continueTxt,
                                  color: CommonColor.whiteColor,
                                  maxLine: 1,
                                  fontFamily: AppStrings.inter,
                                  fontWeight: FontWeight.w500,
                                  fontSize: _sizeConfig.getFontSize(18)),
                              SizedBox(
                                width: _sizeConfig.getSize(13),
                              ),
                              Icon(
                                Icons.check_circle_outline_outlined,
                                size: _sizeConfig.getSize(22),
                                color: CommonColor.whiteColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _sizeConfig.getSize(67),
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
                              const SizedBox(
                                width: 8,
                              ),
                              TextWidget(
                                  text: AppStrings.termsOfUse,
                                  color: CommonColor.headingTextColor1,
                                  maxLine: 1,
                                  fontFamily: AppStrings.aeonikTRIAL,
                                  fontWeight: FontWeight.w400,
                                  fontSize: _sizeConfig.getFontSize(12)),
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
                              const SizedBox(
                                width: 8,
                              ),
                              TextWidget(
                                  text: AppStrings.dataCollectionRights,
                                  color: CommonColor.headingTextColor1,
                                  maxLine: 1,
                                  fontFamily: AppStrings.aeonikTRIAL,
                                  fontWeight: FontWeight.w400,
                                  fontSize: _sizeConfig.getFontSize(12)),
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
                              const SizedBox(
                                width: 8,
                              ),
                              TextWidget(
                                  text: AppStrings.privacyAndPolicy,
                                  color: CommonColor.headingTextColor1,
                                  maxLine: 1,
                                  fontFamily: AppStrings.aeonikTRIAL,
                                  fontWeight: FontWeight.w400,
                                  fontSize: _sizeConfig.getFontSize(12)),
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
                              const SizedBox(
                                width: 8,
                              ),
                              TextWidget(
                                  text: AppStrings.customerSupport,
                                  color: CommonColor.headingTextColor1,
                                  maxLine: 1,
                                  fontFamily: AppStrings.aeonikTRIAL,
                                  fontWeight: FontWeight.w400,
                                  fontSize: _sizeConfig.getFontSize(12)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _sizeConfig.getSize(22),
                      ),
                    ]),
              )),
            ),
            Expanded(
                child: Container(
              color: CommonColor.lightGreyForText1,
              child: Image.asset(
                ImageConstant.registerWebExpended,
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                fit: BoxFit.fill,
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _forMobile() {
    return Scaffold(
      backgroundColor: CommonColor.whiteColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 18,
              top: 16,
              bottom: 16,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _headerIsMounted(),
              const SizedBox(height: 30),
              const TextWidget(
                text: AppStrings.chooseEngagement,
                color: CommonColor.headingTextColor1,
                maxLine: 1,
                fontFamily: AppStrings.inter,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              const SizedBox(height: 30),
              ListView.separated(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, ind) {
                  return const SizedBox(height: 8);
                },
                itemBuilder: (context, index) {
                  return _buildItem(index, 118);
                },
              ),
              const SizedBox(height: 18),
              GestureDetector(
                onTap: () {
                  if (_selectedIndex != null) {
                    Get.toNamed(Routes.registration,
                        arguments: (_selectedIndex! + 1).toString());
                  } else {
                    Util.displayToast(context, AppStrings.chooseEngagementMsg,
                        CommonColor.redColors);
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
            ]),
          )),
        ),
      ),
    );
  }

  void _onItemCheckedChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildItem(int item, double height) {
    return GestureDetector(
      onTap: () {
        _onItemCheckedChange(item);
      },
      child: _selectedIndex == item
          ? Container(
              height: height,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: CommonColor.purpleColor1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: CommonColor.purpleColor2),
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
                                text: AppStrings
                                    .chooseEngagementContetTitles[item]
                                    .split(' ')
                                    .first,
                                color: CommonColor.purpleColor3,
                                maxLine: 1,
                                fontFamily: AppStrings.inter,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                              const SizedBox(width: 5),
                              TextWidget(
                                text: AppStrings
                                    .chooseEngagementContetTitles[item]
                                    .split(' ')
                                    .last,
                                color: CommonColor.purpleColor1,
                                maxLine: 1,
                                fontFamily: AppStrings.inter,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ],
                          ),
                          TextWidget(
                            text: AppStrings.chooseEngagementContents[item],
                            color: CommonColor.purpleColor1,
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
                        borderRadius: BorderRadius.circular(100),
                        color: CommonColor.purpleColor1,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.check,
                        color: CommonColor.whiteColor,
                        size: 8,
                        // value: checked,
                        // // title: Text(item),
                        // controlAffinity: ListTileControlAffinity.leading,
                        // onChanged: (checked) =>
                        //     _onItemCheckedChange(item, checked!),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              height: height,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: CommonColor.borderColor1,
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
                          color: CommonColor.purpleColor4),
                      child: const Icon(
                        Icons.layers,
                        size: 15,
                        color: CommonColor.purpleColor1,
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                  text: AppStrings
                                      .chooseEngagementContetTitles[item]
                                      .split(' ')
                                      .first,
                                  color: CommonColor.headingTextColor2,
                                  maxLine: 1,
                                  fontFamily: AppStrings.inter,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                              const SizedBox(
                                width: 5,
                              ),
                              TextWidget(
                                text: AppStrings
                                    .chooseEngagementContetTitles[item]
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
                            text: AppStrings.chooseEngagementContents[item],
                            color: CommonColor.hintTextColor,
                            maxLine: 5,
                            fontFamily: AppStrings.inter,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: CommonColor.textFieldBorderColor),
                          borderRadius: BorderRadius.circular(100),
                          color: CommonColor.whiteColor),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _headerIsMounted() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          ImageConstant.appLogo,
          height: 50,
          width: 50,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          width: 18,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                text: AppStrings.registration,
                color: CommonColor.headingTextColor1,
                maxLine: 1,
                fontFamily: AppStrings.aeonikTRIAL,
                fontWeight: FontWeight.w700,
                fontSize: 20),
            SizedBox(
              height: 10,
            ),
            TextWidget(
                text: AppStrings.welcomeMsgReg,
                color: CommonColor.headingTextColor1,
                maxLine: 1,
                fontFamily: AppStrings.sfProDisplay,
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ],
        )
      ],
    );
  }

  Widget _headerForWeb() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          ImageConstant.appLogo,
          height: _sizeConfig.getSize(202),
          width: _sizeConfig.getSize(195),
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: _sizeConfig.getSize(22),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                text: AppStrings.registration,
                color: CommonColor.headingTextColor1,
                maxLine: 1,
                fontFamily: AppStrings.aeonikTRIAL,
                fontWeight: FontWeight.w400,
                fontSize: _sizeConfig.getFontSize(60)),
            SizedBox(
              height: _sizeConfig.getSize(12),
            ),
            TextWidget(
                text: AppStrings.welcomeMsgReg,
                color: CommonColor.headingTextColor1,
                maxLine: 1,
                fontFamily: AppStrings.sfProDisplay,
                fontWeight: FontWeight.w400,
                fontSize: _sizeConfig.getFontSize(30)),
          ],
        )
      ],
    );
  }
}
