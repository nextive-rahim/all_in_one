// import 'package:all_in_one/src/features/interviewer_module/web/interviews/interview_list_web.dart';
// import 'package:all_in_one/src/features/interviewer_module/interview_data_provider.dart';
// import 'package:all_in_one/src/core/utils/colors.dart';
// import 'package:all_in_one/src/core/utils/image_constant.dart';
// import 'package:all_in_one/src/core/utils/size_config.dart';
// import 'package:all_in_one/src/core/utils/strings.dart';
// import 'package:all_in_one/src/core/utils/util.dart';
// import 'package:all_in_one/src/core/widgets/mobile/student_app_bar.dart';
// import 'package:all_in_one/src/core/widgets/text_date_field.dart';
// import 'package:all_in_one/src/core/widgets/text_time_field.dart';
// import 'package:all_in_one/src/core/widgets/text_widget.dart';
// import 'package:all_in_one/src/core/widgets/web/side_nav_bar_interview.dart';
// import 'package:flutter/material.dart';

// class InterviewerDashboardWeb extends StatefulWidget {
//   const InterviewerDashboardWeb({
//     super.key,
//   });

//   @override
//   State<InterviewerDashboardWeb> createState() =>
//       _InterviewerDashboardWebState();
// }

// class _InterviewerDashboardWebState extends State<InterviewerDashboardWeb> {
//   bool verificationPending = false;

//   final _chooseDateController = TextEditingController();
//   final _timeSlotAController = TextEditingController();
//   final _timeSlotBController = TextEditingController();

//   String? editorResult = '';
//   String? pastlink2Text = '';
//   String? selectedDate = '';
//   String? selectedTimeA = '';
//   String? selectedTimeB = '';
//   @override
//   void initState() {
//     // _fetchDummyData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return  SafeArea(
//           child: Scaffold(
//         backgroundColor: CommonColor.greyColor1,
//         body: Row(
//           children: [
//             SideNavBarInterview(
//               jobDropdownOpen: false,
//               screenLarge: SizeConfig.screenWidth! > 700 ? true : false,
//               onChangedjobDropdown: (val) {
//                 setState(() {
//                   //  jobDropdownOpen = !jobDropdownOpen;
//                 });
//               },
//               onChangedNavigation: (val) {
//                 if (val == AppStrings.interviews) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const InterviewListPageWeb(),
//                     ),
//                   );
//                 }
//               },
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const StudentAppBarMobile(
//                     titel1: AppStrings.accountVerification,
//                     title2: AppStrings.introductoryTest,
//                     isBack: false,
//                     searchHintText: '',
//                     // onSearchListener: (value) {},
//                   ),
//                   verificationPending
//                       ? Padding(
//                           padding: const EdgeInsets.only(
//                               top: 26, left: 18, right: 16, bottom: 50),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 ImageConstant.verificationPending,
//                                 width: SizeConfig.screenWidth,
//                                 height: SizeConfig.screenHeight * 0.5,
//                                 fit: BoxFit.fill,
//                               ),
//                               const SizedBox(
//                                 height: 50,
//                               ),
//                               const TextWidget(
//                                   text: AppStrings.verificationPending,
//                                   color: CommonColor.greyColor6,
//                                   maxLine: 1,
//                                   fontFamily: AppStrings.sfProDisplay,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 14),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     verificationPending = false;
//                                   });
//                                 },
//                                 child: Container(
//                                   width: 165,
//                                   height: 40,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 16, vertical: 10),
//                                   clipBehavior: Clip.antiAlias,
//                                   decoration: ShapeDecoration(
//                                     color: Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                       side: const BorderSide(
//                                           width: 0.50,
//                                           color: CommonColor.greyColor5),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     shadows: const [
//                                       BoxShadow(
//                                         color: CommonColor.blackColor3,
//                                         blurRadius: 2,
//                                         offset: Offset(0, 1),
//                                         spreadRadius: 0,
//                                       )
//                                     ],
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Image.asset(ImageConstant.refresh),
//                                       const SizedBox(
//                                         width: 10,
//                                       ),
//                                       const Text(
//                                         AppStrings.refresh,
//                                         style: TextStyle(
//                                           color: CommonColor.blackColor4,
//                                           fontSize: 14,
//                                           fontFamily: AppStrings.inter,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       : Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(
//                               height: 40,
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.only(left: 20),
//                               child: TextWidget(
//                                   text: AppStrings.mandatoryIntroductoryTest,
//                                   color: CommonColor.greyColor12,
//                                   maxLine: 1,
//                                   fontFamily: AppStrings.sfProDisplay,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 14),
//                             ),
//                             const SizedBox(
//                               height: 16,
//                             ),
//                             SizedBox(
//                               width: SizeConfig.screenWidth,
//                               height: SizeConfig.screenHeight * 0.5,
//                               child: Stack(
//                                 children: [
//                                   Image.asset(
//                                     ImageConstant.frame1Bg,
//                                     width: SizeConfig.screenWidth,
//                                     height: SizeConfig.screenHeight,
//                                     fit: BoxFit.fill,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 40, top: 63, right: 20),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const TextWidget(
//                                             text: 'Hi, Subham Patra',
//                                             color: CommonColor.greyColor12,
//                                             maxLine: 1,
//                                             fontFamily: AppStrings.sfProDisplay,
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 18),
//                                         const SizedBox(
//                                           height: 23,
//                                         ),
//                                         const TextWidget(
//                                             text:
//                                                 'You must appear in our introductory test to take interviews in this platform. You can select your preferred time-slot and schedule your mandatory test with our verified representative.',
//                                             color: CommonColor.blackColor1,
//                                             maxLine: 10,
//                                             fontFamily: AppStrings.sfProDisplay,
//                                             fontWeight: FontWeight.w400,
//                                             fontSize: 18),
//                                         const SizedBox(
//                                           height: 23,
//                                         ),
//                                         const TextWidget(
//                                             text: AppStrings
//                                                 .thanksForUnderstanding,
//                                             color: CommonColor.blackColor1,
//                                             maxLine: 2,
//                                             fontFamily: AppStrings.sfProDisplay,
//                                             fontWeight: FontWeight.w400,
//                                             fontSize: 16),
//                                         const SizedBox(
//                                           height: 23,
//                                         ),
//                                         GestureDetector(
//                                           onTap: () {
//                                             requestForInterviewBottomSheet()
//                                                 .then((value1) {
//                                               if (value1) {
//                                                 dataProvider
//                                                     .fetchInterviewTestRequest(
//                                                         context,
//                                                         selectedDate!,
//                                                         selectedTimeA!,
//                                                         selectedTimeB!, () {
//                                                   Util.logout(context);
//                                                 }).then((value2) {
//                                                   if (value2) {
//                                                     requestSubmittedBottomSheet(
//                                                             dataProvider
//                                                                 .interviewTestRequestMsg)
//                                                         .then((value3) {
//                                                       if (value3) {
//                                                         setState(() {
//                                                           verificationPending =
//                                                               true;
//                                                         });
//                                                       }
//                                                     });
//                                                   }
//                                                 });
//                                               }
//                                             });
//                                           },
//                                           child: Container(
//                                             width: 300,
//                                             height: 60,
//                                             alignment: Alignment.center,
//                                             clipBehavior: Clip.antiAlias,
//                                             decoration: ShapeDecoration(
//                                               color: CommonColor.blueColor1,
//                                               shape: RoundedRectangleBorder(
//                                                 side: const BorderSide(
//                                                   width: 0.50,
//                                                   color: CommonColor.blueColor1,
//                                                 ),
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                               ),
//                                               shadows: const [
//                                                 BoxShadow(
//                                                   color:
//                                                       CommonColor.blackColor3,
//                                                   blurRadius: 2,
//                                                   offset: Offset(0, 1),
//                                                   spreadRadius: 0,
//                                                 )
//                                               ],
//                                             ),
//                                             child: const Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Icon(
//                                                   Icons.alarm,
//                                                   color: CommonColor.whiteColor,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 12,
//                                                 ),
//                                                 TextWidget(
//                                                     text: AppStrings
//                                                         .scheduleMyTest,
//                                                     color:
//                                                         CommonColor.whiteColor,
//                                                     maxLine: 1,
//                                                     fontFamily:
//                                                         AppStrings.inter,
//                                                     fontWeight: FontWeight.w500,
//                                                     fontSize: 18),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 50,
//                             ),
//                           ],
//                         )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ));
//     });
//   }

//   Future<bool> requestForInterviewBottomSheet() async {
//     return await showModalBottomSheet(
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(25.0),
//               ),
//             ),
//             backgroundColor: Colors.transparent,
//             context: context,
//             isScrollControlled: true,
//             isDismissible: false,
//             useRootNavigator: true,
//             builder: (context) {
//               return Padding(
//                 padding: EdgeInsets.only(
//                     left: SizeConfig.screenWidth! * 0.5, right: 0, bottom: 0),
//                 child: StatefulBuilder(
//                     builder: (BuildContext context, StateSetter setState) {
//                   return Container(
//                       height: SizeConfig.screenHeight * 0.85,
//                       clipBehavior: Clip.antiAlias,
//                       decoration: ShapeDecoration(
//                         color: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         shadows: const [
//                           BoxShadow(
//                             color: Color(0x3F000000),
//                             blurRadius: 100,
//                             offset: Offset(0, 4),
//                             spreadRadius: 5,
//                           )
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                             right: 20, left: 20, top: 15, bottom: 15),
//                         child: SingleChildScrollView(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 width: 90,
//                                 height: 2,
//                                 color: CommonColor.greyColor18,
//                               ),
//                               const SizedBox(
//                                 height: 25,
//                               ),
//                               const TextWidget(
//                                   text: AppStrings.scheduleIntroductoryTest,
//                                   color: CommonColor.blackColor1,
//                                   maxLine: 1,
//                                   fontFamily: AppStrings.aeonikTRIAL,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 18),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               const TextWidget(
//                                   text: AppStrings.greatReadyInterviewsSoonMsg,
//                                   color: CommonColor.blackColor1,
//                                   maxLine: 3,
//                                   fontFamily: AppStrings.sfProDisplay,
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 16),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                 width: SizeConfig.screenWidth,
//                                 height: 1,
//                                 color: CommonColor.greyColor18,
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(
//                                     height: 30,
//                                   ),
//                                   const TextWidget(
//                                       text: AppStrings.chooseDate,
//                                       color: CommonColor.blackColor4,
//                                       maxLine: 1,
//                                       fontFamily: AppStrings.inter,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14),
//                                   const SizedBox(
//                                     height: 7,
//                                   ),
//                                   TextDateFieldWidget(
//                                       controller: _chooseDateController,
//                                       valtext: AppStrings.commonTextVal,
//                                       height: 40,
//                                       hintText: "16th May , 2023",
//                                       readOnly: false,
//                                       maxLine: 1,
//                                       keyType: TextInputType.text,
//                                       wordLimit: 100,
//                                       fontFamily: AppStrings.inter,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           pastlink2Text = value;
//                                           selectedDate = value;
//                                         });
//                                       },
//                                       prefixIcon: const Icon(
//                                         Icons.mail_outline_outlined,
//                                         color: CommonColor.hintTextColor,
//                                       )),
//                                   const SizedBox(
//                                     height: 30,
//                                   ),
//                                   const TextWidget(
//                                       text: AppStrings.preferredTimeSlotA,
//                                       color: CommonColor.blackColor4,
//                                       maxLine: 1,
//                                       fontFamily: AppStrings.inter,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14),
//                                   const SizedBox(
//                                     height: 7,
//                                   ),
//                                   TextTimeFieldWidget(
//                                     controller: _timeSlotAController,
//                                     valtext: AppStrings.commonTextVal,
//                                     height: 40,
//                                     hintText: "9:00 AM",
//                                     readOnly: false,
//                                     maxLine: 1,
//                                     keyType: TextInputType.text,
//                                     wordLimit: 100,
//                                     fontFamily: AppStrings.inter,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         pastlink2Text = value;
//                                         selectedTimeA = value;
//                                       });
//                                     },
//                                     suffixIcon: const SizedBox(),
//                                   ),
//                                   const SizedBox(
//                                     height: 30,
//                                   ),
//                                   const TextWidget(
//                                       text: AppStrings.preferredTimeSlotB,
//                                       color: CommonColor.blackColor4,
//                                       maxLine: 1,
//                                       fontFamily: AppStrings.inter,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14),
//                                   const SizedBox(
//                                     height: 7,
//                                   ),
//                                   TextTimeFieldWidget(
//                                     controller: _timeSlotBController,
//                                     valtext: AppStrings.commonTextVal,
//                                     height: 40,
//                                     hintText: "10:00 AM",
//                                     readOnly: false,
//                                     maxLine: 1,
//                                     keyType: TextInputType.text,
//                                     wordLimit: 100,
//                                     fontFamily: AppStrings.inter,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         pastlink2Text = value;
//                                         selectedTimeB = value;
//                                       });
//                                     },
//                                     suffixIcon: const SizedBox(),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 30,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   if (_chooseDateController.text.isEmpty ||
//                                       _timeSlotAController.text.isEmpty ||
//                                       _timeSlotBController.text.isEmpty) {
//                                     Util.displayToast(
//                                         context,
//                                         AppStrings.plzFillAllFields,
//                                         CommonColor.redColors);
//                                   } else {
//                                     Navigator.pop(context, true);
//                                   }
//                                 },
//                                 child: Container(
//                                   width: SizeConfig.screenWidth,
//                                   height: 60,
//                                   alignment: Alignment.center,
//                                   clipBehavior: Clip.antiAlias,
//                                   decoration: ShapeDecoration(
//                                     color: CommonColor.blueColor1,
//                                     shape: RoundedRectangleBorder(
//                                       side: const BorderSide(
//                                           width: 0.50,
//                                           color: CommonColor.blueColor1),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     shadows: const [
//                                       BoxShadow(
//                                         color: CommonColor.blackColor3,
//                                         blurRadius: 2,
//                                         offset: Offset(0, 1),
//                                         spreadRadius: 0,
//                                       )
//                                     ],
//                                   ),
//                                   child: const TextWidget(
//                                       text: AppStrings.requestForInterview,
//                                       color: CommonColor.whiteColor,
//                                       maxLine: 1,
//                                       fontFamily: AppStrings.inter,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 18),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Container(
//                                   width: SizeConfig.screenWidth,
//                                   height: 60,
//                                   alignment: Alignment.center,
//                                   clipBehavior: Clip.antiAlias,
//                                   decoration: ShapeDecoration(
//                                     color: Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                       side: const BorderSide(
//                                           width: 0.50,
//                                           color: CommonColor.greyColor5),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     shadows: const [
//                                       BoxShadow(
//                                         color: CommonColor.blackColor3,
//                                         blurRadius: 2,
//                                         offset: Offset(0, 1),
//                                         spreadRadius: 0,
//                                       )
//                                     ],
//                                   ),
//                                   child: const TextWidget(
//                                       text: AppStrings.cancel,
//                                       color: CommonColor.blackColor4,
//                                       maxLine: 1,
//                                       fontFamily: AppStrings.inter,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 18),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ));
//                 }),
//               );
//             }) ??
//         false; //if showDialouge had returned null, then return false
//   }

//   Future<bool> requestSubmittedBottomSheet(String msg) async {
//     return await showModalBottomSheet(
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(25.0),
//               ),
//             ),
//             backgroundColor: Colors.transparent,
//             context: context,
//             isScrollControlled: true,
//             isDismissible: false,
//             useRootNavigator: true,
//             builder: (context) {
//               return Padding(
//                 padding: EdgeInsets.only(
//                     left: SizeConfig.screenWidth! * 0.5, right: 0, bottom: 0),
//                 child: StatefulBuilder(
//                     builder: (BuildContext context, StateSetter setState) {
//                   return Container(
//                       height: SizeConfig.screenHeight * 0.85,
//                       clipBehavior: Clip.antiAlias,
//                       decoration: ShapeDecoration(
//                         color: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         shadows: const [
//                           BoxShadow(
//                             color: Color(0x3F000000),
//                             blurRadius: 100,
//                             offset: Offset(0, 4),
//                             spreadRadius: 5,
//                           )
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                             right: 47, left: 47, top: 15, bottom: 15),
//                         child: SingleChildScrollView(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 width: 90,
//                                 height: 2,
//                                 color: CommonColor.greyColor18,
//                               ),
//                               SizedBox(
//                                 height: SizeConfig.screenWidth! * 0.05,
//                               ),
//                               Container(
//                                 width: 170,
//                                 height: 170,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(85),
//                                     color: CommonColor.greenColor1),
//                                 child: const Icon(
//                                   Icons.check,
//                                   size: 120,
//                                   color: CommonColor.whiteColor,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 24,
//                               ),
//                               TextWidget(
//                                   text: msg, //AppStrings.requestSubmitted,
//                                   color: CommonColor.greyColor6,
//                                   maxLine: 1,
//                                   fontFamily: AppStrings.aeonikTRIAL,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 18),
//                               const SizedBox(
//                                 height: 12,
//                               ),
//                               Text.rich(
//                                 TextSpan(
//                                   children: [
//                                     const TextSpan(
//                                       text:
//                                           'Your introductory test is scheduled on ',
//                                       style: TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 24,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: _chooseDateController
//                                           .text, //'16th May 2023',
//                                       style: const TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 24,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     const TextSpan(
//                                       text: ' at ',
//                                       style: TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 24,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: _timeSlotAController
//                                           .text', //'9:00 AM ',
//                                       style: const TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 24,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     const TextSpan(
//                                       text: 'or',
//                                       style: TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 24,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text:
//                                           " ${'_timeSlotBController.text'}", //' 10:00 AM',
//                                       style: const TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 24,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                               const SizedBox(
//                                 height: 28,
//                               ),
//                               const TextWidget(
//                                   text: AppStrings.wishYouAllTheBest,
//                                   color: CommonColor.greenColor2,
//                                   maxLine: 2,
//                                   fontFamily: AppStrings.sfProDisplay,
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 18),
//                               const SizedBox(
//                                 height: 24,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.pop(context, true);
//                                 },
//                                 child: Container(
//                                   width: SizeConfig.screenWidth,
//                                   height: 60,
//                                   alignment: Alignment.center,
//                                   clipBehavior: Clip.antiAlias,
//                                   decoration: ShapeDecoration(
//                                     color: Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                       side: const BorderSide(
//                                           width: 0.50,
//                                           color: CommonColor.greyColor5),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     shadows: const [
//                                       BoxShadow(
//                                         color: CommonColor.blackColor3,
//                                         blurRadius: 2,
//                                         offset: Offset(0, 1),
//                                         spreadRadius: 0,
//                                       )
//                                     ],
//                                   ),
//                                   child: const Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(Icons.check),
//                                       SizedBox(
//                                         width: 8,
//                                       ),
//                                       TextWidget(
//                                           text: AppStrings.okGotIt,
//                                           color: CommonColor.blackColor4,
//                                           maxLine: 1,
//                                           fontFamily: AppStrings.inter,
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 18),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ));
//                 }),
//               );
//             }) ??
//         false; //if showDialouge had returned null, then return false
  
// }
