// import 'package:all_in_one/src/core/utils/colors.dart';
// import 'package:all_in_one/src/core/utils/formated_date_time.dart';
// import 'package:all_in_one/src/core/utils/image_constant.dart';
// import 'package:all_in_one/src/core/utils/size_config.dart';
// import 'package:all_in_one/src/core/utils/strings.dart';
// import 'package:all_in_one/src/core/utils/util.dart';
// import 'package:all_in_one/src/core/widgets/my_youtube_player.dart';
// import 'package:all_in_one/src/core/widgets/text_form_field.dart';
// import 'package:all_in_one/src/core/widgets/text_widget.dart';
// import 'package:all_in_one/src/core/widgets/web/side_nav_bar_employee.dart';
// import 'package:all_in_one/src/features/employee_module/web/appear_test_and_schedule_interview/appear_test_and_schedule_interview_web.dart';
// import 'package:all_in_one/src/features/employee_module/web/dashboard/dashboard_reg_fist_time_web.dart';
// import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
// import 'package:all_in_one/src/features/student_module/root/student_data_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

// class CourseDetailFormRegisterWebPage extends StatefulWidget {
//   final Collection collectinListData;

//   const CourseDetailFormRegisterWebPage(
//       {super.key, required this.collectinListData});

//   @override
//   State<CourseDetailFormRegisterWebPage> createState() =>
//       _CourseDetailFormRegisterWebPageState();
// }

// class _CourseDetailFormRegisterWebPageState
//     extends State<CourseDetailFormRegisterWebPage> {
//   bool _appearInTest = false;
//   bool _writeMessage = false;
//   bool _courseRegistered = false;
//   bool _videoWatched = false;
//   final _editorController = TextEditingController();

//   String? editorResult = '';

//   // YoutubePlayerController? _controller;
//   String dropdownValue = AppStrings.courseLevelDropdown.first;
//   @override
//   void initState() {
//     //  _fetchDummyData();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Util.showLoader(context);
//       // Provider.of<StudentDataProvider>(context, listen: false)
//       //     .getViewCourseContentData(context, widget.collectinListData.id ?? 0,
//       //         () {
//       //   Util.logout(context);
//       // }).then((value) {
//       //   // Navigator.pop(context);
//       //   Provider.of<StudentDataProvider>(context, listen: false)
//       //       .getViewCommentsData(context, widget.collectinListData.id ?? 0, () {
//       //     Util.logout(context);
//       //   }).then((value) {
//       //     Provider.of<StudentDataProvider>(context, listen: false)
//       //         .getCoursePriceData(context, widget.collectinListData.id ?? 0,
//       //             () {
//       //       Util.logout(context);
//       //     });
//       //   }).then((value) => Navigator.of(context, rootNavigator: true).pop());
//       // });
//     });
//     // dropdownValue = widget.collectinListData.coursesLevel ?? '';

//     super.initState();
//     // if (!Platform.isWindows) {
//     //   _controller = YoutubePlayerController(
//     //     params: const YoutubePlayerParams(
//     //       showControls: true,
//     //       mute: false,
//     //       showFullscreenButton: true,
//     //       loop: false,
//     //     ),
//     //   );

//     //   _controller!.setFullScreenListener(
//     //     (isFullScreen) {
//     //       // Navigator.push(
//     //       //   context,
//     //       //   MaterialPageRoute(
//     //       //       builder: (context) => const YoutubePlayerFullscreen(
//     //       //             videoId: 'lNQJNImBsKY',
//     //       //           )),
//     //       // );
//     //       PersistentNavBarNavigator.pushNewScreen(
//     //         context,
//     //         screen: const YoutubePlayerFullscreen(
//     //           videoId: 'lNQJNImBsKY',
//     //         ),
//     //         withNavBar: false, // OPTIONAL VALUE. True by default.
//     //         pageTransitionAnimation: PageTransitionAnimation.cupertino,
//     //       );

//     //       log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
//     //     },
//     //   );

//     //   _controller!.loadVideoById(videoId: 'lNQJNImBsKY');
//     // }
//   }

//   void _onItemCheckedChange(String itemValue, bool checked, int index1) {
//     // setState(() {
//     //   if (checked) {
//     //     _selectedValues[index1].add(itemValue);
//     //   } else {
//     //     _selectedValues[index1].remove(itemValue);
//     //   }
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return SafeArea(
//       child: Row(
//         children: [
//           SideNavBarEmployee(
//             jobDropdownOpen: true,
//             screenLarge: SizeConfig.screenWidth! > 700 ? true : false,
//             onChangedjobDropdown: (val) {
//               setState(() {
//                 //  jobDropdownOpen = !jobDropdownOpen;
//               });
//             },
//             onChangedNavigation: (val) {
//               // 555
//               if (val == AppStrings.courses) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           const DashboardRegFirstTimeEmployeeWeb()),
//                 );
//               }
//             },
//           ),
//           Expanded(
//             child: Scaffold(
//                 appBar: AppBar(
//                   elevation: 0,
//                   backgroundColor: CommonColor.whiteColor,
//                   title: const TextWidget(
//                       text: "Back",
//                       color: CommonColor.headingTextColor1,
//                       maxLine: 1,
//                       fontFamily: AppStrings.inter,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14),
//                   leading: GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Icon(
//                       Icons.arrow_back_ios,
//                       color: CommonColor.blackColor,
//                       size: 18,
//                     ),
//                   ),
//                 ),
//                 body: Consumer<StudentDataProvider>(
//                     builder: (context, dataProvider, child) {
//                   return SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           top: 20, right: 17, left: 20, bottom: 60),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SizedBox(
//                                 width: SizeConfig.screenWidth! * 0.6,
//                                 child: TextWidget(
//                                     textAlign: TextAlign.start,
//                                     text: widget.collectinListData.title ?? '',
//                                     // 'React Native IOS and Android App Development for Beginners',
//                                     color: CommonColor.blackColor1,
//                                     maxLine: 2,
//                                     fontFamily: AppStrings.aeonikTRIAL,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16),
//                               ),
//                               GestureDetector(
//                                 onTap: () async {
//                                   final Uri smsLaunchUri = Uri(
//                                     scheme: 'sms',
//                                     path: '',
//                                     queryParameters: <String, String>{
//                                       'body':
//                                           '${widget.collectinListData.title}, ${widget.collectinListData.thumbnailImage}',
//                                     },
//                                   );
//                                   await launchUrl(smsLaunchUri);
//                                   //'sms:+999999999 ${widget.collectinListData.title}, ${widget.collectinListData.thumbnailImage}');
//                                 },
//                                 child: Container(
//                                   width: 36,
//                                   height: 36,
//                                   // padding: const EdgeInsets.all(8),
//                                   // clipBehavior: Clip.antiAlias,
//                                   alignment: Alignment.center,
//                                   decoration: ShapeDecoration(
//                                     color: Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                       side: const BorderSide(
//                                           width: 0.50,
//                                           color: CommonColor.greyColor5),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                   child: const Icon(Icons.share_outlined),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 12,
//                           ),
//                           Text.rich(
//                             TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: widget.collectinListData.totalTime ??
//                                       '', //'3 hours 12 mins',
//                                   style: const TextStyle(
//                                     color: CommonColor.greyColor6,
//                                     fontSize: 12,
//                                     fontFamily: AppStrings.sfProDisplay,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text:
//                                       ' / By ${widget.collectinListData.author!}', //' / By Daniel Scott',
//                                   style: const TextStyle(
//                                     color: CommonColor.greyColor6,
//                                     fontSize: 12,
//                                     fontFamily: AppStrings.sfProDisplay,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 22,
//                           ),
//                           const TextWidget(
//                               textAlign: TextAlign.start,
//                               text: AppStrings.courseLevel,
//                               color: CommonColor.headingTextColor1,
//                               maxLine: 2,
//                               fontFamily: AppStrings.aeonikTRIAL,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 16),
//                           const SizedBox(
//                             height: 14,
//                           ),
//                           Container(
//                             width: 142,
//                             height: 36,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 14, vertical: 8),
//                             clipBehavior: Clip.antiAlias,
//                             alignment: Alignment.center,
//                             decoration: ShapeDecoration(
//                               color: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                 side: const BorderSide(
//                                     width: 0.50, color: CommonColor.greyColor5),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: const TextWidget(
//                                 textAlign: TextAlign.start,
//                                 text:
//                                     "Beginner", //widget.collectinListData.coursesLevel ?? '',
//                                 color: CommonColor.headingTextColor1,
//                                 maxLine: 2,
//                                 fontFamily: AppStrings.aeonikTRIAL,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16),
//                             // DropdownButton<String>(
//                             //   value: dropdownValue,
//                             //   underline: Container(),
//                             //   icon: const Icon(Icons.expand_more),
//                             //   style: const TextStyle(color: Colors.black),
//                             //   onChanged: (String? value) {
//                             //     dropdownValue = value!;
//                             //     setState(() {});
//                             //   },
//                             //   items: AppStrings.courseLevelDropdown
//                             //       .map<DropdownMenuItem<String>>((String value) {
//                             //     return DropdownMenuItem<String>(
//                             //       value: value,
//                             //       child: Text(value),
//                             //     );
//                             //   }).toList(),
//                             // ),
//                           ),
//                           const SizedBox(
//                             height: 14,
//                           ),
//                           // YoutubePlayer(
//                           //   controller: _controller!,
//                           //   aspectRatio: 16 / 9,
//                           // ),
//                           Container(
//                             width: SizeConfig.screenWidth,
//                             height: 175,
//                             alignment: Alignment.center,
//                             decoration: ShapeDecoration(
//                                 color: Colors.black
//                                     .withOpacity(0.05000000074505806),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5)),
//                                 image: DecorationImage(
//                                     fit: BoxFit.fill,
//                                     image: NetworkImage(widget
//                                             .collectinListData.thumbnailImage ??
//                                         '') //AssetImage(ImageConstant.thumbnail7)
//                                     )),
//                             child: GestureDetector(
//                               onTap: () {
//                                 if (_courseRegistered) {
//                                   PersistentNavBarNavigator.pushNewScreen(
//                                     context,
//                                     screen: YoutubePlayerFullscreen(
//                                         videoId: (widget
//                                             .collectinListData.introVideo!
//                                             .split("v=")
//                                             .last) //'lNQJNImBsKY',
//                                         ),
//                                     withNavBar:
//                                         false, // OPTIONAL VALUE. True by default.
//                                     pageTransitionAnimation:
//                                         PageTransitionAnimation.cupertino,
//                                   ).then((value) {
//                                     // Util.showLoader(context);
//                                     // dataProvider
//                                     //     .fetchWatchVideo(
//                                     //         context,
//                                     //         widget.collectinListData.id ?? 0,
//                                     //         widget.onLogout)
//                                     //     .then((value) {
//                                     //Navigator.of(context, rootNavigator: true).pop();
//                                     setState(() {
//                                       _videoWatched = true;
//                                     });
//                                     //   });
//                                   });
//                                 } else {
//                                   Util.displayToast(
//                                       context,
//                                       "Please register your course",
//                                       CommonColor.redColors);
//                                 }
//                               },
//                               child: Container(
//                                   width: 57,
//                                   height: 57,
//                                   alignment: Alignment.center,
//                                   decoration: const ShapeDecoration(
//                                     color: Colors.white,
//                                     shape: CircleBorder(side: BorderSide.none),
//                                   ),
//                                   //color: CommonColor.whiteColor,
//                                   child: const Icon(
//                                     Icons.play_arrow_outlined,
//                                     size: 30,
//                                   )),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextWidget(
//                               textAlign: TextAlign.start,
//                               text: widget.collectinListData.subTitle ??
//                                   '', //'Introduction to React for beginners',
//                               color: CommonColor.blackColor1,
//                               maxLine: 2,
//                               fontFamily: AppStrings.sfProDisplay,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 16),
//                           TextWidget(
//                               textAlign: TextAlign.start,
//                               text:
//                                   '0:00 / ${widget.collectinListData.totalTime}', //'0:00 / 7:48',
//                               color: CommonColor.greyColor6,
//                               maxLine: 2,
//                               fontFamily: AppStrings.sfProDisplay,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 12),
//                           const SizedBox(
//                             height: 14,
//                           ),
//                           _appearInTest
//                               ? GestureDetector(
//                                   onTap: () {
//                                     if (_videoWatched) {
//                                       Util.showLoader(context);
//                                       dataProvider
//                                           .fetchCheckUserCourseAvailability(
//                                               context, () {
//                                         Util.logout(context);
//                                       }).then((value) {
//                                         Navigator.of(context,
//                                                 rootNavigator: true)
//                                             .pop();
//                                         if (value) {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     AppearTestAndScheduleInterviewWebPage(
//                                                       collectinListData: widget
//                                                           .collectinListData,
//                                                     )),
//                                           );
//                                         }
//                                       });
//                                     } else {
//                                       Util.displayToast(
//                                           context,
//                                           "Please watch the course first",
//                                           CommonColor.redColors);
//                                     }
//                                   },
//                                   child: Container(
//                                     width: SizeConfig.screenWidth,
//                                     height: 44,
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 18, vertical: 10),
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: ShapeDecoration(
//                                       color: Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                         side: const BorderSide(
//                                             width: 0.50,
//                                             color: CommonColor.greyColor5),
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
//                                     child: const Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Icon(
//                                           Icons.edit,
//                                           color: CommonColor.blackColor4,
//                                           size: 24,
//                                         ),
//                                         SizedBox(
//                                           width: 8,
//                                         ),
//                                         Text(
//                                           AppStrings.appearInTest,
//                                           style: TextStyle(
//                                             color: CommonColor.blackColor4,
//                                             fontSize: 16,
//                                             fontFamily: AppStrings.inter,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               : GestureDetector(
//                                   onTap: () {
//                                     Util.showLoader(context);
//                                     dataProvider.fetchCourseRegister(
//                                         context,
//                                         widget.collectinListData.id ?? 0,
//                                         (dataProvider.coursePriceResponseData
//                                                     .courseReteId ??
//                                                 0)
//                                             .toString(), () {
//                                       Util.logout(context);
//                                     }).then((value) {
//                                       Navigator.of(context, rootNavigator: true)
//                                           .pop();
//                                       if (value) {
//                                         courseRegistrationSuccessfulBottomSheet(
//                                                 dataProvider.registrationMsg)
//                                             .then((value) {
//                                           if (true) {
//                                             setState(() {
//                                               _appearInTest = true;
//                                               _courseRegistered = true;
//                                             });
//                                           }
//                                         });
//                                       }
//                                     });
//                                   },
//                                   child: Container(
//                                     width: SizeConfig.screenWidth,
//                                     height: 44,
//                                     alignment: Alignment.center,
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 18, vertical: 10),
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: ShapeDecoration(
//                                       color: CommonColor.blueColor1,
//                                       shape: RoundedRectangleBorder(
//                                         side: const BorderSide(
//                                             width: 0.50,
//                                             color: CommonColor.blueColor1),
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                     ),
//                                     child: const TextWidget(
//                                         text: AppStrings.registerInThisCourse,
//                                         color: CommonColor.whiteColor,
//                                         maxLine: 1,
//                                         fontFamily: AppStrings.inter,
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 16),
//                                   ),
//                                 ),
//                           const SizedBox(
//                             height: 35,
//                           ),
//                           Container(
//                             width: SizeConfig.screenWidth,
//                             height: 1,
//                             color: CommonColor.greyColor5,
//                           ),
//                           const SizedBox(
//                             height: 35,
//                           ),
//                           const TextWidget(
//                               text: AppStrings.courseContent,
//                               color: CommonColor.headingTextColor1,
//                               maxLine: 1,
//                               fontFamily: AppStrings.sfProDisplay,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 16),
//                           const SizedBox(
//                             height: 12,
//                           ),
//                           Container(
//                             width: SizeConfig.screenWidth,
//                             padding: const EdgeInsets.only(
//                               top: 20,
//                               left: 20,
//                               right: 20,
//                               bottom: 10,
//                             ),
//                             decoration: ShapeDecoration(
//                               color: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               shadows: const [
//                                 BoxShadow(
//                                   color: Color(0x0C000000),
//                                   blurRadius: 20,
//                                   offset: Offset(0, 4),
//                                   spreadRadius: 0,
//                                 )
//                               ],
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(20.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   ListView.separated(
//                                     shrinkWrap: true,
//                                     itemCount: dataProvider
//                                         .viewCourseContentData
//                                         .length, //AppStrings.courseContentList.length,
//                                     physics:
//                                         const NeverScrollableScrollPhysics(),
//                                     itemBuilder: (context, index1) {
//                                       return ExpansionTile(
//                                         initiallyExpanded: true,
//                                         title: const TextWidget(
//                                             textAlign: TextAlign.start,
//                                             text:
//                                                 '', //AppStrings.courseContentList[index1],
//                                             color: CommonColor.blackColor2,
//                                             maxLine: 2,
//                                             fontFamily: AppStrings.sfProDisplay,
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 16),
//                                         subtitle: TextWidget(
//                                             text:
//                                                 '1 / 3  |  ${dataProvider.viewCourseContentData[index1]}',
//                                             color: CommonColor.blackColor2,
//                                             maxLine: 1,
//                                             fontFamily: AppStrings.sfProDisplay,
//                                             fontWeight: FontWeight.w400,
//                                             fontSize: 12),
//                                         children: [
//                                           ListView.separated(
//                                             shrinkWrap: true,
//                                             itemCount: 3,
//                                             // AppStrings
//                                             //     .courseContentSubList[index1].length,
//                                             physics:
//                                                 const NeverScrollableScrollPhysics(),
//                                             itemBuilder: (context, index2) {
//                                               // final checked = _selectedValues[index1]
//                                               //     .contains(
//                                               //         'Introduction to React for beginners1');
//                                               return CheckboxListTile(
//                                                 value: false,
//                                                 title: const Text(
//                                                     // AppStrings
//                                                     //       .courseContentSubList[index1]
//                                                     //   [index2]
//                                                     'Introduction to React for beginners1'),
//                                                 controlAffinity:
//                                                     ListTileControlAffinity
//                                                         .leading,

//                                                 /// TODO ///
//                                                 onChanged: (checked) =>
//                                                     _onItemCheckedChange(
//                                                         // AppStrings.courseContentSubList[
//                                                         //     index1][index2],
//                                                         'Introduction to React for beginners1',
//                                                         checked!,
//                                                         index1),
//                                               );
//                                             },
//                                             separatorBuilder:
//                                                 (context, index2) {
//                                               return const SizedBox(
//                                                 height: 8,
//                                               );
//                                             },
//                                           )
//                                         ],
//                                       );
//                                     },
//                                     separatorBuilder: (context, index) {
//                                       return const SizedBox(
//                                         height: 26,
//                                       );
//                                     },
//                                   ),
//                                   const SizedBox(
//                                     height: 15,
//                                   ),
//                                   const TextWidget(
//                                       text: AppStrings.endOfYourCourse,
//                                       color: CommonColor.greyColor7,
//                                       maxLine: 1,
//                                       fontFamily: AppStrings.sfProDisplay,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Visibility(
//                             visible: _appearInTest,
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.only(top: 24, bottom: 20),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   if (_videoWatched) {
//                                     Util.showLoader(context);

//                                     dataProvider
//                                         .fetchCheckUserCourseAvailability(
//                                             context, () {
//                                       Util.logout(context);
//                                     }).then((value) {
//                                       Navigator.of(context, rootNavigator: true)
//                                           .pop();
//                                       if (value) {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   AppearTestAndScheduleInterviewWebPage(
//                                                     collectinListData: widget
//                                                         .collectinListData,
//                                                   )),
//                                         );
//                                       }
//                                     });
//                                   } else {
//                                     Util.displayToast(
//                                         context,
//                                         "Please watch the course first",
//                                         CommonColor.redColors);
//                                   }
//                                 },
//                                 child: Container(
//                                   width: SizeConfig.screenWidth,
//                                   height: 44,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 18, vertical: 10),
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
//                                       Icon(
//                                         Icons.edit,
//                                         color: CommonColor.blackColor4,
//                                         size: 24,
//                                       ),
//                                       SizedBox(
//                                         width: 8,
//                                       ),
//                                       Text(
//                                         AppStrings.appearInTest,
//                                         style: TextStyle(
//                                           color: CommonColor.blackColor4,
//                                           fontSize: 16,
//                                           fontFamily: AppStrings.inter,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           const TextWidget(
//                               text: AppStrings.courseDiscussionForum,
//                               color: CommonColor.headingTextColor1,
//                               maxLine: 1,
//                               fontFamily: AppStrings.sfProDisplay,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 16),
//                           const SizedBox(
//                             height: 18,
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 _writeMessage = true;
//                               });
//                             },
//                             child: Container(
//                               width: SizeConfig.screenWidth,
//                               height: 58,
//                               alignment: Alignment.center,
//                               decoration: ShapeDecoration(
//                                 shape: RoundedRectangleBorder(
//                                   side: const BorderSide(
//                                       width: 0.50,
//                                       color: CommonColor.greyColor5),
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: 20,
//                                     height: 20,
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: const BoxDecoration(),
//                                     child: const Icon(
//                                       Icons.add_box_outlined,
//                                       color: CommonColor.greyColor8,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 8,
//                                   ),
//                                   const TextWidget(
//                                       text: AppStrings.writeMessage,
//                                       color: CommonColor.greyColor8,
//                                       maxLine: 1,
//                                       fontFamily: AppStrings.inter,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Visibility(
//                             visible: _writeMessage,
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.only(top: 20, bottom: 30),
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     // height: 281,
//                                     width: SizeConfig.screenWidth,
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 14, vertical: 10),
//                                     child: TextFormFieldWidget(
//                                       controller: _editorController,
//                                       valtext: AppStrings.commonTextVal,
//                                       height: 45,
//                                       hintText: "Wirte a post ....",
//                                       readOnly: false,
//                                       maxLine: 7,
//                                       keyType: TextInputType.text,
//                                       wordLimit: 300,
//                                       fontFamily: AppStrings.inter,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       onChanged: (value) {},
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 15,
//                                   ),
//                                   Row(
//                                     children: [
//                                       GestureDetector(
//                                         onTap: () {
//                                           setState(() {
//                                             _writeMessage = false;
//                                             //controller.disable();
//                                           });
//                                         },
//                                         child: Container(
//                                           width: 90,
//                                           height: 44,
//                                           alignment: Alignment.center,
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 18, vertical: 10),
//                                           clipBehavior: Clip.antiAlias,
//                                           decoration: ShapeDecoration(
//                                             color: CommonColor.whiteColor,
//                                             shape: RoundedRectangleBorder(
//                                               side: const BorderSide(
//                                                   width: 0.50,
//                                                   color:
//                                                       CommonColor.greyColor5),
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                             ),
//                                           ),
//                                           child: const TextWidget(
//                                               text: AppStrings.cancel,
//                                               color: CommonColor.blackColor4,
//                                               maxLine: 1,
//                                               fontFamily: AppStrings.inter,
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 16),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         width: 18,
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           if (_editorController
//                                               .text.isNotEmpty) {
//                                             Util.showLoader(context);
//                                             dataProvider.addComment(
//                                                 context,
//                                                 widget.collectinListData.id ??
//                                                     0,
//                                                 _editorController.text, () {
//                                               Util.logout(context);
//                                             }).then((value) {
//                                               if (value) {
//                                                 dataProvider
//                                                     .getViewCommentsData(
//                                                         context,
//                                                         widget.collectinListData
//                                                                 .id ??
//                                                             0, () {
//                                                   Util.logout(context);
//                                                 }).then((value) {
//                                                   setState(() {
//                                                     _editorController.text = '';
//                                                   });
//                                                   Navigator.of(context,
//                                                           rootNavigator: true)
//                                                       .pop();
//                                                 });
//                                               } else {
//                                                 Navigator.of(context,
//                                                         rootNavigator: true)
//                                                     .pop();
//                                               }
//                                             });
//                                           } else {
//                                             Util.displayToast(
//                                                 context,
//                                                 "Please make a comment",
//                                                 CommonColor.redColors);
//                                           }
//                                         },
//                                         child: Container(
//                                           width: 108,
//                                           height: 44,
//                                           alignment: Alignment.center,
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 18, vertical: 10),
//                                           clipBehavior: Clip.antiAlias,
//                                           decoration: ShapeDecoration(
//                                             color: CommonColor.blueColor1,
//                                             shape: RoundedRectangleBorder(
//                                               side: const BorderSide(
//                                                   width: 0.50,
//                                                   color:
//                                                       CommonColor.blueColor1),
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                             ),
//                                           ),
//                                           child: const TextWidget(
//                                               text: AppStrings.postNow,
//                                               color: CommonColor.whiteColor,
//                                               maxLine: 1,
//                                               fontFamily: AppStrings.inter,
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 16),
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           ListView.separated(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount:
//                                 dataProvider.viewCommentResponseDataList.length,
//                             separatorBuilder: (context, ind) {
//                               return const SizedBox(
//                                 height: 15,
//                               );
//                             },
//                             itemBuilder: (context, index) {
//                               return Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Container(
//                                         width: 50,
//                                         height: 50,
//                                         decoration: const ShapeDecoration(
//                                           color: CommonColor.greyColor9,
//                                           shape: CircleBorder(),
//                                         ),
//                                         child: Image.asset(
//                                             ImageConstant.profilePic),
//                                       ),
//                                       const SizedBox(
//                                         width: 15,
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const TextWidget(
//                                               text: 'Joydeep Chatterjee',
//                                               color:
//                                                   CommonColor.headingTextColor1,
//                                               maxLine: 1,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 18),
//                                           TextWidget(
//                                               text:
//                                                   '${FormatedDateTime.formatedDateTime1(dataProvider.viewCommentResponseDataList[index].updatedAt.toString(), inputFormat: 'yyyy-MM-dd', outputFormat: 'yMd')}, at ${FormatedDateTime.formatedTime(dataProvider.viewCommentResponseDataList[index].updatedAt.toString())}', //'Yesterday at 6:24 PM',
//                                               color: CommonColor.greyColor10,
//                                               maxLine: 1,
//                                               fontFamily:
//                                                   AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 12),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   TextWidget(
//                                       text: dataProvider
//                                               .viewCommentResponseDataList[
//                                                   index]
//                                               .commentText ??
//                                           '',
//                                       // "Hello there! It's great to hear that you're interested in a React dev course. React is a popular and widely used JavaScript library for building user interfaces. With React, you can create interactive and dynamic web applications that are responsive and easy to maintain.",
//                                       color: CommonColor.headingTextColor1,
//                                       maxLine: 5,
//                                       fontFamily: AppStrings.sfProDisplay,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 14),
//                                 ],
//                               );
//                             },
//                           ),

//                           const SizedBox(
//                             height: 25,
//                           ),
//                           /* Padding(
//                             padding: const EdgeInsets.only(
//                               left: 20,
//                               right: 20,
//                               top: 25,
//                               bottom: 25,
//                             ),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   width: 32,
//                                   height: 32,
//                                   decoration: ShapeDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(ImageConstant.profilePic),
//                                       fit: BoxFit.fill,
//                                     ),
//                                     shape: const CircleBorder(),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 12,
//                                 ),
//                                 Expanded(
//                                     child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: const [
//                                     TextWidget(
//                                         text: 'Salvia Rose',
//                                         color: CommonColor.headingTextColor1,
//                                         maxLine: 1,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 18),
//                                     TextWidget(
//                                         text: 'Yesterday at 8:24 PM',
//                                         color: CommonColor.greyColor10,
//                                         maxLine: 1,
//                                         fontFamily: AppStrings.sfProDisplay,
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 12),
//                                     SizedBox(
//                                       height: 6,
//                                     ),
//                                     Text.rich(
//                                       TextSpan(
//                                         children: [
//                                           TextSpan(
//                                             text: 'I agree with you. Mr. Joydeep! \n',
//                                             style: TextStyle(
//                                               color: CommonColor.greyColor11,
//                                               fontSize: 14,
//                                               fontFamily: AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                             text: '@PeyushBansal',
//                                             style: TextStyle(
//                                               color: CommonColor.greyColor11,
//                                               fontSize: 14,
//                                               fontFamily: AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                             text: ' See this. ✋\n',
//                                             style: TextStyle(
//                                               color: CommonColor.greyColor11,
//                                               fontSize: 14,
//                                               fontFamily: AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 8,
//                                     ),
//                                     Text.rich(
//                                       TextSpan(
//                                         children: [
//                                           TextSpan(
//                                             text: 'Reply  • ',
//                                             style: TextStyle(
//                                               color: CommonColor.greyColor12,
//                                               fontSize: 12,
//                                               fontFamily: AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                             text: ' Pin this thread ',
//                                             style: TextStyle(
//                                               color: CommonColor.greyColor11,
//                                               fontSize: 12,
//                                               fontFamily: AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                             text: ' •  Remove',
//                                             style: TextStyle(
//                                               color: CommonColor.greyColor12,
//                                               fontSize: 12,
//                                               fontFamily: AppStrings.sfProDisplay,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ))
//                               ],
//                             ),
//                           )
//                        */
//                         ],
//                       ),
//                     ),
//                   );
//                 })
//                 //  LayoutBuilder(
//                 //   builder: (context, constraints) {
//                 //     if (kIsWeb && constraints.maxWidth > 750) {
//                 //       return Row(
//                 //         crossAxisAlignment: CrossAxisAlignment.start,
//                 //         children: [
//                 //           Expanded(
//                 //             flex: 3,
//                 //             child: Column(
//                 //               children: [
//                 //                 player,
//                 //                 const VideoPositionIndicator(),
//                 //               ],
//                 //             ),
//                 //           ),
//                 //           const Expanded(
//                 //             flex: 2,
//                 //             child: SingleChildScrollView(
//                 //               child: Controls(),
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       );
//                 //     }

//                 //     return ListView(
//                 //       children: [
//                 //         player,
//                 //         const VideoPositionIndicator(),
//                 //         const Controls(),
//                 //       ],
//                 //     );
//                 //   },
//                 // ),
//                 ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<bool> courseRegistrationSuccessfulBottomSheet(String msg) async {
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
//             builder: (context) {
//               return Padding(
//                 padding: EdgeInsets.only(
//                     left: SizeConfig.screenWidth! > 900
//                         ? SizeConfig.screenWidth! * 0.5
//                         : 0,
//                     right: 12,
//                     bottom: 60),
//                 child: StatefulBuilder(
//                     builder: (BuildContext context, StateSetter setState) {
//                   return Container(
//                       height: 215,
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
//                             right: 17, left: 21, top: 15, bottom: 15),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Icon(
//                                   Icons.check_circle_outline_outlined,
//                                   color: CommonColor.greenColor1,
//                                 ),
//                                 const SizedBox(
//                                   width: 8,
//                                 ),
//                                 const TextWidget(
//                                     text:
//                                         AppStrings.courseRegistrationSuccessful,
//                                     color: CommonColor.greenColor1,
//                                     maxLine: 2,
//                                     fontFamily: AppStrings.aeonikTRIAL,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 16),
//                                 const SizedBox(
//                                   width: 8,
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.pop(context, true);
//                                   },
//                                   child: Container(
//                                     width: 36,
//                                     height: 36,
//                                     padding: const EdgeInsets.all(8),
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: ShapeDecoration(
//                                       color: Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                         side: const BorderSide(
//                                             width: 0.50,
//                                             color: CommonColor.greyColor5),
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
//                                     child: Container(
//                                         width: 20,
//                                         height: 20,
//                                         alignment: Alignment.center,
//                                         decoration: const BoxDecoration(),
//                                         child: const Icon(
//                                           Icons.clear,
//                                           size: 18,
//                                         )),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 30,
//                             ),
//                             TextWidget(
//                                 text: msg,
//                                 //'You have successfully registered to this couse - React Native IOS and Android App Development for Beginners (KM0063)',
//                                 color: CommonColor.blackColor1,
//                                 maxLine: 5,
//                                 fontFamily: AppStrings.sfProDisplay,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16),
//                           ],
//                         ),
//                       ));
//                 }),
//               );
//             }) ??
//         false; //if showDialouge had returned null, then return false
//   }
// }
