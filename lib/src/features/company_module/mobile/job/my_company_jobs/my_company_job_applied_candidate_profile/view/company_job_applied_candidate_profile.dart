import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CompanyJobAppliedCandidateProfile extends StatefulWidget {
  const CompanyJobAppliedCandidateProfile({super.key});

  @override
  State<CompanyJobAppliedCandidateProfile> createState() =>
      _CompanyJobAppliedCandidateProfileState();
}

class _CompanyJobAppliedCandidateProfileState
    extends State<CompanyJobAppliedCandidateProfile> {
  bool jobAppliedStatus = false;
  List<String> topSkillsList = [
    "Java",
    "Core PHP",
    "PHP",
    "Python",
    "Angular JS",
    "Dart",
  ];
  List<String> completedCoursesList = [
    "Introduction to Java (W3KBM459)",
    "Bootstrap Basics (W3KBM460)",
    "Python maps (W3KBM461)",
  ];
  int? selectedCompletedCoursesIndex;
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Candidate Profile'),
        ),
        body: Column(
          children: [
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
                            Container(
                              width: 76,
                              height: 76,
                              alignment: Alignment.center,
                              decoration: const ShapeDecoration(
                                color: CommonColor.greyColor15,
                                shape: CircleBorder(),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    'https://nextivesolution.sgp1.cdn.digitaloceanspaces.com/static/not-found.jpg',
                                    cacheHeight: 129,
                                    cacheWidth: 199,
                                  )

                                  // const AppCachedNetworkImage(
                                  //   imageUrl:
                                  //       'https://nextivesolution.sgp1.cdn.digitaloceanspaces.com/static/not-found.jpg',
                                  //   cachedHeight: 129,
                                  //   cachedWidth: 199,
                                  // ),
                                  ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                    textAlign: TextAlign.center,
                                    text: "widget.name",
                                    color: CommonColor.blackColor1,
                                    maxLine: 1,
                                    fontFamily: AppStrings.aeonikTRIAL,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22),
                                Icon(Icons.more_vert)
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const TextWidget(
                                text: "Senior Associate - Projects",
                                color: CommonColor.blackColor1,
                                maxLine: 1,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                            const SizedBox(
                              height: 8,
                            ),
                            const TextWidget(
                                text: "CDB-Operations",
                                color: CommonColor.greyColor6,
                                maxLine: 1,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                            const SizedBox(
                              height: 10,
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageConstant.send1,
                                    color: CommonColor.headingTextColor2,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const TextWidget(
                                      text: AppStrings.call,
                                      color: CommonColor.headingTextColor2,
                                      maxLine: 1,
                                      fontFamily: AppStrings.inter,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ],
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageConstant.send1,
                                    color: CommonColor.headingTextColor2,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const TextWidget(
                                      text: AppStrings.email,
                                      color: CommonColor.headingTextColor2,
                                      maxLine: 1,
                                      fontFamily: AppStrings.inter,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
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
                              child: const TextWidget(
                                  text: AppStrings.selectForCompanyInterview,
                                  color: CommonColor.headingTextColor2,
                                  maxLine: 1,
                                  fontFamily: AppStrings.inter,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const TextWidget(
                                text:
                                    "${AppStrings.employeeID} ${"widget.empID"}",
                                color: CommonColor.blackColor1,
                                maxLine: 1,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                            const SizedBox(
                              height: 30,
                            ),
                            const TextWidget(
                                text: AppStrings.employeeDescription,
                                color: CommonColor.blackColor1,
                                maxLine: 1,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                            const SizedBox(
                              height: 8,
                            ),
                            const TextWidget(
                                text:
                                    "Simon is a highly skilled Java front-end engineer, currently making valuable contributions as a key member of an esteemed IT company. With a passion for technology and a deep understanding of Java programming, Simon has established himself as a proficient developer, capable of delivering exceptional user experiences through cutting-edge front-end solutions.",
                                color: CommonColor.greyColor6,
                                maxLine: 100,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            const SizedBox(
                              height: 30,
                            ),
                            const TextWidget(
                                text: AppStrings.topSkills,
                                color: CommonColor.blackColor1,
                                maxLine: 1,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                            const SizedBox(
                              height: 15,
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 3.0,
                              runSpacing: 8.0,
                              children: [
                                for (int i = 0; i < topSkillsList.length; i++)
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
                                    child: TextWidget(
                                        textAlign: TextAlign.center,
                                        text: topSkillsList[i],
                                        color: CommonColor.greyColor11,
                                        maxLine: 1,
                                        fontFamily: AppStrings.inter,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const TextWidget(
                                text: AppStrings.completedCourses,
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
                              itemCount: completedCoursesList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCompletedCoursesIndex = index;
                                    });
                                  },
                                  child: Container(
                                    width: SizeConfig.screenWidth,
                                    height: 85,
                                    decoration: ShapeDecoration(
                                      color:
                                          selectedCompletedCoursesIndex != null
                                              ? selectedCompletedCoursesIndex ==
                                                      index
                                                  ? CommonColor.greyColor9
                                                  : Colors.white
                                              : CommonColor.whiteColor,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 0.50,
                                            color: selectedCompletedCoursesIndex !=
                                                    null
                                                ? selectedCompletedCoursesIndex ==
                                                        index
                                                    ? CommonColor.blueColor2
                                                    : CommonColor.greyColor18
                                                : CommonColor.greyColor18),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      shadows: const [
                                        BoxShadow(
                                          color: Color(0x0C000000),
                                          blurRadius: 20,
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 22,
                                          bottom: 22),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 36,
                                            height: 36,
                                            alignment: Alignment.center,
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
                                            child: const Icon(
                                              Icons.play_arrow_outlined,
                                              color:
                                                  CommonColor.headingTextColor1,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextWidget(
                                                  text: completedCoursesList[
                                                      index],
                                                  color:
                                                      CommonColor.greyColor11,
                                                  maxLine: 1,
                                                  fontFamily:
                                                      AppStrings.sfProDisplay,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              const TextWidget(
                                                  text: '9 Mins 80 sec',
                                                  color:
                                                      CommonColor.greyColor11,
                                                  maxLine: 1,
                                                  fontFamily:
                                                      AppStrings.sfProDisplay,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.more_vert,
                                            color:
                                                CommonColor.headingTextColor1,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 15,
                                );
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const TextWidget(
                                text: AppStrings.evaluations,
                                color: CommonColor.blackColor1,
                                maxLine: 1,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const TextWidget(
                                        text: AppStrings.testYourSkills,
                                        color: CommonColor.blueColor1,
                                        maxLine: 1,
                                        fontFamily: AppStrings.inter,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(
                                      ImageConstant.link2,
                                      color: CommonColor.blueColor1,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const TextWidget(
                                        text: AppStrings.projectLink,
                                        color: CommonColor.blueColor1,
                                        maxLine: 1,
                                        fontFamily: AppStrings.inter,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(
                                      ImageConstant.link2,
                                      color: CommonColor.blueColor1,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
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
                                      colors: [
                                        Colors.black.withOpacity(0),
                                        Colors.black
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const TextWidget(
                                text: 'Resume of Sara',
                                color: CommonColor.greyColor11,
                                maxLine: 2,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                            const SizedBox(
                              height: 3,
                            ),
                            const TextWidget(
                                text: 'Last updated 31st May at 9:15',
                                color: CommonColor.greyColor11,
                                maxLine: 2,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                            const SizedBox(
                              height: 8,
                            ),
                            const TextWidget(
                                text: '146 KB',
                                color: CommonColor.greyColor11,
                                maxLine: 1,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                            const SizedBox(
                              height: 60,
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
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
