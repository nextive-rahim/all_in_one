// import 'package:all_in_one/src/core/extension/string_extension.dart';
// import 'package:all_in_one/src/features/interviewer_module/web/interviews/confirm_interview_list_web.dart';
// import 'package:all_in_one/src/features/interviewer_module/interview_data_provider.dart';
// import 'package:all_in_one/src/core/utils/colors.dart';
// import 'package:all_in_one/src/core/utils/formated_date_time.dart';
// import 'package:all_in_one/src/core/utils/image_constant.dart';
// import 'package:all_in_one/src/core/utils/size_config.dart';
// import 'package:all_in_one/src/core/utils/strings.dart';
// import 'package:all_in_one/src/core/utils/util.dart';
// import 'package:all_in_one/src/core/widgets/mobile/student_app_bar.dart';
// import 'package:all_in_one/src/core/widgets/text_form_field.dart';
// import 'package:all_in_one/src/core/widgets/text_widget.dart';
// import 'package:all_in_one/src/core/widgets/web/side_nav_bar_interview.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

// class InterviewListPageWeb extends StatefulWidget {
//   const InterviewListPageWeb({super.key});

//   @override
//   State<InterviewListPageWeb> createState() => _InterviewListPageWebState();
// }

// class _InterviewListPageWebState extends State<InterviewListPageWeb> {
//   bool verificationPending = false;

//   final _interviewFeedbackController = TextEditingController();

//   String? editorResult = '';
//   String? pastlink2Text = '';
//   String? selectedTime = '';
//   int? scheduledInterviewsIndex;
//   int? selectedInterviewsIndex;
//   List<String> completedTopicsList = [
//     'Introduction to React for beginners',
//     'Arrays & function in React',
//     'Set parameters gateways',
//     'React: Founder and History',
//     'Tokenization History',
//     'Conclusion'
//   ];
//   bool selectSlotA = false, selectSlotB = false, selectConfirmTimeslot = false;
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Util.showLoader(context);
//       Provider.of<InterviewDataProvider>(context, listen: false)
//           .getViewInterviewData(context, () {
//         Util.logout(context);
//       }).then((value) {
//         Navigator.of(context, rootNavigator: true).pop();
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Consumer<InterviewDataProvider>(
//         builder: (context, dataProvider, child) {
//       return SafeArea(
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
//                 if (val == AppStrings.dashboard) {
//                   Navigator.pop(context);
//                 }
//               },
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const StudentAppBarMobile(
//                     titel1: AppStrings.interviews,
//                     title2: AppStrings.findAndanageYourInterviews,
//                     isBack: false,
//                     searchHintText: '',
//                     // onSearchListener: (value) {},
//                   ),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                             top: 40, left: 20, right: 20, bottom: 80),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const TextWidget(
//                                 text: AppStrings.yourScheduledInterviews,
//                                 color: CommonColor.blackColor1,
//                                 maxLine: 1,
//                                 fontFamily: AppStrings.sfProDisplay,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               width: SizeConfig.screenWidth,
//                               height: 1,
//                               color: CommonColor.greyColor18,
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             ListView.separated(
//                               itemCount: 2,
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               separatorBuilder: (context, ind) {
//                                 return const SizedBox(
//                                   height: 20,
//                                 );
//                               },
//                               itemBuilder: (context, index) {
//                                 return GestureDetector(
//                                   onTap: () async {
//                                     await launch("https://www.google.com/")
//                                         .then((value) {
//                                       setState(() {
//                                         scheduledInterviewsIndex = index;
//                                       });
//                                     });
//                                   },
//                                   child: Container(
//                                     width: SizeConfig.screenWidth! * 0.3,
//                                     height: 156,
//                                     decoration: ShapeDecoration(
//                                       color: scheduledInterviewsIndex != null
//                                           ? scheduledInterviewsIndex == index
//                                               ? CommonColor.greyColor9
//                                               : Colors.white
//                                           : Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                         side: BorderSide(
//                                             width: 0.9,
//                                             color: scheduledInterviewsIndex !=
//                                                     null
//                                                 ? scheduledInterviewsIndex ==
//                                                         index
//                                                     ? CommonColor.blueColor1
//                                                     : CommonColor.greyColor18
//                                                 : CommonColor.greyColor18),
//                                         borderRadius: BorderRadius.circular(20),
//                                       ),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 20,
//                                           right: 20,
//                                           top: 24,
//                                           bottom: 24),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const TextWidget(
//                                               text: 'Introductions to Dev Ops',
//                                               color: CommonColor.blackColor2,
//                                               maxLine: 1,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 20),
//                                           const SizedBox(
//                                             height: 16,
//                                           ),
//                                           const Row(
//                                             children: [
//                                               TextWidget(
//                                                   text: '9:15 PM',
//                                                   color:
//                                                       CommonColor.blackColor2,
//                                                   maxLine: 1,
//                                                   fontFamily:
//                                                       AppStrings.sfProDisplay,
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize: 16),
//                                               SizedBox(
//                                                 width: 40,
//                                               ),
//                                               TextWidget(
//                                                   text: '26th May 2023',
//                                                   color:
//                                                       CommonColor.blackColor2,
//                                                   maxLine: 1,
//                                                   fontFamily:
//                                                       AppStrings.sfProDisplay,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 16),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 20,
//                                           ),
//                                           scheduledInterviewsIndex != null
//                                               ? scheduledInterviewsIndex ==
//                                                       index
//                                                   ? GestureDetector(
//                                                       onTap: () {
//                                                         interviewfeedbackBottomSheet()
//                                                             .then((value) {
//                                                           if (value) {
//                                                             Util.showLoader(
//                                                                 context);
//                                                             dataProvider
//                                                                 .fetechStoreInterviewFeedback(
//                                                                     context,
//                                                                     1,
//                                                                     _interviewFeedbackController
//                                                                         .text,
//                                                                     () {
//                                                               Util.logout(
//                                                                   context);
//                                                             }).then((value) {
//                                                               Navigator.of(
//                                                                       context,
//                                                                       rootNavigator:
//                                                                           true)
//                                                                   .pop();
//                                                             });
//                                                           }
//                                                         });
//                                                       },
//                                                       child: const Row(
//                                                         children: [
//                                                           Icon(
//                                                             Icons
//                                                                 .mode_edit_outline_outlined,
//                                                             color: CommonColor
//                                                                 .blueColor1,
//                                                           ),
//                                                           SizedBox(
//                                                             width: 8,
//                                                           ),
//                                                           TextWidget(
//                                                               text: AppStrings
//                                                                   .writeAFeedback,
//                                                               color: CommonColor
//                                                                   .blueColor1,
//                                                               maxLine: 1,
//                                                               fontFamily: AppStrings
//                                                                   .sfProDisplay,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400,
//                                                               fontSize: 20),
//                                                         ],
//                                                       ),
//                                                     )
//                                                   : Row(
//                                                       children: [
//                                                         Image.asset(
//                                                           ImageConstant.link2,
//                                                           color: CommonColor
//                                                               .blueColor1,
//                                                         ),
//                                                         const SizedBox(
//                                                           width: 8,
//                                                         ),
//                                                         const TextWidget(
//                                                             text: AppStrings
//                                                                 .interviewLink,
//                                                             color: CommonColor
//                                                                 .blueColor1,
//                                                             maxLine: 1,
//                                                             fontFamily: AppStrings
//                                                                 .sfProDisplay,
//                                                             fontWeight:
//                                                                 FontWeight.w400,
//                                                             fontSize: 20),
//                                                       ],
//                                                     )
//                                               : Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       ImageConstant.link2,
//                                                       color: CommonColor
//                                                           .blueColor1,
//                                                     ),
//                                                     const SizedBox(
//                                                       width: 8,
//                                                     ),
//                                                     const TextWidget(
//                                                         text: AppStrings
//                                                             .interviewLink,
//                                                         color: CommonColor
//                                                             .blueColor1,
//                                                         maxLine: 1,
//                                                         fontFamily: AppStrings
//                                                             .sfProDisplay,
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         fontSize: 20),
//                                                   ],
//                                                 )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             const SizedBox(
//                               height: 30,
//                             ),
//                             const TextWidget(
//                                 text: AppStrings.interviewRequests,
//                                 color: CommonColor.blackColor1,
//                                 maxLine: 1,
//                                 fontFamily: AppStrings.sfProDisplay,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 SizedBox(
//                                   width: SizeConfig.screenWidth! * 0.3,
//                                   child: const TextWidget(
//                                       text: AppStrings
//                                           .clickAcceptInterviewRequestsMsg,
//                                       color: CommonColor.greyColor6,
//                                       maxLine: 2,
//                                       fontFamily: AppStrings.sfProDisplay,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 12),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               const ConfirmInterviewListPageWeb()),
//                                     );
//                                   },
//                                   child: const TextWidget(
//                                       text: AppStrings.viewAll,
//                                       color: CommonColor.blackColor1,
//                                       maxLine: 1,
//                                       fontFamily: AppStrings.aeonikTRIAL,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 16),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               width: SizeConfig.screenWidth,
//                               height: 1,
//                               color: CommonColor.greyColor18,
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             ListView.separated(
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               itemCount: dataProvider.viewInterviewList.length,
//                               separatorBuilder: (context, ind) {
//                                 return const SizedBox(
//                                   height: 20,
//                                 );
//                               },
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                   width: SizeConfig.screenWidth,
//                                   //height: 156,
//                                   alignment: Alignment.center,
//                                   decoration: ShapeDecoration(
//                                     color: selectedInterviewsIndex != null
//                                         ? selectedInterviewsIndex == index
//                                             ? CommonColor.greyColor9
//                                             : Colors.white
//                                         : Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                       side: BorderSide(
//                                           width: 0.9,
//                                           color: selectedInterviewsIndex != null
//                                               ? selectedInterviewsIndex == index
//                                                   ? CommonColor.blueColor1
//                                                   : CommonColor.greyColor18
//                                               : CommonColor.greyColor18),
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 40,
//                                         bottom: 40,
//                                         left: 20,
//                                         right: 20),
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           selectedInterviewsIndex = index;
//                                         });
//                                         confirmInterviewBottomSheet(
//                                                 dataProvider
//                                                         .viewInterviewList[
//                                                             index]
//                                                         .title ??
//                                                     '',
//                                                 getFormattedDate(dataProvider
//                                                     .viewInterviewList[index]
//                                                     .date)!,
//                                                 (dataProvider
//                                                                     .viewInterviewList[
//                                                                         index]
//                                                                     .timeSlotA ??
//                                                                 '')
//                                                             .length >
//                                                         5
//                                                     ? (dataProvider
//                                                             .viewInterviewList[
//                                                                 index]
//                                                             .timeSlotA ??
//                                                         '')
//                                                     : FormatedDateTime.formatedTime(
//                                                         '2023-12-07 ${dataProvider.viewInterviewList[index].timeSlotA ?? ''}'),
//                                                 (dataProvider
//                                                                     .viewInterviewList[
//                                                                         index]
//                                                                     .timeSlotB ??
//                                                                 '')
//                                                             .length >
//                                                         5
//                                                     ? (dataProvider
//                                                             .viewInterviewList[
//                                                                 index]
//                                                             .timeSlotB ??
//                                                         '')
//                                                     : FormatedDateTime.formatedTime(
//                                                         '2023-12-07 ${dataProvider.viewInterviewList[index].timeSlotB ?? ''}'))
//                                             .then((value) {
//                                           if (value) {
//                                             Util.showLoader(context);
//                                             dataProvider.fetechConfirmInterview(
//                                                 context,
//                                                 1,
//                                                 "https://www.google.com/", () {
//                                               Util.logout(context);
//                                             }).then((value) {
//                                               Navigator.of(context,
//                                                       rootNavigator: true)
//                                                   .pop();
//                                               interviewConfirmedBottomSheet(
//                                                 getFormattedDate(dataProvider
//                                                     .viewInterviewList[index]
//                                                     .date)!,
//                                               );
//                                             });
//                                           }
//                                         });
//                                       },
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           TextWidget(
//                                               text: dataProvider
//                                                       .viewInterviewList[index]
//                                                       .title ??
//                                                   '',

//                                               ///'Introduction to Java',
//                                               color: CommonColor.blackColor1,
//                                               maxLine: 1,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 16),
//                                           const SizedBox(
//                                             height: 8,
//                                           ),
//                                           SizedBox(
//                                             width: 160,
//                                             child: TextWidget(
//                                                 text:
//                                                     "${getFormattedDate(dataProvider.viewInterviewList[index].date)!} at ${(dataProvider.viewInterviewList[index].timeSlotA ?? '').length > 5 ? (dataProvider.viewInterviewList[index].timeSlotA ?? '') : FormatedDateTime.formatedTime('2023-12-07 ${dataProvider.viewInterviewList[index].timeSlotA ?? ''}')} or ${(dataProvider.viewInterviewList[index].timeSlotB ?? '').length > 5 ? (dataProvider.viewInterviewList[index].timeSlotB ?? '') : FormatedDateTime.formatedTime('2023-12-07 ${dataProvider.viewInterviewList[index].timeSlotB ?? ''}')}", //'26th May 2023 at 9:15 PM or 10:50 AM',55555
//                                                 color: CommonColor.blackColor1,
//                                                 maxLine: 2,
//                                                 fontFamily:
//                                                     AppStrings.sfProDisplay,
//                                                 fontWeight: FontWeight.w400,
//                                                 textAlign: TextAlign.center,
//                                                 fontSize: 12),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ));
//     });
//   }

//   Future<bool> interviewfeedbackBottomSheet() async {
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
//                       height: SizeConfig.screenHeight * 0.88,
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
//                                   text: AppStrings.writeInterviewFeedback,
//                                   color: CommonColor.blackColor1,
//                                   maxLine: 1,
//                                   fontFamily: AppStrings.aeonikTRIAL,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 18),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                 width: SizeConfig.screenWidth,
//                                 height: 1,
//                                 color: CommonColor.greyColor18,
//                               ),
//                               SizedBox(
//                                 width: SizeConfig.screenWidth,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     const Text.rich(
//                                       TextSpan(
//                                         children: [
//                                           TextSpan(
//                                             text: "${AppStrings.course}: ",
//                                             style: TextStyle(
//                                               color: CommonColor.blackColor1,
//                                               fontSize: 16,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                             text: ' Introductions to Dev Ops',
//                                             style: TextStyle(
//                                               color: CommonColor.blackColor1,
//                                               fontSize: 16,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     const Text.rich(
//                                       TextSpan(
//                                         children: [
//                                           TextSpan(
//                                             text: "${AppStrings.time}: ",
//                                             style: TextStyle(
//                                               color: CommonColor.blackColor1,
//                                               fontSize: 16,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                             text: '9:15 PM',
//                                             style: TextStyle(
//                                               color: CommonColor.blackColor1,
//                                               fontSize: 16,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     const Text.rich(
//                                       TextSpan(
//                                         children: [
//                                           TextSpan(
//                                             text: "${AppStrings.date}: ",
//                                             style: TextStyle(
//                                               color: CommonColor.blackColor1,
//                                               fontSize: 16,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                             text: '26th May 2023',
//                                             style: TextStyle(
//                                               color: CommonColor.blackColor1,
//                                               fontSize: 16,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     const Text.rich(
//                                       TextSpan(
//                                         children: [
//                                           TextSpan(
//                                             text:
//                                                 "${AppStrings.candidateName}: ",
//                                             style: TextStyle(
//                                               color: CommonColor.blackColor1,
//                                               fontSize: 16,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                             text: ' John Doe',
//                                             style: TextStyle(
//                                               color: CommonColor.blackColor1,
//                                               fontSize: 16,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 30,
//                                     ),
//                                     const TextWidget(
//                                         text: AppStrings.interviewFeedback,
//                                         color: CommonColor.blackColor2,
//                                         maxLine: 1,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 12),
//                                     const SizedBox(
//                                       height: 7,
//                                     ),
//                                     TextFormFieldWidget(
//                                       controller: _interviewFeedbackController,
//                                       valtext: AppStrings.commonTextVal,
//                                       height: 40,
//                                       hintText: "Enter interview feedback...",
//                                       hintTextColor: CommonColor.greyColor8,
//                                       readOnly: false,
//                                       maxLine: 10,
//                                       keyType: TextInputType.text,
//                                       wordLimit: 300,
//                                       fontFamily: AppStrings.sfProDisplay,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w400,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           pastlink2Text = value;
//                                         });
//                                       },
//                                       suffixIcon: const SizedBox(),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 30,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   if (_interviewFeedbackController
//                                       .text.isEmpty) {
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
//                                       text: AppStrings.submitFeedback,
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
//                                   Navigator.pop(context, false);
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

//   Future<bool> requestSubmittedBottomSheet() async {
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
//                                 height: SizeConfig.screenWidth! * 0.25,
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
//                               const TextWidget(
//                                   text: AppStrings.requestSubmitted,
//                                   color: CommonColor.greyColor6,
//                                   maxLine: 1,
//                                   fontFamily: AppStrings.aeonikTRIAL,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 18),
//                               const SizedBox(
//                                 height: 12,
//                               ),
//                               const Text.rich(
//                                 TextSpan(
//                                   children: [
//                                     TextSpan(
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
//                                       text: '16th May 2023',
//                                       style: TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 24,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: ' at ',
//                                       style: TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 24,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: '9:00 AM ',
//                                       style: TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 24,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: 'or',
//                                       style: TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 24,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: ' 10:00 AM',
//                                       style: TextStyle(
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
//   }

//   Future<bool> confirmInterviewBottomSheet(
//       String title, String date, String timeA, String timeB) async {
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
//                       height: SizeConfig.screenHeight * 0.88,
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
//                                   text: AppStrings.confirmInterview,
//                                   color: CommonColor.blackColor1,
//                                   maxLine: 1,
//                                   fontFamily: AppStrings.aeonikTRIAL,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 24),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                 width: SizeConfig.screenWidth,
//                                 height: 1,
//                                 color: CommonColor.greyColor18,
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Text.rich(
//                                 TextSpan(
//                                   children: [
//                                     const TextSpan(
//                                       text: "${AppStrings.courseName}: ",
//                                       style: TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 20,
//                                         fontFamily: AppStrings.aeonikTRIAL,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: title, //' Introduction to Java',
//                                       style: const TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 20,
//                                         fontFamily: AppStrings.aeonikTRIAL,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: SizeConfig.screenWidth,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     const SizedBox(
//                                       height: 30,
//                                     ),
//                                     const TextWidget(
//                                         text: AppStrings.candidateProfile,
//                                         color: CommonColor.greyColor4,
//                                         maxLine: 1,
//                                         underline: TextDecoration.underline,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 16),
//                                     const SizedBox(
//                                       height: 25,
//                                     ),
//                                     const Text.rich(
//                                       TextSpan(
//                                         children: [
//                                           TextSpan(
//                                             text: "${AppStrings.name}: ",
//                                             style: TextStyle(
//                                               color: CommonColor.blackColor1,
//                                               fontSize: 16,
//                                               fontFamily: AppStrings.inter,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                             text: 'Jhon',
//                                             style: TextStyle(
//                                               color: CommonColor.blackColor1,
//                                               fontSize: 16,
//                                               fontFamily: AppStrings.inter,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             const TextWidget(
//                                                 text: AppStrings.projectLink,
//                                                 color: CommonColor.blueColor1,
//                                                 maxLine: 1,
//                                                 fontFamily: AppStrings.inter,
//                                                 fontWeight: FontWeight.w500,
//                                                 fontSize: 16),
//                                             const SizedBox(
//                                               width: 8,
//                                             ),
//                                             Image.asset(
//                                               ImageConstant.link2,
//                                               color: CommonColor.blueColor1,
//                                             )
//                                           ],
//                                         ),
//                                         Row(
//                                           children: [
//                                             const TextWidget(
//                                                 text: AppStrings.testResultLink,
//                                                 color: CommonColor.blueColor1,
//                                                 maxLine: 1,
//                                                 fontFamily: AppStrings.inter,
//                                                 fontWeight: FontWeight.w500,
//                                                 fontSize: 16),
//                                             const SizedBox(
//                                               width: 8,
//                                             ),
//                                             Image.asset(
//                                               ImageConstant.link2,
//                                               color: CommonColor.blueColor1,
//                                             )
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 25,
//                                     ),
//                                     Stack(
//                                       children: [
//                                         Container(
//                                           width: 199,
//                                           height: 142,
//                                           decoration: ShapeDecoration(
//                                             image: DecorationImage(
//                                               image:
//                                                   AssetImage(ImageConstant.cv),
//                                               fit: BoxFit.fill,
//                                             ),
//                                             gradient: LinearGradient(
//                                               begin:
//                                                   const Alignment(0.00, -1.00),
//                                               end: const Alignment(0, 1),
//                                               colors: [
//                                                 Colors.black.withOpacity(0),
//                                                 Colors.black
//                                               ],
//                                             ),
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(20),
//                                             ),
//                                           ),
//                                         ),
//                                         Positioned.fill(
//                                           child: Padding(
//                                             padding: const EdgeInsets.only(
//                                                 bottom: 12),
//                                             child: Align(
//                                               alignment: Alignment.bottomCenter,
//                                               child: Container(
//                                                   width: 44,
//                                                   height: 44,
//                                                   alignment: Alignment.center,
//                                                   clipBehavior: Clip.antiAlias,
//                                                   decoration: ShapeDecoration(
//                                                     color: Colors.white,
//                                                     shape:
//                                                         RoundedRectangleBorder(
//                                                       side: const BorderSide(
//                                                           width: 0.50,
//                                                           color: CommonColor
//                                                               .greyColor5),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8),
//                                                     ),
//                                                     shadows: const [
//                                                       BoxShadow(
//                                                         color: CommonColor
//                                                             .blackColor3,
//                                                         blurRadius: 2,
//                                                         offset: Offset(0, 1),
//                                                         spreadRadius: 0,
//                                                       )
//                                                     ],
//                                                   ),
//                                                   child: const Icon(
//                                                     Icons
//                                                         .file_download_outlined,
//                                                     color: CommonColor
//                                                         .headingTextColor2,
//                                                   )),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 8,
//                                     ),
//                                     const TextWidget(
//                                         text: 'Resume of Akash Kumar',
//                                         color: CommonColor.greyColor11,
//                                         maxLine: 2,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 12),
//                                     const SizedBox(
//                                       height: 3,
//                                     ),
//                                     const TextWidget(
//                                         text: 'Last updated 31st May at 9:15',
//                                         color: CommonColor.greyColor11,
//                                         maxLine: 2,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 12),
//                                     const SizedBox(
//                                       height: 8,
//                                     ),
//                                     const TextWidget(
//                                         text: '146 KB',
//                                         color: CommonColor.greyColor11,
//                                         maxLine: 1,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 12),
//                                     const SizedBox(
//                                       height: 50,
//                                     ),
//                                     const TextWidget(
//                                         text: AppStrings.completedTopics,
//                                         color: CommonColor.greyColor4,
//                                         maxLine: 1,
//                                         underline: TextDecoration.underline,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 18),
//                                     const SizedBox(
//                                       height: 12,
//                                     ),
//                                     ListView.separated(
//                                       shrinkWrap: true,
//                                       itemCount: completedTopicsList.length,
//                                       physics:
//                                           const NeverScrollableScrollPhysics(),
//                                       itemBuilder: (context, index) {
//                                         return TextWidget(
//                                             text: completedTopicsList[index],
//                                             color: CommonColor.blackColor2,
//                                             maxLine: 2,
//                                             fontFamily: AppStrings.inter,
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 16);
//                                       },
//                                       separatorBuilder: (context, index) {
//                                         return const SizedBox(
//                                           height: 12,
//                                         );
//                                       },
//                                     ),
//                                     const SizedBox(
//                                       height: 50,
//                                     ),
//                                     Text.rich(
//                                       TextSpan(
//                                         children: [
//                                           const TextSpan(
//                                             text:
//                                                 'Your introductory test is scheduled on ',
//                                             style: TextStyle(
//                                               color: CommonColor.blackColor1,
//                                               fontSize: 20,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                             text: date, //'16th May 2023',
//                                             style: const TextStyle(
//                                               color: CommonColor.blackColor1,
//                                               fontSize: 20,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     const TextWidget(
//                                         text: AppStrings
//                                             .acceptYourAvailableTimeslot,
//                                         color: CommonColor.blackColor2,
//                                         maxLine: 1,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 16),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     selectSlotA = !selectSlotA;
//                                     if (selectSlotB) {
//                                       selectSlotB = false;
//                                     }
//                                   });
//                                   //Navigator.pop(context, true);
//                                   selectedTime = timeA;
//                                 },
//                                 child: Container(
//                                   width: SizeConfig.screenWidth,
//                                   height: 60,
//                                   alignment: Alignment.center,
//                                   clipBehavior: Clip.antiAlias,
//                                   decoration: ShapeDecoration(
//                                     color: selectSlotA
//                                         ? CommonColor.blueColor1
//                                         : CommonColor.whiteColor,
//                                     shape: RoundedRectangleBorder(
//                                       side: BorderSide(
//                                           width: 0.50,
//                                           color: selectSlotA
//                                               ? CommonColor.blueColor1
//                                               : CommonColor.greyColor5),
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
//                                   child: TextWidget(
//                                       text: timeA, //"9:00 AM",
//                                       color: selectSlotA
//                                           ? CommonColor.whiteColor
//                                           : CommonColor.blackColor4,
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
//                                   setState(() {
//                                     selectSlotB = !selectSlotB;
//                                     if (selectSlotA) {
//                                       selectSlotA = false;
//                                     }
//                                     selectedTime = timeB;
//                                   });
//                                   // Navigator.pop(context);
//                                 },
//                                 child: Container(
//                                   width: SizeConfig.screenWidth,
//                                   height: 60,
//                                   alignment: Alignment.center,
//                                   clipBehavior: Clip.antiAlias,
//                                   decoration: ShapeDecoration(
//                                     color: selectSlotB
//                                         ? CommonColor.blueColor1
//                                         : Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                       side: BorderSide(
//                                           width: 0.50,
//                                           color: selectSlotB
//                                               ? CommonColor.blueColor1
//                                               : CommonColor.greyColor5),
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
//                                   child: TextWidget(
//                                       text: timeB, //"10:00 AM",
//                                       color: selectSlotB
//                                           ? CommonColor.whiteColor
//                                           : CommonColor.blackColor4,
//                                       maxLine: 1,
//                                       fontFamily: AppStrings.inter,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 18),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                               Visibility(
//                                 visible: (selectSlotA || selectSlotB),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       selectConfirmTimeslot = true;
//                                     });
//                                     Navigator.pop(context, true);
//                                   },
//                                   child: Container(
//                                     width: SizeConfig.screenWidth,
//                                     height: 60,
//                                     alignment: Alignment.center,
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: ShapeDecoration(
//                                       color: selectConfirmTimeslot
//                                           ? CommonColor.blueColor1
//                                           : CommonColor.whiteColor,
//                                       shape: RoundedRectangleBorder(
//                                         side: BorderSide(
//                                             width: 0.50,
//                                             color: selectConfirmTimeslot
//                                                 ? CommonColor.blueColor1
//                                                 : CommonColor.greyColor5),
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                       shadows: const [
//                                         BoxShadow(
//                                           color: CommonColor.blackColor3,
//                                           blurRadius: 2,
//                                           offset: Offset(0, 1),
//                                           spreadRadius: 0,
//                                         )
//                                       ],
//                                     ),
//                                     child: TextWidget(
//                                         text: AppStrings.confirmTimeslot,
//                                         color: selectConfirmTimeslot
//                                             ? CommonColor.whiteColor
//                                             : CommonColor.blackColor4,
//                                         maxLine: 1,
//                                         fontFamily: AppStrings.inter,
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 18),
//                                   ),
//                                 ),
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

//   Future<bool> interviewConfirmedBottomSheet(
//     String date,
//   ) async {
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
//                     left: SizeConfig.screenWidth! * 0.5, right: 0, bottom: 20),
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
//                                 height: SizeConfig.screenWidth! * 0.25,
//                               ),
//                               Container(
//                                 width: 278,
//                                 height: 177,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         ImageConstant.requestSubmitted),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 47,
//                               ),
//                               const TextWidget(
//                                   text: AppStrings.interviewConfirmed,
//                                   color: CommonColor.blackColor1,
//                                   maxLine: 1,
//                                   fontFamily: AppStrings.aeonikTRIAL,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 24),
//                               const SizedBox(
//                                 height: 47,
//                               ),
//                               Text.rich(
//                                 TextSpan(
//                                   children: [
//                                     const TextSpan(
//                                       text: 'Interview is scheduled on ',
//                                       style: TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 18,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: date,

//                                       ///'26th May 2023',
//                                       style: const TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 18,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     const TextSpan(
//                                       text: ' at ',
//                                       style: TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 18,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: selectedTime, //'10:00 AM',
//                                       style: const TextStyle(
//                                         color: CommonColor.blackColor1,
//                                         fontSize: 18,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                               const SizedBox(
//                                 height: 60,
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
//                               const TextWidget(
//                                   text:
//                                       'We’ve sent a reminder to Jhon about your confirmation',
//                                   color: CommonColor.blackColor2,
//                                   maxLine: 2,
//                                   textAlign: TextAlign.center,
//                                   fontFamily: AppStrings.sfProDisplay,
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 16),
//                             ],
//                           ),
//                         ),
//                       ));
//                 }),
//               );
//             }) ??
//         false; //if showDialouge had returned null, then return false
//   }
// }
