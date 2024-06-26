// import 'package:all_in_one/src/features/employee_module/web/course_detail_form_reg_web/course_detail_form_reg_web.dart';
// import 'package:all_in_one/src/features/student_module/root/student_data_provider.dart';
// import 'package:all_in_one/src/core/utils/colors.dart';
// import 'package:all_in_one/src/core/utils/custom_grid_delegate.dart';
// import 'package:all_in_one/src/core/utils/image_constant.dart';
// import 'package:all_in_one/src/core/utils/size_config.dart';
// import 'package:all_in_one/src/core/utils/strings.dart';
// import 'package:all_in_one/src/core/utils/util.dart';
// import 'package:all_in_one/src/core/widgets/mobile/student_app_bar.dart';
// import 'package:all_in_one/src/core/widgets/text_widget.dart';
// import 'package:all_in_one/src/core/widgets/web/side_nav_bar_employee.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class DashboardRegFirstTimeEmployeeWeb extends StatefulWidget {
//   const DashboardRegFirstTimeEmployeeWeb({super.key});

//   @override
//   State<DashboardRegFirstTimeEmployeeWeb> createState() =>
//       _DashboardRegFirstTimeEmployeeWebState();
// }

// class _DashboardRegFirstTimeEmployeeWebState
//     extends State<DashboardRegFirstTimeEmployeeWeb> {
//   @override
//   void initState() {
//     // _fetchDummyData();
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Util.showLoader(context);
//       Provider.of<StudentDataProvider>(context, listen: false)
//           .getDashboardData(
//             context,
//           )
//           .then((value) => Navigator.of(context).pop());
//     });
//   }

//   // Future _fetchDummyData() async {
//   //   if (mounted) {
//   //     setState(() {
//   //       _shouldDisplayLoader = true;
//   //     });
//   //   }
//   //   Map<String, String> header = {};
//   //   Map<String, dynamic> body = {};
//   //   final value = await _networkUtility.makeWebServiceGetRequest(
//   //       url: UrlConstant.demoUrl, header: header);
//   //   var response = DemoModel.fromJson(json.decode(value));
//   //   if (mounted) {
//   //     setState(() {
//   //       _shouldDisplayLoader = false;
//   //     });
//   //   }
//   //   if (response != null) {
//   //     if (mounted) {
//   //       setState(() {
//   //         _dummyModel = response;
//   //       });
//   //     }
//   //     Util.displayToast(AppStrings.apiHitSuccesfully, context);
//   //   } else {
//   //     Util.displayToast(AppStrings.somethingWentWrong, context);
//   //   }
//   // }

//   final SizeConfig _sizeConfig = SizeConfig();
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Consumer<StudentDataProvider>(
//         builder: (context, dataProvider, child) {
//       return SafeArea(
//           child: Scaffold(
//               // appBar: AppBar(
//               //   backgroundColor: CommonColor.whiteColor,
//               //   title: const TextWidget(
//               //       text: "Welcome Back",
//               //       color: CommonColor.headingTextColor1,
//               //       maxLine: 1,
//               //       fontFamily: AppStrings.inter,
//               //       fontWeight: FontWeight.w500,
//               //       fontSize: 14),
//               // ),

//               backgroundColor: CommonColor.greyColor1,
//               body: Row(
//                 children: [
//                   SideNavBarEmployee(
//                     jobDropdownOpen: true,
//                     screenLarge: SizeConfig.screenWidth! > 700 ? true : false,
//                     onChangedjobDropdown: (val) {
//                       setState(() {
//                         //  jobDropdownOpen = !jobDropdownOpen;
//                       });
//                     },
//                     onChangedNavigation: (val) {
//                       // 555
//                       if (val == AppStrings.courses) {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //       builder: (context) =>
//                         //           const SavedJobsCompanyListPageWeb()),
//                         // );
//                       }
//                     },
//                   ),
//                   Expanded(
//                     child: Column(
//                       children: [
//                         StudentAppBarMobile(
//                           titel1: AppStrings.welcomeBackJoydeepForDemoAkash,
//                           title2: AppStrings.startLearningToday,
//                           isBack: false,
//                           searchHintText: AppStrings.searchForCourses,
//                           onSearchListener: (value) {
//                             dataProvider.searchHomeCourse(value);
//                           },
//                         ),
//                         /* Padding(
//                             padding: const EdgeInsets.only(
//                               left: 18,
//                               right: 18,
//                               top: 29,
//                               // bottom: 60,
//                             ),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: const [
//                                           TextWidget(
//                                               text: AppStrings.welcomeBackJoydeep,
//                                               color: CommonColor.headingTextColor1,
//                                               maxLine: 1,
//                                               fontFamily: AppStrings.aeonikTRIAL,
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 20),
//                                           TextWidget(
//                                               text: AppStrings.startLearningToday,
//                                               color: CommonColor.headingTextColor1,
//                                               maxLine: 1,
//                                               fontFamily: AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 14),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 32,
//                                     ),
//                                     SizedBox(
//                                       height: 40,
//                                       width: 40,
//                                       child: Stack(children: [
//                                         const Positioned(
//                                           left: 0,
//                                           bottom: 0,
//                                           child: Icon(
//                                             Icons.notifications_none_outlined,
//                                             color: CommonColor.headingTextColor1,
//                                           ),
//                                         ),
//                                         Positioned(
//                                           top: 0,
//                                           right: 3,
//                                           child: SizedBox(
//                                             height: 28,
//                                             width: 28,
//                                             child: Card(
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius: BorderRadius.circular(14),
//                                                 //set border radius more than 50% of height and width to make circle
//                                               ),
//                                               color: CommonColor.whiteColor,
//                                               elevation: 5,
//                                               child: const Padding(
//                                                 padding: EdgeInsets.only(top: 3.0),
//                                                 child: TextWidget(
//                                                     textAlign: TextAlign.center,
//                                                     text: '2',
//                                                     color: CommonColor.headingTextColor1,
//                                                     maxLine: 1,
//                                                     fontFamily: AppStrings.sfProDisplay,
//                                                     fontWeight: FontWeight.w500,
//                                                     fontSize: 10),
//                                               ),
//                                             ),
//                                           ),
//                                         )
//                                       ]),
//                                     )
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 16,
//                                 ),
//                                 SizedBox(
//                                   // width: _sizeConfig.getSize(347),
//                                   child: TextFormFieldSearchWidget(
//                                     controller: _searchController,
//                                     valtext: AppStrings.commonTextVal,
//                                     height: _sizeConfig.getSize(66),
//                                     hintText: AppStrings.searchForCourses,
//                                     readOnly: false,
//                                     maxLine: 1,
//                                     keyType: TextInputType.text,
//                                     wordLimit: 25,
//                                     fontFamily: AppStrings.inter,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     onChanged: (value) {},
//                                     suffixIcon: const Icon(
//                                       Icons.close,
//                                       color: Colors.grey,
//                                       size: 16,
//                                     ),
//                                     onSuffixTap: () {
//                                       setState(() {
//                                         _searchController.text = '';
//                                       });
//                                     },
//                                     preffixIcon: const Icon(
//                                       Icons.search,
//                                       color: Colors.grey,
//                                       size: 16,
//                                     ),
//                                     onPreffixTap: () {
//                                       setState(() {
//                                         // hintUsernameHelperText = !hintUsernameHelperText;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           */
//                         dataProvider.collectinListData!.isEmpty
//                             ? Expanded(
//                                 child: SingleChildScrollView(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                       left: 18,
//                                       right: 18,
//                                       top: 20,
//                                       bottom: 60,
//                                     ),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text.rich(
//                                           TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: AppStrings.latestCourses,
//                                                 style: TextStyle(
//                                                   color: CommonColor.greyColor4,
//                                                   fontSize: 18,
//                                                   fontFamily:
//                                                       AppStrings.aeonikTRIAL,
//                                                   fontWeight: FontWeight.w700,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text:
//                                                     ' ${AppStrings.fromTopExperts}',
//                                                 style: TextStyle(
//                                                   color: CommonColor.greyColor4,
//                                                   fontSize: 18,
//                                                   fontFamily:
//                                                       AppStrings.aeonikTRIAL,
//                                                   fontWeight: FontWeight.w400,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 16,
//                                         ),
//                                         SizedBox(
//                                           height:
//                                               SizeConfig.screenHeight * 0.59,
//                                           child: Stack(
//                                             alignment: Alignment.center,
//                                             // fit: StackFit.expand,
//                                             fit: StackFit.loose,
//                                             children: [
//                                               Positioned.fill(
//                                                 child: SizedBox(
//                                                   width: SizeConfig.screenWidth,
//                                                   child: Image.asset(
//                                                     ImageConstant.emptyCourse,
//                                                     fit: BoxFit.fill,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Positioned(
//                                                   bottom:
//                                                       SizeConfig.screenHeight *
//                                                           0.13,
//                                                   child: Column(
//                                                     children: [
//                                                       const TextWidget(
//                                                           textAlign:
//                                                               TextAlign.center,
//                                                           text: AppStrings
//                                                               .coursesUnavailable,
//                                                           color: CommonColor
//                                                               .blackColor1,
//                                                           maxLine: 1,
//                                                           fontFamily: AppStrings
//                                                               .sfProDisplay,
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                           fontSize: 16),
//                                                       const SizedBox(
//                                                         height: 16,
//                                                       ),
//                                                       GestureDetector(
//                                                         onTap: () {
//                                                           Util.showLoader(
//                                                               context);
//                                                           dataProvider
//                                                               .getDashboardData(
//                                                                   context)
//                                                               .then((value) {
//                                                             Navigator.of(
//                                                                     context,
//                                                                     rootNavigator:
//                                                                         true)
//                                                                 .pop();
//                                                           });
//                                                         },
//                                                         child: Row(
//                                                           children: [
//                                                             Image.asset(
//                                                                 ImageConstant
//                                                                     .refresh),
//                                                             const SizedBox(
//                                                               width: 16,
//                                                             ),
//                                                             const TextWidget(
//                                                                 textAlign:
//                                                                     TextAlign
//                                                                         .center,
//                                                                 text: AppStrings
//                                                                     .refresh,
//                                                                 color: CommonColor
//                                                                     .greyColor11,
//                                                                 maxLine: 1,
//                                                                 fontFamily:
//                                                                     AppStrings
//                                                                         .sfProDisplay,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w400,
//                                                                 fontSize: 18),
//                                                           ],
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ))
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             : Expanded(
//                                 child: SingleChildScrollView(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                       left: 18,
//                                       right: 18,
//                                       top: 50,
//                                       bottom: 60,
//                                     ),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text.rich(
//                                           TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: AppStrings.courses,
//                                                 style: TextStyle(
//                                                   color: CommonColor.greyColor4,
//                                                   fontSize: 18,
//                                                   fontFamily:
//                                                       AppStrings.aeonikTRIAL,
//                                                   fontWeight: FontWeight.w700,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: ' ${AppStrings.forYou}',
//                                                 style: TextStyle(
//                                                   color: CommonColor.greyColor4,
//                                                   fontSize: 18,
//                                                   fontFamily:
//                                                       AppStrings.aeonikTRIAL,
//                                                   fontWeight: FontWeight.w400,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(height: 16),
//                                         GridView.builder(
//                                             shrinkWrap: true,
//                                             itemCount: dataProvider
//                                                 .collectinListData!.length,
//                                             gridDelegate:
//                                                 SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
//                                               crossAxisCount:
//                                                   SizeConfig.screenWidth! > 700
//                                                       ? 3
//                                                       : 1,
//                                               crossAxisSpacing: 30,
//                                               mainAxisSpacing: 1,
//                                               height: _sizeConfig.getSize(
//                                                   400.0), //48 dp of height
//                                             ),
//                                             physics:
//                                                 const NeverScrollableScrollPhysics(),
//                                             itemBuilder: (context, index) {
//                                               return Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Container(
//                                                     //  height: 232,
//                                                     height: _sizeConfig
//                                                         .getSize(260.0),

//                                                     alignment: Alignment.center,
//                                                     decoration: ShapeDecoration(
//                                                         color: Colors.white,
//                                                         shape: const Border(),
//                                                         image: DecorationImage(
//                                                             fit: BoxFit.fill,
//                                                             image: NetworkImage(
//                                                                 dataProvider
//                                                                         .collectinListData![
//                                                                             index]
//                                                                         .thumbnailImage ??
//                                                                     '')
//                                                             // AssetImage(
//                                                             //     ImageConstant
//                                                             //             .listOfThumbnailsEmp[
//                                                             //         index])
//                                                             )),
//                                                     child: GestureDetector(
//                                                       onTap: () {
//                                                         ///////////          TODO  Chaneg to      const CourseDetailFormRegisterEmployeeMobilePage()  /////

//                                                         // Navigator.push(
//                                                         //   context,
//                                                         //   MaterialPageRoute(
//                                                         //       builder: (context) =>
//                                                         //           CourseDetailFormRegisterWebPage(
//                                                         //             collectinListData:
//                                                         //                 dataProvider
//                                                         //                     .collectinListData![index],
//                                                         //           )),
//                                                         // );
//                                                       },
//                                                       child: Container(
//                                                           width: 76,
//                                                           height: 76,
//                                                           alignment:
//                                                               Alignment.center,
//                                                           decoration:
//                                                               const ShapeDecoration(
//                                                             color: Colors.white,
//                                                             shape: CircleBorder(
//                                                                 side: BorderSide
//                                                                     .none),
//                                                           ),
//                                                           //color: CommonColor.whiteColor,
//                                                           child: const Icon(
//                                                             Icons
//                                                                 .play_arrow_outlined,
//                                                             size: 30,
//                                                           )),
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     height: _sizeConfig
//                                                         .getSize(10.0),
//                                                   ),
//                                                   TextWidget(
//                                                       textAlign:
//                                                           TextAlign.center,
//                                                       text: (dataProvider
//                                                                   .collectinListData![
//                                                                       index]
//                                                                   .title ??
//                                                               '')
//                                                           .trim(),
//                                                       //  AppStrings
//                                                       //     .dashboardFistTimeListEmp[index],
//                                                       color: CommonColor
//                                                           .headingTextColor1,
//                                                       maxLine: 2,
//                                                       fontFamily: AppStrings
//                                                           .sfProDisplay,
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontSize: 22),
//                                                   TextWidget(
//                                                       textAlign:
//                                                           TextAlign.center,
//                                                       text: dataProvider
//                                                               .collectinListData![
//                                                                   index]
//                                                               .totalTime ??
//                                                           '', //'9 Mins 80 Sec',
//                                                       color: CommonColor
//                                                           .headingTextColor1,
//                                                       maxLine: 1,
//                                                       fontFamily: AppStrings
//                                                           .sfProDisplay,
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontSize: 16),
//                                                   const SizedBox(
//                                                     height: 30,
//                                                   )
//                                                 ],
//                                               );
//                                             })
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               )
//                       ],
//                     ),
//                   ),
//                 ],
//               )));
//     });
//   }
// }
