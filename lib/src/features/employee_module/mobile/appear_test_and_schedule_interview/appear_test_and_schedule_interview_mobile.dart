import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_date_field.dart';
import 'package:all_in_one/src/core/widgets/text_form_field.dart';
import 'package:all_in_one/src/core/widgets/text_time_field.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AppearTestAndScheduleInterviewEmployeeMobilePage extends StatefulWidget {
  const AppearTestAndScheduleInterviewEmployeeMobilePage({
    super.key,
  });

  @override
  State<AppearTestAndScheduleInterviewEmployeeMobilePage> createState() =>
      _AppearTestAndScheduleInterviewEmployeeMobilePageState();
}

class _AppearTestAndScheduleInterviewEmployeeMobilePageState
    extends State<AppearTestAndScheduleInterviewEmployeeMobilePage> {
  bool _activeRequistForInterview = false;

  final _pastlink1Controller = TextEditingController();
  final _pastlink2Controller = TextEditingController();
  final _chooseDateController = TextEditingController();
  final _timeSlotAController = TextEditingController();
  final _timeSlotBController = TextEditingController();

  String? editorResult = '', _pastlink2Text = '';

  //YoutubePlayerController? _controller;
  String dropdownValue = AppStrings.courseLevelDropdown.first;
  @override
  void initState() {
    //  _fetchDummyData();

    super.initState();
    // if (!Platform.isWindows) {
    //   _controller = YoutubePlayerController(
    //     params: const YoutubePlayerParams(
    //       showControls: true,
    //       mute: false,
    //       showFullscreenButton: true,
    //       loop: false,
    //     ),
    //   );

    //   _controller!.setFullScreenListener(
    //     (isFullScreen) {
    //       // Navigator.push(
    //       //   context,
    //       //   MaterialPageRoute(
    //       //       builder: (context) => const YoutubePlayerFullscreen(
    //       //             videoId: 'lNQJNImBsKY',
    //       //           )),
    //       // );
    //       PersistentNavBarNavigator.pushNewScreen(
    //         context,
    //         screen: const YoutubePlayerFullscreen(
    //           videoId: 'lNQJNImBsKY',
    //         ),
    //         withNavBar: false, // OPTIONAL VALUE. True by default.
    //         pageTransitionAnimation: PageTransitionAnimation.cupertino,
    //       );

    //       log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
    //     },
    //   );

    //   _controller!.loadVideoById(videoId: 'lNQJNImBsKY');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CommonColor.whiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CommonColor.whiteColor,
          title: const TextWidget(
              text: "Back",
              color: CommonColor.greyColor6,
              maxLine: 1,
              fontFamily: AppStrings.inter,
              fontWeight: FontWeight.w500,
              fontSize: 16),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: CommonColor.greyColor6,
              size: 18,
            ),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 0, right: 17, left: 20, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                  text: AppStrings.testYourSkills,
                  color: CommonColor.blackColor1,
                  maxLine: 1,
                  fontFamily: AppStrings.aeonikTRIAL,
                  fontWeight: FontWeight.w400,
                  fontSize: 26),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: SizeConfig.screenWidth,
                height: 1,
                color: CommonColor.greyColor18,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              alignment: Alignment.center,
                              decoration: const ShapeDecoration(
                                color: CommonColor.blueColor1,
                                shape: CircleBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x33000000),
                                    blurRadius: 3.75,
                                    offset: Offset(0, 1.50),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Image.asset(ImageConstant.link3),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const TextWidget(
                                text: "01",
                                color: CommonColor.greyColor11,
                                maxLine: 1,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: AppStrings.step01,
                                color: CommonColor.greyColor12,
                                maxLine: 1,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                            SizedBox(
                              height: 7,
                            ),
                            TextWidget(
                                text: AppStrings.openYourTestLinkBrowser,
                                color: CommonColor.blackColor1,
                                maxLine: 2,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.lock_outline_rounded,
                                  size: 12,
                                  color: CommonColor.greenColor1,
                                ),
                                TextWidget(
                                    text: AppStrings
                                        .allLinksAreSafeAndVerifiedByOurTeam,
                                    color: CommonColor.greyColor6,
                                    maxLine: 2,
                                    fontFamily: AppStrings.sfProDisplay,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ],
                            )
                          ],
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: SizeConfig.screenWidth,
                      height: 62,
                      decoration: ShapeDecoration(
                        color: CommonColor.greyColor18,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 7, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.55,
                              child: const TextWidget(
                                  text:
                                      'https://www.flipgrid.com/common-test/assesment.asp',
                                  underline: TextDecoration.underline,
                                  color: CommonColor.greyColor11,
                                  maxLine: 2,
                                  fontFamily: AppStrings.sfProDisplay,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Container(
                              width: 52.46,
                              height: 44,
                              padding: const EdgeInsets.all(12),
                              clipBehavior: Clip.antiAlias,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.50,
                                      color: CommonColor.greyColor5),
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
                              child: Image.asset(ImageConstant.link2),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const TextWidget(
                        text: AppStrings.pasteYourResultsFromFlipgrid,
                        color: CommonColor.blackColor2,
                        maxLine: 1,
                        fontFamily: AppStrings.sfProDisplay,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormFieldWidget(
                      controller: _pastlink1Controller,
                      valtext: AppStrings.commonTextVal,
                      height: 40,
                      hintText: AppStrings.pasteYourLinkHere,
                      hintTextColor: CommonColor.blackColor1,
                      readOnly: false,
                      maxLine: 1,
                      keyType: TextInputType.text,
                      wordLimit: 100,
                      fontFamily: AppStrings.inter,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      onChanged: (value) {},
                      prefixIcon: Image.asset(ImageConstant.link1),
                      // suffixIcon: const Icon(
                      //   Icons.help_outline,
                      //   color: Colors.grey,
                      //   size: 16,
                      // ),
                      // onSuffixTap: () {
                      //   setState(() {
                      //     /// hintUsernameHelperText = !hintUsernameHelperText;
                      //   });
                      // },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const TextWidget(
                        text: AppStrings.pleaseEnsureFlipgridOnly,
                        color: CommonColor.blackColor1,
                        maxLine: 2,
                        fontFamily: AppStrings.inter,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: 109,
                      height: 44,
                      alignment: Alignment.center,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: CommonColor.blueColor1,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: CommonColor.blueColor1),
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
                      child: const TextWidget(
                          text: AppStrings.submit,
                          color: CommonColor.whiteColor,
                          maxLine: 1,
                          fontFamily: AppStrings.inter,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: SizeConfig.screenWidth,
                      height: 1,
                      color: CommonColor.greyColor18,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              alignment: Alignment.center,
                              decoration: const ShapeDecoration(
                                color: CommonColor.whiteColor,
                                shape: CircleBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x33000000),
                                    blurRadius: 3.75,
                                    offset: Offset(0, 1.50),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child:
                                  Image.asset(ImageConstant.clipboardDownload),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const TextWidget(
                                text: "02",
                                color: CommonColor.greyColor11,
                                maxLine: 1,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: AppStrings.step02,
                                color: CommonColor.greyColor12,
                                maxLine: 1,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                            SizedBox(
                              height: 7,
                            ),
                            TextWidget(
                                text: AppStrings.submitYourProjectPortfolioLink,
                                color: CommonColor.blackColor1,
                                maxLine: 2,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ],
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormFieldWidget(
                      controller: _pastlink2Controller,
                      valtext: AppStrings.commonTextVal,
                      height: 40,
                      hintText: "www.github.io/myportfolio",
                      readOnly: false,
                      maxLine: 1,
                      keyType: TextInputType.text,
                      wordLimit: 100,
                      fontFamily: AppStrings.inter,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      onChanged: (value) {
                        setState(() {
                          _pastlink2Text = value;
                        });
                      },
                      prefixIcon: Image.asset(
                        ImageConstant.link1,
                        color: CommonColor.hintTextColor,
                      ),
                      suffixIcon: const Icon(
                        Icons.help_outline,
                        color: CommonColor.greyColor19,
                        size: 18,
                      ),
                      onSuffixTap: () {
                        setState(() {
                          /// hintUsernameHelperText = !hintUsernameHelperText;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const TextWidget(
                        text: AppStrings.pleaseEnterValidGithubURLProceed,
                        color: CommonColor.greyColor20,
                        maxLine: 2,
                        fontFamily: AppStrings.inter,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_pastlink2Text!.isNotEmpty) {
                          setState(() {
                            _activeRequistForInterview = true;
                          });
                        }
                      },
                      child: Container(
                        width: 109,
                        height: 44,
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: _pastlink2Text!.isNotEmpty
                              ? CommonColor.blueColor1
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: CommonColor.borderColor1),
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
                            text: AppStrings.saveURL,
                            color: _pastlink2Text!.isNotEmpty
                                ? CommonColor.whiteColor
                                : CommonColor.greyColor5,
                            maxLine: 1,
                            fontFamily: AppStrings.inter,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: SizeConfig.screenWidth,
                      height: 1,
                      color: CommonColor.greyColor18,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              alignment: Alignment.center,
                              decoration: const ShapeDecoration(
                                color: CommonColor.whiteColor,
                                shape: CircleBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x33000000),
                                    blurRadius: 3.75,
                                    offset: Offset(0, 1.50),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Image.asset(ImageConstant.userPlus),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const TextWidget(
                                text: "03",
                                color: CommonColor.greyColor11,
                                maxLine: 1,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: AppStrings.step03,
                                color: CommonColor.greyColor12,
                                maxLine: 1,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                            SizedBox(
                              height: 7,
                            ),
                            TextWidget(
                                text: "${AppStrings.requestForInterview}:",
                                color: CommonColor.blackColor1,
                                maxLine: 2,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ],
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        //if (_activeRequistForInterview) {
                          requestForInterviewBottomSheet();
                       // }
                      },
                      child: Container(
                        width: SizeConfig.screenWidth,
                        height: 60,
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: CommonColor.borderColor1),
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
                              ImageConstant.userPlus,
                              color: _activeRequistForInterview
                                  ? CommonColor.blackColor4
                                  : CommonColor.textFieldBorderColor,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            TextWidget(
                                text: AppStrings.requestForInterview,
                                color: _activeRequistForInterview
                                    ? CommonColor.blackColor4
                                    : CommonColor.greyColor5,
                                maxLine: 1,
                                fontFamily: AppStrings.inter,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ));
  }

  Future<bool> requestForInterviewBottomSheet() async {
    return await showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            useRootNavigator: true,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Container(
                      height: SizeConfig.screenHeight * 0.85,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 100,
                            offset: Offset(0, 4),
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 15, bottom: 15),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 90,
                                height: 2,
                                color: CommonColor.greyColor18,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const TextWidget(
                                  text: AppStrings.requestForInterview,
                                  color: CommonColor.blackColor1,
                                  maxLine: 1,
                                  fontFamily: AppStrings.aeonikTRIAL,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Course:',
                                      style: TextStyle(
                                        color: CommonColor.greyColor6,
                                        fontSize: 16,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          ' React Native IOS and Android App Development for Beginners(WKM025)\n',
                                      style: TextStyle(
                                        color: CommonColor.greyColor6,
                                        fontSize: 16,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const TextWidget(
                                      text: AppStrings.chooseDate,
                                      color: CommonColor.blackColor4,
                                      maxLine: 1,
                                      fontFamily: AppStrings.inter,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  TextDateFieldWidget(
                                      controller: _chooseDateController,
                                      valtext: AppStrings.commonTextVal,
                                      height: 40,
                                      hintText: "16th May , 2023",
                                      readOnly: false,
                                      maxLine: 1,
                                      keyType: TextInputType.text,
                                      wordLimit: 100,
                                      fontFamily: AppStrings.inter,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      onChanged: (value) {
                                        setState(() {
                                          _pastlink2Text = value;
                                        });
                                      },
                                      prefixIcon: const Icon(
                                        Icons.mail_outline_outlined,
                                        color: CommonColor.hintTextColor,
                                      )),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const TextWidget(
                                      text: AppStrings.preferredTimeSlotA,
                                      color: CommonColor.blackColor4,
                                      maxLine: 1,
                                      fontFamily: AppStrings.inter,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  TextTimeFieldWidget(
                                    controller: _timeSlotAController,
                                    valtext: AppStrings.commonTextVal,
                                    height: 40,
                                    hintText: "9:00 AM",
                                    readOnly: false,
                                    maxLine: 1,
                                    keyType: TextInputType.text,
                                    wordLimit: 100,
                                    fontFamily: AppStrings.inter,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    onChanged: (value) {
                                      setState(() {
                                        _pastlink2Text = value;
                                      });
                                    },
                                    suffixIcon: const SizedBox(),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const TextWidget(
                                      text: AppStrings.preferredTimeSlotB,
                                      color: CommonColor.blackColor4,
                                      maxLine: 1,
                                      fontFamily: AppStrings.inter,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  TextTimeFieldWidget(
                                    controller: _timeSlotBController,
                                    valtext: AppStrings.commonTextVal,
                                    height: 40,
                                    hintText: "10:00 AM",
                                    readOnly: false,
                                    maxLine: 1,
                                    keyType: TextInputType.text,
                                    wordLimit: 100,
                                    fontFamily: AppStrings.inter,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    onChanged: (value) {
                                      setState(() {
                                        _pastlink2Text = value;
                                      });
                                    },
                                    suffixIcon: const SizedBox(),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // if (_chooseDateController.text.isEmpty ||
                                  //     _timeSlotAController.text.isEmpty ||
                                  //     _timeSlotBController.text.isEmpty) {
                                  //   Util.displayToast(
                                  //       context,
                                  //       AppStrings.plzFillAllFields,
                                  //       CommonColor.redColors);
                                  // } else {
                                  Navigator.pop(context);
                                  requestSubmittedBottomSheet();
                                  //}
                                },
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  height: 60,
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: CommonColor.blueColor1,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: CommonColor.blueColor1),
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
                                  child: const TextWidget(
                                      text: AppStrings.requestForInterview,
                                      color: CommonColor.whiteColor,
                                      maxLine: 1,
                                      fontFamily: AppStrings.inter,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  height: 60,
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: CommonColor.greyColor5),
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
                                  child: const TextWidget(
                                      text: AppStrings.cancel,
                                      color: CommonColor.blackColor4,
                                      maxLine: 1,
                                      fontFamily: AppStrings.inter,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ));
                }),
              );
            }) ??
        false; //if showDialouge had returned null, then return false
  }

  Future<bool> requestSubmittedBottomSheet() async {
    return await showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            useRootNavigator: true,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Container(
                      height: SizeConfig.screenHeight * 0.85,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 100,
                            offset: Offset(0, 4),
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 47, left: 47, top: 15, bottom: 15),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 90,
                                height: 2,
                                color: CommonColor.greyColor18,
                              ),
                              SizedBox(
                                height: SizeConfig.screenWidth! * 0.25,
                              ),
                              Image.asset(
                                ImageConstant.requestSubmitted,
                                height: 117,
                                width: SizeConfig.screenWidth,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const TextWidget(
                                  text: AppStrings.requestSubmitted,
                                  color: CommonColor.blackColor1,
                                  maxLine: 1,
                                  fontFamily: AppStrings.aeonikTRIAL,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24),
                              const SizedBox(
                                height: 40,
                              ),
                              const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '26th May 2023',
                                      style: TextStyle(
                                        color: CommonColor.blackColor1,
                                        fontSize: 18,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' at ',
                                      style: TextStyle(
                                        color: CommonColor.blackColor1,
                                        fontSize: 18,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '9:00 AM ',
                                      style: TextStyle(
                                        color: CommonColor.blackColor1,
                                        fontSize: 18,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'or',
                                      style: TextStyle(
                                        color: CommonColor.blackColor1,
                                        fontSize: 18,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' 10:00 AM',
                                      style: TextStyle(
                                        color: CommonColor.blackColor1,
                                        fontSize: 18,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              const TextWidget(
                                  text: AppStrings.wishYouAllTheBest,
                                  color: CommonColor.blackColor2,
                                  maxLine: 1,
                                  fontFamily: AppStrings.aeonikTRIAL,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                              const SizedBox(
                                height: 70,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  height: 60,
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: CommonColor.greyColor5),
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
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.check),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      TextWidget(
                                          text: AppStrings.okGotIt,
                                          color: CommonColor.blackColor4,
                                          maxLine: 1,
                                          fontFamily: AppStrings.inter,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ));
                }),
              );
            }) ??
        false; //if showDialouge had returned null, then return false
  }
}
