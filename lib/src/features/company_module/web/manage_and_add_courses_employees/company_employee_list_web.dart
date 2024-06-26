import 'package:all_in_one/src/features/company_module/web/my_company_jobs/my_company_job_web.dart';
import 'package:all_in_one/src/features/company_module/web/payment_and_invoice/company_payment_and_invoice_web.dart';
import 'package:all_in_one/src/features/company_module/web/saved_job_company/saved_jobs_company_web.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/mobile/student_app_bar.dart';
import 'package:all_in_one/src/core/widgets/web/side_nav_bar_company.dart';
import 'package:flutter/material.dart';

class CompanyEmployeeListPageWeb extends StatefulWidget {
  const CompanyEmployeeListPageWeb({super.key});

  @override
  State<CompanyEmployeeListPageWeb> createState() =>
      _CompanyEmployeeListPageWebState();
}

class _CompanyEmployeeListPageWebState
    extends State<CompanyEmployeeListPageWeb> {
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           const CompanyEmployeeListPageWeb()),
                      // );
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
                        title2: "Company Tagline here",
                        isBack: false,
                        searchHintText:
                            "Search for employees, departments and more...",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 17,
                                      ),
                                      const Text(
                                        'Filters and options',
                                        style: TextStyle(
                                          color: Color(0xFF5A5959),
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 190,
                                            height: 36,
                                            clipBehavior: Clip.antiAlias,
                                            alignment: Alignment.center,
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
                                            child: const Text(
                                              'Choose department',
                                              style: TextStyle(
                                                color: Color(0xFF262626),
                                                fontSize: 14,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            width: 89,
                                            height: 36,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.filter_list,
                                                  size: 18,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'A - Z',
                                                  style: TextStyle(
                                                    color: Color(0xFF262626),
                                                    fontSize: 14,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           CompanyAddEmployeePageWeb(
                                          //             onLogout: widget.onLogout,
                                          //           )),
                                          // );
                                        },
                                        child: Container(
                                          width: 120,
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
                                              Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Add new',
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
                                        height: 30,
                                      ),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: 10,
                                        itemBuilder: ((context, index) {
                                          return Container(
                                              width: SizeConfig.screenWidth,
                                              height: 183,
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 21, 30, 21),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 52,
                                                      height: 52,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration:
                                                          const ShapeDecoration(
                                                        color:
                                                            Color(0xFFECECEC),
                                                        shape: CircleBorder(),
                                                      ),
                                                      child: const Text(
                                                        'AS',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF5A5959),
                                                          fontSize: 16,
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 21,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            'Andrew Simon',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF262626),
                                                              fontSize: 22,
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          const Text(
                                                            'Senior associate - Projects',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF262626),
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: 0),
                                                          ),
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                          const Text(
                                                            'CDB-Operations',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF8A8A8A),
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 0,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 16,
                                                          ),
                                                          Container(
                                                            width: SizeConfig
                                                                .screenWidth,
                                                            decoration:
                                                                const ShapeDecoration(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                side:
                                                                    BorderSide(
                                                                  width: 0.50,
                                                                  //  strokeAlign: BorderSide.strokeAlignCenter,
                                                                  color: Color(
                                                                      0xFFD9D9D9),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                          const Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .call_outlined),
                                                              SizedBox(
                                                                width: 24,
                                                              ),
                                                              Icon(Icons
                                                                  .mail_outline_outlined)
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ));
                                        }),
                                        separatorBuilder: ((context, index) {
                                          return const SizedBox(
                                            height: 30,
                                          );
                                        }),
                                      ),
                                    ]),
                              ),
                              // Expanded(
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(
                              //       left: 18,
                              //       right: 18,
                              //       top: 1,
                              //     ),
                              //     child:     ),
                              // ),
                              const SizedBox(
                                height: 60,
                              ),
                            ],
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
