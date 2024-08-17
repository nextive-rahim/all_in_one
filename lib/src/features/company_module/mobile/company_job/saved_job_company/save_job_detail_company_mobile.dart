import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/mobile/student_app_bar.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveJobDetailCompanyMobilePage extends StatefulWidget {
  const SaveJobDetailCompanyMobilePage({
    super.key,
  });

  @override
  State<SaveJobDetailCompanyMobilePage> createState() =>
      _SaveJobDetailCompanyMobilePageState();
}

class _SaveJobDetailCompanyMobilePageState
    extends State<SaveJobDetailCompanyMobilePage> {
  bool jobAppliedStatus = false;

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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Future _fetchDummyData() async {
  //   if (mounted) {
  //     setState(() {
  //       _shouldDisplayLoader = true;
  //     });
  //   }
  //   Map<String, String> header = {};
  //   Map<String, dynamic> body = {};
  //   final value = await _networkUtility.makeWebServiceGetRequest(
  //       url: UrlConstant.demoUrl, header: header);
  //   var response = DemoModel.fromJson(json.decode(value));
  //   if (mounted) {
  //     setState(() {
  //       _shouldDisplayLoader = false;
  //     });
  //   }
  //   if (response != null) {
  //     if (mounted) {
  //       setState(() {
  //         _dummyModel = response;
  //       });
  //     }
  //     Util.displayToast(AppStrings.apiHitSuccesfully, context);
  //   } else {
  //     Util.displayToast(AppStrings.somethingWentWrong, context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // appBar: AppBar(
            //   backgroundColor: CommonColor.whiteColor,
            //   title: const TextWidget(
            //       text: "Welcome Back",
            //       color: CommonColor.headingTextColor1,
            //       maxLine: 1,
            //       fontFamily: AppStrings.inter,
            //       fontWeight: FontWeight.w500,
            //       fontSize: 14),
            // ),

            backgroundColor: CommonColor.greyColor1,
            body: Column(
              children: [
                StudentAppBarMobile(
                  titel1: AppStrings.recommendedJobsForYou,
                  title2: AppStrings.youSelectJobsApplyOrSaveLater,
                  isBack: true,
                  searchHintText: AppStrings.searchForCourses,
                  onSearchListener: (value) {},
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 18,
                            right: 18,
                            top: 7,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextWidget(
                                    textAlign: TextAlign.center,
                                    text: "Core Java Expert",
                                    color: CommonColor.blackColor1,
                                    maxLine: 1,
                                    fontFamily: AppStrings.aeonikTRIAL,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22),
                                const SizedBox(
                                  height: 7,
                                ),
                                const TextWidget(
                                    textAlign: TextAlign.center,
                                    text: "Glan Management Consultancy",
                                    color: CommonColor.greyColor12,
                                    maxLine: 1,
                                    fontFamily: AppStrings.sfProDisplay,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                                const SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  width: SizeConfig.screenWidth,
                                  height: 161,
                                  padding: const EdgeInsets.all(20),
                                  decoration: ShapeDecoration(
                                    //color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1.0,
                                          color: CommonColor.greyColor16),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            ImageConstant.jobLogo,
                                            width: 18,
                                            height: 18,
                                            color: CommonColor.blackColor1,
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          const TextWidget(
                                              textAlign: TextAlign.center,
                                              text: "2-6 Yrs",
                                              color: CommonColor.greyColor11,
                                              maxLine: 1,
                                              fontFamily:
                                                  AppStrings.sfProDisplay,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            ImageConstant.dollarCircle,
                                            color: CommonColor.blackColor1,
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          const TextWidget(
                                              textAlign: TextAlign.center,
                                              text: "75,000/yr.",
                                              color: CommonColor.greyColor11,
                                              maxLine: 1,
                                              fontFamily:
                                                  AppStrings.sfProDisplay,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            ImageConstant.send2,
                                            color: CommonColor.blackColor1,
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          const TextWidget(
                                              textAlign: TextAlign.center,
                                              text: "Bay area, Texas",
                                              color: CommonColor.greyColor11,
                                              maxLine: 1,
                                              fontFamily:
                                                  AppStrings.sfProDisplay,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Posted: ',
                                              style: TextStyle(
                                                color: CommonColor.greyColor6,
                                                fontSize: 14,
                                                fontFamily:
                                                    AppStrings.sfProDisplay,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '3 days ago',
                                              style: TextStyle(
                                                color: CommonColor.greyColor6,
                                                fontSize: 14,
                                                fontFamily:
                                                    AppStrings.sfProDisplay,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                jobAppliedStatus
                                    ? const SizedBox()
                                    : GestureDetector(
                                        onTap: () {
                                          jobAppliedBottomSheet().then((value) {
                                            setState(() {
                                              jobAppliedStatus = true;
                                            });
                                          });
                                        },
                                        child: Container(
                                          width: SizeConfig.screenWidth,
                                          height: 44,
                                          alignment: Alignment.center,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: CommonColor.blueColor1,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                ImageConstant.send1,
                                                color: CommonColor.whiteColor,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const TextWidget(
                                                  textAlign: TextAlign.center,
                                                  text: AppStrings.applyForJob,
                                                  color: CommonColor.whiteColor,
                                                  maxLine: 1,
                                                  fontFamily: AppStrings.inter,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ],
                                          ),
                                        ),
                                      ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  width: SizeConfig.screenWidth,
                                  height: 44,
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
                                      Icon(
                                        Icons.bookmark_border,
                                        size: 20,
                                        color: CommonColor.headingTextColor2,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      TextWidget(
                                          textAlign: TextAlign.center,
                                          text: AppStrings.savedJobs,
                                          color: CommonColor.headingTextColor2,
                                          maxLine: 1,
                                          fontFamily: AppStrings.inter,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 31,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const TextWidget(
                                        textAlign: TextAlign.center,
                                        text: "Job Description",
                                        color: CommonColor.blackColor1,
                                        maxLine: 1,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const TextWidget(
                                        textAlign: TextAlign.center,
                                        text:
                                            'About Glan Management Consultancy:',
                                        color: CommonColor.blackColor1,
                                        maxLine: 1,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w500,
                                        underline: TextDecoration.underline,
                                        fontSize: 16),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    const TextWidget(
                                        textAlign: TextAlign.start,
                                        text:
                                            "Glan Management Consultancy is a leader in process efficiency and energy conservation solutions for the process industry. Our range includes products for steam efficiency, process optimisation, and control & monitoring. Over the past 75 years, our innovative offerings have helped businesses improve their energy and process efficiency and be more environmentally responsible. Through 37 offices, 18 distribution centers and 6 manufacturing facilities, including one in the UK and one in Singapore, we serve over 8000 customers across 30 industry sectors globally.\n\nWe care about our people and our communities as much as we care about our customers' businesses. We are committed to creating a diverse environment and are proud to be an equal opportunity employer. Our community initiatives include improved healthcare, access to education, livelihood programs and women empowerment projects. Our members are encouraged to participate in these initiatives.",
                                        color: CommonColor.blackColor1,
                                        maxLine: 20,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    const TextWidget(
                                        textAlign: TextAlign.start,
                                        text: "Role Description:UI/UX designer",
                                        color: CommonColor.blackColor1,
                                        maxLine: 1,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const TextWidget(
                                        textAlign: TextAlign.start,
                                        text:
                                            "Customer Research\nData architecture design\nWireframe and Navigation design for applications\nUser interface design.\nUsability testing\nDesigning and maintaining a design system across multiple platforms",
                                        color: CommonColor.blackColor1,
                                        maxLine: 20,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                    const SizedBox(
                                      height: 31,
                                    ),
                                    const TextWidget(
                                        textAlign: TextAlign.start,
                                        text: "Educational Qualification:",
                                        color: CommonColor.blackColor1,
                                        maxLine: 1,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const TextWidget(
                                        textAlign: TextAlign.start,
                                        text:
                                            "BDes/MDes in design specialization i.e User Experience design, Interaction design or Product Design or Graphics design",
                                        color: CommonColor.blackColor1,
                                        maxLine: 20,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    const TextWidget(
                                        textAlign: TextAlign.start,
                                        text: "Key Skills:",
                                        color: CommonColor.blackColor1,
                                        maxLine: 1,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const TextWidget(
                                        textAlign: TextAlign.start,
                                        text:
                                            "Ability to distill complex process into simple and clear user interactions Ability to translate abstract idea into tangible and functional design deliverables and prototypes Excellent Visual Design skills Excellent hands on with Figma, Adobe illustrator, corelDraw.",
                                        color: CommonColor.blackColor1,
                                        maxLine: 20,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                    const SizedBox(
                                      height: 23,
                                    ),
                                    const TextWidget(
                                        textAlign: TextAlign.start,
                                        text: "Work Experience:",
                                        color: CommonColor.blackColor1,
                                        maxLine: 1,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const TextWidget(
                                        textAlign: TextAlign.start,
                                        text:
                                            "1- 4 years experience in UI/UX design. preferably designing Web apps and Mobile apps.",
                                        color: CommonColor.blackColor1,
                                        maxLine: 20,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    const TextWidget(
                                        textAlign: TextAlign.start,
                                        text: "Regards,",
                                        color: CommonColor.blackColor1,
                                        maxLine: 1,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const TextWidget(
                                        textAlign: TextAlign.start,
                                        text:
                                            "Fiza Shaikh\nSenior Talent Acquisition\n9403461067\nfshaikh@forbesmarshall.com",
                                        color: CommonColor.blackColor1,
                                        maxLine: 5,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                    const SizedBox(
                                      height: 28,
                                    ),
                                    const TextWidget(
                                        textAlign: TextAlign.start,
                                        text: "Share on social media",
                                        color: CommonColor.blackColor1,
                                        maxLine: 1,
                                        fontFamily: AppStrings.sfProDisplay,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    FittedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 44,
                                            padding: const EdgeInsets.all(10),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 0.50,
                                                    color:
                                                        CommonColor.greyColor5),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              shadows: const [
                                                BoxShadow(
                                                  color:
                                                      CommonColor.blackColor3,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 1),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30, right: 30),
                                              child: Image.asset(
                                                ImageConstant.google,
                                                width: 24,
                                                height: 24,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 44,
                                            padding: const EdgeInsets.all(10),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 0.50,
                                                    color:
                                                        CommonColor.greyColor5),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              shadows: const [
                                                BoxShadow(
                                                  color:
                                                      CommonColor.blackColor3,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 1),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30, right: 30),
                                              child: Image.asset(
                                                ImageConstant.facebook,
                                                width: 24,
                                                height: 24,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 44,
                                            padding: const EdgeInsets.all(10),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 0.50,
                                                    color:
                                                        CommonColor.greyColor5),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              shadows: const [
                                                BoxShadow(
                                                  color:
                                                      CommonColor.blackColor3,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 1),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30, right: 30),
                                              child: Image.asset(
                                                ImageConstant.apple,
                                                width: 24,
                                                height: 24,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ]),
                        ),
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
                                    fontSize: 18),
                                const SizedBox(
                                  height: 15,
                                ),
                                ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: appliedProfilesList.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 10,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes
                                              .companyJobAppliedCandidateProfile);
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
                                                text:
                                                    appliedProfilesList[index],
                                                color: CommonColor.greyColor4,
                                                maxLine: 1,
                                                fontFamily:
                                                    AppStrings.sfProDisplay,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16),
                                          ],
                                        ),
                                      );
                                    }),
                                const SizedBox(
                                  height: 40,
                                ),
                                const TextWidget(
                                    textAlign: TextAlign.center,
                                    text: AppStrings.selectedProfiles,
                                    color: CommonColor.greyColor4,
                                    maxLine: 1,
                                    fontFamily: AppStrings.sfProDisplay,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                                const SizedBox(
                                  height: 15,
                                ),
                                ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: selectedProfilesList.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
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
                                              fontFamily:
                                                  AppStrings.sfProDisplay,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),
                                        ],
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }

  Future<bool> jobAppliedBottomSheet() async {
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
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 60),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Container(
                      height: 154,
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
                            right: 17, left: 21, top: 15, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.check_circle_outline_outlined,
                                  color: CommonColor.greenColor1,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const TextWidget(
                                    text: "Job Applied",
                                    color: CommonColor.greenColor1,
                                    maxLine: 2,
                                    fontFamily: AppStrings.aeonikTRIAL,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                                const SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    padding: const EdgeInsets.all(8),
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
                                    child: Container(
                                        width: 20,
                                        height: 20,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(),
                                        child: const Icon(
                                          Icons.clear,
                                          size: 18,
                                        )),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const TextWidget(
                                text:
                                    'You have successfully applied to this job from Glan Management Consultancy',
                                color: CommonColor.blackColor1,
                                maxLine: 5,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ],
                        ),
                      ));
                }),
              );
            }) ??
        false; //if showDialouge had returned null, then return false
  }
}
