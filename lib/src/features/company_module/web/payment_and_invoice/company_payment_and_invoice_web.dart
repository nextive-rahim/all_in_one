import 'package:all_in_one/src/features/company_module/web/manage_and_add_courses_employees/company_employee_list_web.dart';
import 'package:all_in_one/src/features/company_module/web/my_company_jobs/my_company_job_web.dart';
import 'package:all_in_one/src/features/company_module/web/saved_job_company/saved_jobs_company_web.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/mobile/student_app_bar.dart';
import 'package:all_in_one/src/core/widgets/my_separator.dart';
import 'package:all_in_one/src/core/widgets/web/side_nav_bar_company.dart';
import 'package:flutter/material.dart';

class CompanyPaymentAndInvoicePageWeb extends StatefulWidget {
  const CompanyPaymentAndInvoicePageWeb({super.key});

  @override
  State<CompanyPaymentAndInvoicePageWeb> createState() =>
      _CompanyPaymentAndInvoicePageWebState();
}

class _CompanyPaymentAndInvoicePageWebState
    extends State<CompanyPaymentAndInvoicePageWeb> {
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SavedJobsCompanyListPageWeb()),
                      );
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           const CompanyPaymentAndInvoicePageWeb()),
                      // );
                    }
                  },
                ),
                Expanded(
                  child: Column(
                    children: [
                      const StudentAppBarMobile(
                        titel1: AppStrings.companyName,
                        title2: "Find and manage your interviews",
                        isBack: false,
                        searchHintText: "",
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 20, 16, 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: SizeConfig.screenWidth,
                                  height: 253,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFEBEBEB)),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          //  width: 286,
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'Total remuneration for the month of ',
                                                  style: TextStyle(
                                                    color: Color(0xFF262626),
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'SF Pro Display',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'April',
                                                  style: TextStyle(
                                                    color: Color(0xFF262626),
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'SF Pro Display',
                                                    fontWeight: FontWeight.w700,
                                                    height: 0,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' is ',
                                                  style: TextStyle(
                                                    color: Color(0xFF262626),
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'SF Pro Display',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '\$502',
                                                  style: TextStyle(
                                                    color: Color(0xFF262626),
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'SF Pro Display',
                                                    fontWeight: FontWeight.w700,
                                                    height: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 265,
                                          child: Text(
                                            'Requested to pay within first week of this month.',
                                            style: TextStyle(
                                              color: Color(0xFF585858),
                                              fontSize: 16,
                                              fontFamily: 'SF Pro Display',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        Container(
                                          width: 165,
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 10),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 1,
                                                  color: Color(0xFFEBEBEB)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            shadows: const [
                                              BoxShadow(
                                                color: Color(0x0C101828),
                                                blurRadius: 2,
                                                offset: Offset(0, 1),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                          child: const Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Pay now',
                                                style: TextStyle(
                                                  color: Color(0xFF344053),
                                                  fontSize: 14,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      'Cost breakdown for this month',
                                      style: TextStyle(
                                        color: Color(0xFF262626),
                                        fontSize: 18,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.info_outline),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: SizeConfig.screenWidth,
                                  height: 467,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFEBEBEB)),
                                      borderRadius: BorderRadius.circular(20),
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
                                    padding: const EdgeInsets.fromLTRB(
                                        22, 30, 22, 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Paying for April 2023',
                                          style: TextStyle(
                                            color: Color(0xFF262626),
                                            fontSize: 20,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 28,
                                        ),
                                        Container(
                                          width: SizeConfig.screenWidth,
                                          height: 5,
                                          decoration: const BoxDecoration(
                                              color: Color(0xFFEBEBEB)),
                                        ),
                                        const SizedBox(
                                          height: 28,
                                        ),
                                        SizedBox(
                                          width: SizeConfig.screenWidth,
                                          // height: 175,
                                          child: const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Subscription Plan',
                                                    style: TextStyle(
                                                      color: Color(0xFF363636),
                                                      fontSize: 16,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '\$432',
                                                    style: TextStyle(
                                                      color: Color(0xFF363636),
                                                      fontSize: 16,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 18,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Employee Cost',
                                                    style: TextStyle(
                                                      color: Color(0xFF363636),
                                                      fontSize: 16,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '\$60',
                                                    style: TextStyle(
                                                      color: Color(0xFF363636),
                                                      fontSize: 16,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'TAX',
                                                    style: TextStyle(
                                                      color: Color(0xFF363636),
                                                      fontSize: 16,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '\$10',
                                                    style: TextStyle(
                                                      color: Color(0xFF363636),
                                                      fontSize: 16,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              MySeparator(
                                                  color:
                                                      CommonColor.greyColor4),
                                              SizedBox(
                                                height: 18,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Total Cost',
                                                    style: TextStyle(
                                                      color: Color(0xFF363636),
                                                      fontSize: 16,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '\$502',
                                                    style: TextStyle(
                                                      color: Color(0xFF363636),
                                                      fontSize: 16,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        Center(
                                          child: Container(
                                            width: 165,
                                            height: 40,
                                            alignment: Alignment.center,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 1,
                                                    color: Color(0xFFCFD4DC)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              shadows: const [
                                                BoxShadow(
                                                  color: Color(0x0C101828),
                                                  blurRadius: 2,
                                                  offset: Offset(0, 1),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: const Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Pay now',
                                                  style: TextStyle(
                                                    color: Color(0xFF344053),
                                                    fontSize: 14,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        const Center(
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Issue with payment?',
                                                  style: TextStyle(
                                                    color: Color(0xFF585858),
                                                    fontSize: 12,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.14,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' ',
                                                  style: TextStyle(
                                                    color: Color(0xFF585858),
                                                    fontSize: 12,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    //  textDecoration: TextDecoration.underline,
                                                    height: 0.14,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Request Assistance',
                                                  style: TextStyle(
                                                    color: Color(0xFF585858),
                                                    fontSize: 12,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w700,
                                                    //   textDecoration: TextDecoration.underline,
                                                    height: 0.14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                const Text(
                                  '3 Associated Employees',
                                  style: TextStyle(
                                    color: Color(0xFF262626),
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                Container(
                                  width: 165,
                                  height: 36,
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFCFD4DC)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x0C101828),
                                        blurRadius: 2,
                                        offset: Offset(0, 1),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 21,
                                      ),
                                      // SizedBox(
                                      //   width: 12,
                                      // ),
                                      Text(
                                        'Add new employee',
                                        style: TextStyle(
                                          color: Color(0xFF344053),
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: ((context, index) {
                                    return Container(
                                        width: SizeConfig.screenWidth,
                                        height: 126,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          shadows: const [
                                            BoxShadow(
                                              color: Color(0x19000000),
                                              blurRadius: 20,
                                              offset: Offset(0, 4),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 21, 30, 21),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 52,
                                                height: 52,
                                                alignment: Alignment.center,
                                                decoration:
                                                    const ShapeDecoration(
                                                  color: Color(0xFFECECEC),
                                                  shape: CircleBorder(),
                                                ),
                                                child: const Text(
                                                  'AS',
                                                  style: TextStyle(
                                                    color: Color(0xFF5A5959),
                                                    fontSize: 16,
                                                    fontFamily:
                                                        'SF Pro Display',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 21,
                                              ),
                                              const Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Andrew Simon',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF262626),
                                                        fontSize: 22,
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'Senior associate - Projects',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF262626),
                                                          fontSize: 16,
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      'CDB-Operations',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF8A8A8A),
                                                        fontSize: 16,
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const Icon(Icons.more_vert)
                                            ],
                                          ),
                                        ));
                                  }),
                                  separatorBuilder: ((context, index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
