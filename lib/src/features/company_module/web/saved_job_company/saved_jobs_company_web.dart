import 'package:all_in_one/src/features/company_module/mobile/company_job/saved_job_company/save_job_detail_company_mobile.dart';
import 'package:all_in_one/src/features/company_module/web/manage_and_add_courses_employees/company_employee_list_web.dart';
import 'package:all_in_one/src/features/company_module/web/my_company_jobs/my_company_job_web.dart';
import 'package:all_in_one/src/features/company_module/web/payment_and_invoice/company_payment_and_invoice_web.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/mobile/student_app_bar.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/core/widgets/web/side_nav_bar_company.dart';
import 'package:flutter/material.dart';

class SavedJobsCompanyListPageWeb extends StatefulWidget {
  const SavedJobsCompanyListPageWeb({
    super.key,
  });

  @override
  State<SavedJobsCompanyListPageWeb> createState() =>
      _SavedJobsCompanyListPageWebState();
}

class _SavedJobsCompanyListPageWebState
    extends State<SavedJobsCompanyListPageWeb> with TickerProviderStateMixin {
  late final TabController _tabController;
  int selectedIndex = 0;
  List<String> jobListItem = [
    AppStrings.savedJobs,
    AppStrings.ourJobs,
    AppStrings.otherJobs,
    AppStrings.appliedJobs
  ];
  List<String> listTitles = [
    "Bootstrap designer (TCS)",
    "System Designer",
    "UIUX Designer",
  ];
  List<String> listSubTitles = [
    "Rishikesh Technology",
    "Tata Consultancy Services",
    "Kinetic solutions",
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void didChangeDependencies() {
    // Future.delayed(const Duration(milliseconds: 1000), () {
    //   jobsBottomSheet();
    // });
    super.didChangeDependencies();
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
    SizeConfig().init(context);
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
            body: Row(
              children: [
                SideNavBarCompany(
                  jobDropdownOpen: true,
                  screenLarge: SizeConfig.screenWidth! > 700 ? true : false,
                  onChangedjobDropdown: (val) {
                    setState(() {
                      //  jobDropdownOpen = !jobDropdownOpen;
                    });
                  },
                  onChangedNavigation: (val) {
                    // 555
                    if (val == AppStrings.savedJobs) {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           const SavedJobsCompanyListPageWeb()),
                      // );
                    } else if (val == AppStrings.otherJobs ||
                        val == AppStrings.ourJobs ||
                        val == AppStrings.appliedJobs) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MyCompanyJobListPageWeb()),
                      );
                    } else if (val == AppStrings.employees) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CompanyEmployeeListPageWeb()),
                      );
                    } else if (val == AppStrings.payments) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CompanyPaymentAndInvoicePageWeb()),
                      );
                    }
                  },
                ),
                Expanded(
                  child: Column(
                    children: [
                      StudentAppBarMobile(
                        titel1: AppStrings.companyName,
                        title2: AppStrings.companyTaglineHere,
                        isBack: false,
                        searchHintText: AppStrings.searchForJobs,
                        onSearchListener: (value) {},
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            color: CommonColor.greyColor15,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 18,
                                right: 18,
                                top: 30,
                                bottom: 60,
                              ),
                              child: DefaultTabController(
                                initialIndex: _tabController.index,
                                length: 3,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        child: TabBar(
                                          controller: _tabController,
                                          indicatorColor:
                                              CommonColor.blueColor1,
                                          isScrollable: true,
                                          onTap: (index) {
                                            setState(() {
                                              _tabController.index = index;
                                            });
                                          },
                                          tabs: <Widget>[
                                            Tab(
                                              child: TextWidget(
                                                  textAlign: TextAlign.center,
                                                  text:
                                                      AppStrings.myCompanyJobs,
                                                  color: _tabController.index ==
                                                          0
                                                      ? CommonColor.blueColor1
                                                      : CommonColor.blackColor2,
                                                  maxLine: 1,
                                                  fontFamily: AppStrings.inter,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14),
                                            ),
                                            // Tab(
                                            //   child: TextWidget(
                                            //       textAlign: TextAlign.center,
                                            //       text: AppStrings.savedJobs,
                                            //       color: _tabController.index == 1
                                            //           ? CommonColor.blueColor1
                                            //           : CommonColor.blackColor2,
                                            //       maxLine: 1,
                                            //       fontFamily: AppStrings.inter,
                                            //       fontWeight: FontWeight.w500,
                                            //       fontSize: 14),
                                            // ),
                                            // Tab(
                                            //   child: TextWidget(
                                            //       textAlign: TextAlign.center,
                                            //       text: AppStrings.appliedJobs,
                                            //       color: _tabController.index == 2
                                            //           ? CommonColor.blueColor1
                                            //           : CommonColor.blackColor2,
                                            //       maxLine: 1,
                                            //       fontFamily: AppStrings.inter,
                                            //       fontWeight: FontWeight.w500,
                                            //       fontSize: 14),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      if (_tabController.index == 0)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ListView.separated(
                                              itemCount: listTitles.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const SaveJobDetailCompanyMobilePage()),
                                                    );
                                                  },
                                                  child: Container(
                                                    //height: 262,
                                                    width:
                                                        SizeConfig.screenWidth,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 26,
                                                              top: 29,
                                                              right: 26,
                                                              bottom: 20),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          TextWidget(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              text: listTitles[
                                                                  index],
                                                              color: CommonColor
                                                                  .greyColor4,
                                                              maxLine: 1,
                                                              fontFamily: AppStrings
                                                                  .sfProDisplay,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 18),
                                                          const SizedBox(
                                                            height: 7,
                                                          ),
                                                          TextWidget(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              text:
                                                                  listSubTitles[
                                                                      index],
                                                              color: CommonColor
                                                                  .greyColor12,
                                                              maxLine: 1,
                                                              fontFamily: AppStrings
                                                                  .sfProDisplay,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14),
                                                          const SizedBox(
                                                            height: 18,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                ImageConstant
                                                                    .jobLogo,
                                                                color: CommonColor
                                                                    .blackColor1,
                                                              ),
                                                              const SizedBox(
                                                                width: 15,
                                                              ),
                                                              const TextWidget(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  text:
                                                                      "2-6 Yrs",
                                                                  color: CommonColor
                                                                      .greyColor4,
                                                                  maxLine: 1,
                                                                  fontFamily:
                                                                      AppStrings
                                                                          .sfProDisplay,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                ImageConstant
                                                                    .dollarCircle,
                                                                color: CommonColor
                                                                    .blackColor1,
                                                              ),
                                                              const SizedBox(
                                                                width: 15,
                                                              ),
                                                              const TextWidget(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  text:
                                                                      "75,000/yr.",
                                                                  color: CommonColor
                                                                      .greyColor4,
                                                                  maxLine: 1,
                                                                  fontFamily:
                                                                      AppStrings
                                                                          .sfProDisplay,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                ImageConstant
                                                                    .send2,
                                                                color: CommonColor
                                                                    .blackColor1,
                                                              ),
                                                              const SizedBox(
                                                                width: 15,
                                                              ),
                                                              const TextWidget(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  text:
                                                                      "Bay area, Texas",
                                                                  color: CommonColor
                                                                      .greyColor4,
                                                                  maxLine: 1,
                                                                  fontFamily:
                                                                      AppStrings
                                                                          .sfProDisplay,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          const Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .insert_drive_file_outlined,
                                                                color: CommonColor
                                                                    .blackColor1,
                                                                size: 18,
                                                              ),
                                                              SizedBox(
                                                                width: 15,
                                                              ),
                                                              Expanded(
                                                                child: TextWidget(
                                                                    text:
                                                                        "Excellent responsive designing & development skills, creating UI/UX for Mobile & Web-Based applications. Working knowledge of the following technologies: HTML, CSS, iOS, Android, JavaScript and jQuery",
                                                                    color: CommonColor
                                                                        .greyColor12,
                                                                    maxLine: 2,
                                                                    fontFamily:
                                                                        AppStrings
                                                                            .sfProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          const Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              TextWidget(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  text:
                                                                      "Posted 3 days ago",
                                                                  color: CommonColor
                                                                      .greyColor12,
                                                                  maxLine: 1,
                                                                  fontFamily:
                                                                      AppStrings
                                                                          .sfProDisplay,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 12),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .bookmark_border_outlined,
                                                                    color: CommonColor
                                                                        .blackColor1,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  TextWidget(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      text: AppStrings
                                                                          .save,
                                                                      color: CommonColor
                                                                          .greyColor4,
                                                                      maxLine:
                                                                          1,
                                                                      fontFamily:
                                                                          AppStrings
                                                                              .sfProDisplay,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          12),
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return const SizedBox(
                                                  height: 10,
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      /* if (_tabController.index == 1)
                                        ListView.separated(
                                          itemCount: 2,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SaveOrApplyJobStudentMobilePage()),
                                                );
                                              },
                                              child: Container(
                                                height: 262,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 26,
                                                      top: 29,
                                                      right: 26,
                                                      bottom: 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      const TextWidget(
                                                          textAlign: TextAlign.center,
                                                          text: "Core Java Expert",
                                                          color:
                                                              CommonColor.greyColor4,
                                                          maxLine: 1,
                                                          fontFamily:
                                                              AppStrings.sfProDisplay,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 18),
                                                      const SizedBox(
                                                        height: 7,
                                                      ),
                                                      const TextWidget(
                                                          textAlign: TextAlign.center,
                                                          text:
                                                              "Glan Management Consultancy",
                                                          color:
                                                              CommonColor.greyColor12,
                                                          maxLine: 1,
                                                          fontFamily:
                                                              AppStrings.sfProDisplay,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 14),
                                                      const SizedBox(
                                                        height: 18,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            ImageConstant
                                                                .dollarCircle,
                                                            color: CommonColor
                                                                .blackColor1,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          const TextWidget(
                                                              textAlign:
                                                                  TextAlign.center,
                                                              text: "75,000/yr.",
                                                              color: CommonColor
                                                                  .greyColor4,
                                                              maxLine: 1,
                                                              fontFamily: AppStrings
                                                                  .sfProDisplay,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontSize: 12),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 6,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            ImageConstant
                                                                .dollarCircle,
                                                            color: CommonColor
                                                                .blackColor1,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          const TextWidget(
                                                              textAlign:
                                                                  TextAlign.center,
                                                              text: "75,000/yr.",
                                                              color: CommonColor
                                                                  .greyColor4,
                                                              maxLine: 1,
                                                              fontFamily: AppStrings
                                                                  .sfProDisplay,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontSize: 12),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 6,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            ImageConstant
                                                                .dollarCircle,
                                                            color: CommonColor
                                                                .blackColor1,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          const TextWidget(
                                                              textAlign:
                                                                  TextAlign.center,
                                                              text: "75,000/yr.",
                                                              color: CommonColor
                                                                  .greyColor4,
                                                              maxLine: 1,
                                                              fontFamily: AppStrings
                                                                  .sfProDisplay,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontSize: 12),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 18,
                                                      ),
                                                      const TextWidget(
                                                          textAlign: TextAlign.start,
                                                          text:
                                                              "Excellent responsive designing & development skills, creating UI/UX for Mobile & Web-Based applications. Working knowledge of the following technologies: HTML, CSS, iOS, Android, JavaScript and jQuery",
                                                          color:
                                                              CommonColor.greyColor12,
                                                          maxLine: 2,
                                                          fontFamily:
                                                              AppStrings.sfProDisplay,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 12),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const TextWidget(
                                                              textAlign:
                                                                  TextAlign.start,
                                                              text:
                                                                  "Posted 3 days ago",
                                                              color: CommonColor
                                                                  .greyColor12,
                                                              maxLine: 1,
                                                              fontFamily: AppStrings
                                                                  .sfProDisplay,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              fontSize: 12),
                                                          Row(
                                                            children: const [
                                                              Icon(
                                                                Icons.clear,
                                                                size: 16,
                                                                color: CommonColor
                                                                    .blackColor1,
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              TextWidget(
                                                                  textAlign:
                                                                      TextAlign.start,
                                                                  text: "Remove",
                                                                  color: CommonColor
                                                                      .greyColor4,
                                                                  maxLine: 1,
                                                                  fontFamily: AppStrings
                                                                      .sfProDisplay,
                                                                  fontWeight:
                                                                      FontWeight.w400,
                                                                  fontSize: 12),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(
                                              height: 10,
                                            );
                                          },
                                        ),
                                      if (_tabController.index == 2)
                                        ListView.separated(
                                          itemCount: 1,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SaveOrApplyJobStudentMobilePage()),
                                                );
                                              },
                                              child: Container(
                                                height: 262,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 26,
                                                      top: 29,
                                                      right: 26,
                                                      bottom: 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      const TextWidget(
                                                          textAlign: TextAlign.center,
                                                          text: "Core Java Expert",
                                                          color:
                                                              CommonColor.greyColor4,
                                                          maxLine: 1,
                                                          fontFamily:
                                                              AppStrings.sfProDisplay,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 18),
                                                      const SizedBox(
                                                        height: 7,
                                                      ),
                                                      const TextWidget(
                                                          textAlign: TextAlign.center,
                                                          text:
                                                              "Glan Management Consultancy",
                                                          color:
                                                              CommonColor.greyColor12,
                                                          maxLine: 1,
                                                          fontFamily:
                                                              AppStrings.sfProDisplay,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 14),
                                                      const SizedBox(
                                                        height: 18,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            ImageConstant
                                                                .dollarCircle,
                                                            color: CommonColor
                                                                .blackColor1,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          const TextWidget(
                                                              textAlign:
                                                                  TextAlign.center,
                                                              text: "75,000/yr.",
                                                              color: CommonColor
                                                                  .greyColor4,
                                                              maxLine: 1,
                                                              fontFamily: AppStrings
                                                                  .sfProDisplay,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontSize: 12),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 6,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            ImageConstant
                                                                .dollarCircle,
                                                            color: CommonColor
                                                                .blackColor1,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          const TextWidget(
                                                              textAlign:
                                                                  TextAlign.center,
                                                              text: "75,000/yr.",
                                                              color: CommonColor
                                                                  .greyColor4,
                                                              maxLine: 1,
                                                              fontFamily: AppStrings
                                                                  .sfProDisplay,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontSize: 12),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 6,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            ImageConstant
                                                                .dollarCircle,
                                                            color: CommonColor
                                                                .blackColor1,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          const TextWidget(
                                                              textAlign:
                                                                  TextAlign.center,
                                                              text: "75,000/yr.",
                                                              color: CommonColor
                                                                  .greyColor4,
                                                              maxLine: 1,
                                                              fontFamily: AppStrings
                                                                  .sfProDisplay,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontSize: 12),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 18,
                                                      ),
                                                      const TextWidget(
                                                          textAlign: TextAlign.start,
                                                          text:
                                                              "Excellent responsive designing & development skills, creating UI/UX for Mobile & Web-Based applications. Working knowledge of the following technologies: HTML, CSS, iOS, Android, JavaScript and jQuery",
                                                          color:
                                                              CommonColor.greyColor12,
                                                          maxLine: 2,
                                                          fontFamily:
                                                              AppStrings.sfProDisplay,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 12),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const TextWidget(
                                                              textAlign:
                                                                  TextAlign.start,
                                                              text:
                                                                  "Posted 3 days ago",
                                                              color: CommonColor
                                                                  .greyColor12,
                                                              maxLine: 1,
                                                              fontFamily: AppStrings
                                                                  .sfProDisplay,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              fontSize: 12),
                                                          Row(
                                                            children: const [
                                                              Icon(
                                                                Icons.bookmark_border,
                                                                size: 16,
                                                                color: CommonColor
                                                                    .blackColor1,
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              TextWidget(
                                                                  textAlign:
                                                                      TextAlign.start,
                                                                  text: "Save",
                                                                  color: CommonColor
                                                                      .greyColor4,
                                                                  maxLine: 1,
                                                                  fontFamily: AppStrings
                                                                      .sfProDisplay,
                                                                  fontWeight:
                                                                      FontWeight.w400,
                                                                  fontSize: 12),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(
                                              height: 10,
                                            );
                                          },
                                        ),
                                     */
                                      /*   const SizedBox(
                                        height: 21,
                                      ),
                                      Stack(
                                        fit: StackFit.loose,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              ImageConstant.rectangle43,
                                              fit: BoxFit.fill,
                                              width: SizeConfig.screenWidth,
                                              height: 243,
                                            ),
                                          ),
                                          const Positioned(
                                            top: 101,
                                            left: 26,
                                            right: 26,
                                            child: TextWidget(
                                                textAlign: TextAlign.start,
                                                text:
                                                    "Apple is hiring for motion designers",
                                                color: CommonColor.whiteColor,
                                                maxLine: 2,
                                                fontFamily: AppStrings.sfProDisplay,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 26),
                                          ),
                                          Positioned(
                                              bottom: 26,
                                              left: 26,
                                              child: Container(
                                                width: 111,
                                                height: 36,
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 14, vertical: 8),
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: CommonColor.blueColor1,
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                      width: 0.50,
                                                      color: CommonColor.blueColor1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(8),
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
                                                    textAlign: TextAlign.start,
                                                    text: AppStrings.applyNow,
                                                    color: CommonColor.whiteColor,
                                                    maxLine: 1,
                                                    fontFamily: AppStrings.inter,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14),
                                              ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 32,
                                      ),
                                      const TextWidget(
                                          textAlign: TextAlign.start,
                                          text: AppStrings.helpfulLinks,
                                          color: CommonColor.blackColor1,
                                          maxLine: 1,
                                          fontFamily: AppStrings.sfProDisplay,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        width: SizeConfig.screenWidth,
                                        decoration: const ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 0.50,
                                              color: CommonColor.greyColor14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 22,
                                      ),
                                      const TextWidget(
                                          textAlign: TextAlign.start,
                                          text: AppStrings.editProfile,
                                          color: CommonColor.blackColor1,
                                          maxLine: 1,
                                          fontFamily: AppStrings.sfProDisplay,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                      const SizedBox(
                                        height: 11,
                                      ),
                                      const TextWidget(
                                          textAlign: TextAlign.start,
                                          text: AppStrings.savedJobs,
                                          color: CommonColor.blackColor1,
                                          maxLine: 1,
                                          fontFamily: AppStrings.sfProDisplay,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      const TextWidget(
                                          textAlign: TextAlign.start,
                                          text: AppStrings.myResume,
                                          color: CommonColor.blackColor1,
                                          maxLine: 1,
                                          fontFamily: AppStrings.sfProDisplay,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                          */
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }

  Future<bool> jobsBottomSheet() async {
    return await showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            useRootNavigator: false,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Container(
                      height: SizeConfig.screenHeight * 0.5,
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: jobListItem.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedIndex = index;
                                                });
                                              },
                                              child: Container(
                                                width: SizeConfig.screenWidth,
                                                height: 59,
                                                padding: const EdgeInsets.only(
                                                  top: 20,
                                                  left: 10,
                                                  right: 20,
                                                  bottom: 20,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: selectedIndex == index
                                                      ? CommonColor.blueColor1
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color:
                                                          selectedIndex == index
                                                              ? CommonColor
                                                                  .blueColor1
                                                              : CommonColor
                                                                  .greyColor17),
                                                ),
                                                child: TextWidget(
                                                    text: jobListItem[index],
                                                    color: selectedIndex ==
                                                            index
                                                        ? CommonColor.whiteColor
                                                        : CommonColor
                                                            .greyColor11,
                                                    maxLine: 1,
                                                    fontFamily:
                                                        AppStrings.sfProDisplay,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16),
                                              ),
                                            );
                                          }),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ]),
                          )));
                }),
              );
            }) ??
        false; //if showDialouge had returned null, then return false
  }
}
