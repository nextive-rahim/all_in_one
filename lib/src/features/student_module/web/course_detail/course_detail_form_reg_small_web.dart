// import 'package:all_in_one/src/core/utils/colors.dart';
// import 'package:all_in_one/src/core/utils/image_constant.dart';
// import 'package:all_in_one/src/core/utils/size_config.dart';
// import 'package:all_in_one/src/core/utils/strings.dart';
// import 'package:all_in_one/src/core/widgets/my_youtube_player.dart';
// import 'package:all_in_one/src/core/widgets/text_form_field.dart';
// import 'package:all_in_one/src/core/widgets/text_widget.dart';
// import 'package:all_in_one/src/core/widgets/web/side_nav_bar_student.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// class CourseDetailFormRegisterSmallWebPage extends StatefulWidget {
//   const CourseDetailFormRegisterSmallWebPage({
//     super.key,
//   });

//   @override
//   State<CourseDetailFormRegisterSmallWebPage> createState() =>
//       _CourseDetailFormRegisterSmallWebPageState();
// }

// class _CourseDetailFormRegisterSmallWebPageState
//     extends State<CourseDetailFormRegisterSmallWebPage> {
//   bool _appearInTest = false, _writeMessage = false;
//   final _editorController = TextEditingController();

//   String? editorResult = '';

//   // YoutubePlayerController? _controller;
//   String dropdownValue = AppStrings.courseLevelDropdown.first;
//   final List<List<String>> _selectedValues = [[], [], []];
//   @override
//   void initState() {
//     //  _fetchDummyData();

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
//     setState(() {
//       if (checked) {
//         _selectedValues[index1].add(itemValue);
//       } else {
//         _selectedValues[index1].remove(itemValue);
//       }
//     });
//   }

//   bool jobDropdownOpen = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(
//         //   elevation: 0,
//         //   backgroundColor: CommonColor.whiteColor,
//         //   title: const TextWidget(
//         //       text: "Back",
//         //       color: CommonColor.headingTextColor1,
//         //       maxLine: 1,
//         //       fontFamily: AppStrings.inter,
//         //       fontWeight: FontWeight.w500,
//         //       fontSize: 14),
//         //   leading: GestureDetector(
//         //     onTap: () {
//         //       Navigator.pop(context);
//         //     },
//         //     child: const Icon(
//         //       Icons.arrow_back_ios,
//         //       color: CommonColor.blackColor,
//         //       size: 18,
//         //     ),
//         //   ),
//         // ),
//         body: Row(
//       children: [
//         SideNavBarStudent(
//           jobDropdownOpen: jobDropdownOpen,
//           screenLarge: false,
//           onChangedjobDropdown: (val) {
//             setState(() {
//               jobDropdownOpen = !jobDropdownOpen;
//             });
//           },
//           onChangedNavigation: (val) {},
//         ),
//         Expanded(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   top: 20, right: 17, left: 20, bottom: 60),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Icon(
//                           Icons.arrow_back_ios,
//                           color: CommonColor.blackColor,
//                           size: 18,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 16,
//                       ),
//                       const TextWidget(
//                           text: "Back",
//                           color: CommonColor.headingTextColor1,
//                           maxLine: 1,
//                           fontFamily: AppStrings.inter,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 36,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: SizeConfig.screenWidth! * 0.6,
//                         child: const TextWidget(
//                             textAlign: TextAlign.start,
//                             text:
//                                 'React Native IOS and Android App Development for Beginners',
//                             color: CommonColor.blackColor1,
//                             maxLine: 2,
//                             fontFamily: AppStrings.aeonikTRIAL,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 16),
//                       ),
//                       Container(
//                         width: 36,
//                         height: 36,
//                         padding: const EdgeInsets.all(8),
//                         clipBehavior: Clip.antiAlias,
//                         alignment: Alignment.center,
//                         decoration: ShapeDecoration(
//                           color: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             side: const BorderSide(
//                                 width: 0.50, color: CommonColor.greyColor5),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Icon(Icons.share_outlined),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   const Text.rich(
//                     TextSpan(
//                       children: [
//                         TextSpan(
//                           text: '3 hours 12 mins',
//                           style: TextStyle(
//                             color: CommonColor.greyColor6,
//                             fontSize: 12,
//                             fontFamily: AppStrings.sfProDisplay,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         TextSpan(
//                           text: ' / By Daniel Scott',
//                           style: TextStyle(
//                             color: CommonColor.greyColor6,
//                             fontSize: 12,
//                             fontFamily: AppStrings.sfProDisplay,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 22,
//                   ),
//                   const TextWidget(
//                       textAlign: TextAlign.start,
//                       text: AppStrings.courseLevel,
//                       color: CommonColor.headingTextColor1,
//                       maxLine: 2,
//                       fontFamily: AppStrings.aeonikTRIAL,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16),
//                   const SizedBox(
//                     height: 14,
//                   ),
//                   Container(
//                     width: 142,
//                     height: 36,
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                     clipBehavior: Clip.antiAlias,
//                     decoration: ShapeDecoration(
//                       color: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         side: const BorderSide(
//                             width: 0.50, color: CommonColor.greyColor5),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: DropdownButton<String>(
//                       value: dropdownValue,
//                       underline: Container(),
//                       icon: const Icon(Icons.expand_more),
//                       style: const TextStyle(color: Colors.black),
//                       onChanged: (String? value) {
//                         dropdownValue = value!;
//                         setState(() {});
//                       },
//                       items: AppStrings.courseLevelDropdown
//                           .map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 14,
//                   ),
//                   // YoutubePlayer(
//                   //   controller: _controller!,
//                   //   aspectRatio: 16 / 9,
//                   // ),
//                   Container(
//                     width: SizeConfig.screenWidth,
//                     height: 175,
//                     alignment: Alignment.center,
//                     decoration: ShapeDecoration(
//                         color: Colors.black.withOpacity(0.05000000074505806),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         image: DecorationImage(
//                             fit: BoxFit.fill,
//                             image: AssetImage(ImageConstant.thumbnail7))),
//                     child: GestureDetector(
//                       onTap: () {
//                         PersistentNavBarNavigator.pushNewScreen(
//                           context,
//                           screen: const YoutubePlayerFullscreen(
//                             videoId: 'lNQJNImBsKY',
//                           ),
//                           withNavBar: false, // OPTIONAL VALUE. True by default.
//                           pageTransitionAnimation:
//                               PageTransitionAnimation.cupertino,
//                         );
//                       },
//                       child: Container(
//                           width: 57,
//                           height: 57,
//                           alignment: Alignment.center,
//                           decoration: const ShapeDecoration(
//                             color: Colors.white,
//                             shape: CircleBorder(side: BorderSide.none),
//                           ),
//                           //color: CommonColor.whiteColor,
//                           child: const Icon(
//                             Icons.play_arrow_outlined,
//                             size: 30,
//                           )),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const TextWidget(
//                       textAlign: TextAlign.start,
//                       text: 'Introduction to React for beginners',
//                       color: CommonColor.blackColor1,
//                       maxLine: 2,
//                       fontFamily: AppStrings.sfProDisplay,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16),
//                   const TextWidget(
//                       textAlign: TextAlign.start,
//                       text: '0:00 / 7:48',
//                       color: CommonColor.greyColor6,
//                       maxLine: 2,
//                       fontFamily: AppStrings.sfProDisplay,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 12),
//                   const SizedBox(
//                     height: 14,
//                   ),
//                   _appearInTest
//                       ? GestureDetector(
//                           onTap: () {},
//                           child: Container(
//                             width: SizeConfig.screenWidth,
//                             height: 44,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 18, vertical: 10),
//                             clipBehavior: Clip.antiAlias,
//                             decoration: ShapeDecoration(
//                               color: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                 side: const BorderSide(
//                                     width: 0.50, color: CommonColor.greyColor5),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               shadows: const [
//                                 BoxShadow(
//                                   color: CommonColor.blackColor3,
//                                   blurRadius: 2,
//                                   offset: Offset(0, 1),
//                                   spreadRadius: 0,
//                                 )
//                               ],
//                             ),
//                             child: const Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.edit,
//                                   color: CommonColor.blackColor4,
//                                   size: 24,
//                                 ),
//                                 SizedBox(
//                                   width: 8,
//                                 ),
//                                 Text(
//                                   AppStrings.appearInTest,
//                                   style: TextStyle(
//                                     color: CommonColor.blackColor4,
//                                     fontSize: 16,
//                                     fontFamily: AppStrings.inter,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       : GestureDetector(
//                           onTap: () {
//                             courseRegistrationSuccessfulBottomSheet()
//                                 .then((value) {
//                               if (true) {
//                                 setState(() {
//                                   _appearInTest = true;
//                                 });
//                               }
//                             });
//                           },
//                           child: Container(
//                             width: SizeConfig.screenWidth,
//                             height: 44,
//                             alignment: Alignment.center,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 18, vertical: 10),
//                             clipBehavior: Clip.antiAlias,
//                             decoration: ShapeDecoration(
//                               color: CommonColor.blueColor1,
//                               shape: RoundedRectangleBorder(
//                                 side: const BorderSide(
//                                     width: 0.50, color: CommonColor.blueColor1),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: const TextWidget(
//                                 text: AppStrings.registerInThisCourse,
//                                 color: CommonColor.whiteColor,
//                                 maxLine: 1,
//                                 fontFamily: AppStrings.inter,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 16),
//                           ),
//                         ),
//                   const SizedBox(
//                     height: 35,
//                   ),
//                   Container(
//                     width: SizeConfig.screenWidth,
//                     height: 1,
//                     color: CommonColor.greyColor5,
//                   ),
//                   const SizedBox(
//                     height: 35,
//                   ),
//                   const TextWidget(
//                       text: AppStrings.courseContent,
//                       color: CommonColor.headingTextColor1,
//                       maxLine: 1,
//                       fontFamily: AppStrings.sfProDisplay,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Container(
//                     width: SizeConfig.screenWidth,
//                     padding: const EdgeInsets.only(
//                       top: 20,
//                       left: 20,
//                       right: 20,
//                       bottom: 10,
//                     ),
//                     decoration: ShapeDecoration(
//                       color: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       shadows: const [
//                         BoxShadow(
//                           color: Color(0x0C000000),
//                           blurRadius: 20,
//                           offset: Offset(0, 4),
//                           spreadRadius: 0,
//                         )
//                       ],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           ListView.separated(
//                             shrinkWrap: true,
//                             itemCount: AppStrings.courseContentList.length,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemBuilder: (context, index1) {
//                               return ExpansionTile(
//                                 initiallyExpanded: true,
//                                 title: TextWidget(
//                                     textAlign: TextAlign.start,
//                                     text: AppStrings.courseContentList[index1],
//                                     color: CommonColor.blackColor2,
//                                     maxLine: 2,
//                                     fontFamily: AppStrings.sfProDisplay,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 16),
//                                 subtitle: const TextWidget(
//                                     text: '1 / 3  |  19 min',
//                                     color: CommonColor.blackColor2,
//                                     maxLine: 1,
//                                     fontFamily: AppStrings.sfProDisplay,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 12),
//                                 children: [
//                                   ListView.separated(
//                                     shrinkWrap: true,
//                                     itemCount: AppStrings
//                                         .courseContentSubList[index1].length,
//                                     physics:
//                                         const NeverScrollableScrollPhysics(),
//                                     itemBuilder: (context, index2) {
//                                       final checked = _selectedValues[index1]
//                                           .contains(AppStrings
//                                                   .courseContentSubList[index1]
//                                               [index2]);
//                                       return CheckboxListTile(
//                                         value: checked,
//                                         title: Text(AppStrings
//                                                 .courseContentSubList[index1]
//                                             [index2]),
//                                         controlAffinity:
//                                             ListTileControlAffinity.leading,
//                                         onChanged: (checked) =>
//                                             _onItemCheckedChange(
//                                                 AppStrings.courseContentSubList[
//                                                     index1][index2],
//                                                 checked!,
//                                                 index1),
//                                       );
//                                     },
//                                     separatorBuilder: (context, index2) {
//                                       return const SizedBox(
//                                         height: 8,
//                                       );
//                                     },
//                                   )
//                                 ],
//                               );
//                             },
//                             separatorBuilder: (context, index) {
//                               return const SizedBox(
//                                 height: 26,
//                               );
//                             },
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           const TextWidget(
//                               text: AppStrings.endOfYourCourse,
//                               color: CommonColor.greyColor7,
//                               maxLine: 1,
//                               fontFamily: AppStrings.sfProDisplay,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 14),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Visibility(
//                     visible: _appearInTest,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 24, bottom: 20),
//                       child: GestureDetector(
//                         onTap: () {},
//                         child: Container(
//                           width: SizeConfig.screenWidth,
//                           height: 44,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 18, vertical: 10),
//                           clipBehavior: Clip.antiAlias,
//                           decoration: ShapeDecoration(
//                             color: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               side: const BorderSide(
//                                   width: 0.50, color: CommonColor.greyColor5),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             shadows: const [
//                               BoxShadow(
//                                 color: CommonColor.blackColor3,
//                                 blurRadius: 2,
//                                 offset: Offset(0, 1),
//                                 spreadRadius: 0,
//                               )
//                             ],
//                           ),
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.edit,
//                                 color: CommonColor.blackColor4,
//                                 size: 24,
//                               ),
//                               SizedBox(
//                                 width: 8,
//                               ),
//                               Text(
//                                 AppStrings.appearInTest,
//                                 style: TextStyle(
//                                   color: CommonColor.blackColor4,
//                                   fontSize: 16,
//                                   fontFamily: AppStrings.inter,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   const TextWidget(
//                       text: AppStrings.courseDiscussionForum,
//                       color: CommonColor.headingTextColor1,
//                       maxLine: 1,
//                       fontFamily: AppStrings.sfProDisplay,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16),
//                   const SizedBox(
//                     height: 18,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _writeMessage = true;
//                       });
//                     },
//                     child: Container(
//                       width: SizeConfig.screenWidth,
//                       height: 58,
//                       alignment: Alignment.center,
//                       decoration: ShapeDecoration(
//                         shape: RoundedRectangleBorder(
//                           side: const BorderSide(
//                               width: 0.50, color: CommonColor.greyColor5),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: 20,
//                             height: 20,
//                             clipBehavior: Clip.antiAlias,
//                             decoration: const BoxDecoration(),
//                             child: const Icon(
//                               Icons.add_box_outlined,
//                               color: CommonColor.greyColor8,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 8,
//                           ),
//                           const TextWidget(
//                               text: AppStrings.writeMessage,
//                               color: CommonColor.greyColor8,
//                               maxLine: 1,
//                               fontFamily: AppStrings.inter,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 14),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Visibility(
//                     visible: _writeMessage,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 20, bottom: 30),
//                       child: Column(
//                         children: [
//                           Container(
//                             //  height: 281,
//                             width: SizeConfig.screenWidth,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 14, vertical: 10),
//                             child: TextFormFieldWidget(
//                               controller: _editorController,
//                               valtext: AppStrings.commonTextVal,
//                               height: 45,
//                               hintText: AppStrings.hitTextUsername,
//                               readOnly: false,
//                               maxLine: 7,
//                               keyType: TextInputType.text,
//                               wordLimit: 25,
//                               fontFamily: AppStrings.inter,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                               onChanged: (value) {},
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     _writeMessage = false;
//                                     // controller.disable();
//                                   });
//                                 },
//                                 child: Container(
//                                   width: 90,
//                                   height: 44,
//                                   alignment: Alignment.center,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 18, vertical: 10),
//                                   clipBehavior: Clip.antiAlias,
//                                   decoration: ShapeDecoration(
//                                     color: CommonColor.whiteColor,
//                                     shape: RoundedRectangleBorder(
//                                       side: const BorderSide(
//                                           width: 0.50,
//                                           color: CommonColor.greyColor5),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                   child: const TextWidget(
//                                       text: AppStrings.cancel,
//                                       color: CommonColor.blackColor4,
//                                       maxLine: 1,
//                                       fontFamily: AppStrings.inter,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 16),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 18,
//                               ),
//                               GestureDetector(
//                                 onTap: () {},
//                                 child: Container(
//                                   width: 108,
//                                   height: 44,
//                                   alignment: Alignment.center,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 18, vertical: 10),
//                                   clipBehavior: Clip.antiAlias,
//                                   decoration: ShapeDecoration(
//                                     color: CommonColor.blueColor1,
//                                     shape: RoundedRectangleBorder(
//                                       side: const BorderSide(
//                                           width: 0.50,
//                                           color: CommonColor.blueColor1),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                   child: const TextWidget(
//                                       text: AppStrings.postNow,
//                                       color: CommonColor.whiteColor,
//                                       maxLine: 1,
//                                       fontFamily: AppStrings.inter,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 16),
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: 50,
//                         height: 50,
//                         decoration: const ShapeDecoration(
//                           color: CommonColor.greyColor9,
//                           shape: CircleBorder(),
//                         ),
//                         child: Image.asset(ImageConstant.profilePic),
//                       ),
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TextWidget(
//                               text: 'Joydeep Chatterjee',
//                               color: CommonColor.headingTextColor1,
//                               maxLine: 1,
//                               fontFamily: AppStrings.sfProDisplay,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 18),
//                           TextWidget(
//                               text: 'Yesterday at 6:24 PM',
//                               color: CommonColor.greyColor10,
//                               maxLine: 1,
//                               fontFamily: AppStrings.sfProDisplay,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 12),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const TextWidget(
//                       text:
//                           "Hello there! It's great to hear that you're interested in a React dev course. React is a popular and widely used JavaScript library for building user interfaces. With React, you can create interactive and dynamic web applications that are responsive and easy to maintain.",
//                       color: CommonColor.headingTextColor1,
//                       maxLine: 5,
//                       fontFamily: AppStrings.sfProDisplay,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 14),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       left: 20,
//                       right: 20,
//                       top: 25,
//                       bottom: 25,
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: 32,
//                           height: 32,
//                           decoration: ShapeDecoration(
//                             image: DecorationImage(
//                               image: AssetImage(ImageConstant.profilePic),
//                               fit: BoxFit.fill,
//                             ),
//                             shape: const CircleBorder(),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 12,
//                         ),
//                         const Expanded(
//                             child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             TextWidget(
//                                 text: 'Salvia Rose',
//                                 color: CommonColor.headingTextColor1,
//                                 maxLine: 1,
//                                 fontFamily: AppStrings.sfProDisplay,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 18),
//                             TextWidget(
//                                 text: 'Yesterday at 8:24 PM',
//                                 color: CommonColor.greyColor10,
//                                 maxLine: 1,
//                                 fontFamily: AppStrings.sfProDisplay,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 12),
//                             SizedBox(
//                               height: 6,
//                             ),
//                             Text.rich(
//                               TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: 'I agree with you. Mr. Joydeep! \n',
//                                     style: TextStyle(
//                                       color: CommonColor.greyColor11,
//                                       fontSize: 14,
//                                       fontFamily: AppStrings.sfProDisplay,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: '@PeyushBansal',
//                                     style: TextStyle(
//                                       color: CommonColor.greyColor11,
//                                       fontSize: 14,
//                                       fontFamily: AppStrings.sfProDisplay,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: ' See this. ✋\n',
//                                     style: TextStyle(
//                                       color: CommonColor.greyColor11,
//                                       fontSize: 14,
//                                       fontFamily: AppStrings.sfProDisplay,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 8,
//                             ),
//                             Text.rich(
//                               TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: 'Reply  • ',
//                                     style: TextStyle(
//                                       color: CommonColor.greyColor12,
//                                       fontSize: 12,
//                                       fontFamily: AppStrings.sfProDisplay,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: ' Pin this thread ',
//                                     style: TextStyle(
//                                       color: CommonColor.greyColor11,
//                                       fontSize: 12,
//                                       fontFamily: AppStrings.sfProDisplay,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: ' •  Remove',
//                                     style: TextStyle(
//                                       color: CommonColor.greyColor12,
//                                       fontSize: 12,
//                                       fontFamily: AppStrings.sfProDisplay,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ))
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     )
//         //  LayoutBuilder(
//         //   builder: (context, constraints) {
//         //     if (kIsWeb && constraints.maxWidth > 750) {
//         //       return Row(
//         //         crossAxisAlignment: CrossAxisAlignment.start,
//         //         children: [
//         //           Expanded(
//         //             flex: 3,
//         //             child: Column(
//         //               children: [
//         //                 player,
//         //                 const VideoPositionIndicator(),
//         //               ],
//         //             ),
//         //           ),
//         //           const Expanded(
//         //             flex: 2,
//         //             child: SingleChildScrollView(
//         //               child: Controls(),
//         //             ),
//         //           ),
//         //         ],
//         //       );
//         //     }

//         //     return ListView(
//         //       children: [
//         //         player,
//         //         const VideoPositionIndicator(),
//         //         const Controls(),
//         //       ],
//         //     );
//         //   },
//         // ),
//         );
//   }

//   Future<bool> courseRegistrationSuccessfulBottomSheet() async {
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
//                 padding: const EdgeInsets.only(left: 12, right: 12, bottom: 60),
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
//                             const TextWidget(
//                                 text:
//                                     'You have successfully registered to this couse - React Native IOS and Android App Development for Beginners (KM0063)',
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
