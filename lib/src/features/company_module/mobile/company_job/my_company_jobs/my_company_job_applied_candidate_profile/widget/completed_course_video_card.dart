// import 'package:all_in_one/src/core/utils/size_config.dart';
// import 'package:flutter/material.dart';
// int? selectedCompletedCoursesIndex;
// class CompletedCourseVideoCard extends StatelessWidget {
//   const CompletedCourseVideoCard({super.key,required thsi});
// final int index;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // setState(() {
//         //   selectedCompletedCoursesIndex = index;
//         // });
//       },
//       child: Container(
//         width: SizeConfig.screenWidth,
//         decoration: ShapeDecoration(
//           color: selectedCompletedCoursesIndex != null
//               ? selectedCompletedCoursesIndex == index
//                   ? CommonColor.greyColor9
//                   : Colors.white
//               : CommonColor.whiteColor,
//           shape: RoundedRectangleBorder(
//             side: BorderSide(
//                 width: 0.50,
//                 color: selectedCompletedCoursesIndex != null
//                     ? selectedCompletedCoursesIndex == index
//                         ? CommonColor.blueColor2
//                         : CommonColor.greyColor18
//                     : CommonColor.greyColor18),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           shadows: const [
//             BoxShadow(
//               color: Color(0x0C000000),
//               blurRadius: 20,
//               offset: Offset(0, 4),
//               spreadRadius: 0,
//             )
//           ],
//         ),
//         child: Padding(
//           padding:
//               const EdgeInsets.only(left: 20, right: 20, top: 22, bottom: 22),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: 36,
//                 height: 36,
//                 alignment: Alignment.center,
//                 clipBehavior: Clip.antiAlias,
//                 decoration: ShapeDecoration(
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     side: const BorderSide(
//                         width: 0.50, color: CommonColor.greyColor5),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   shadows: const [
//                     BoxShadow(
//                       color: CommonColor.blackColor3,
//                       blurRadius: 2,
//                       offset: Offset(0, 1),
//                       spreadRadius: 0,
//                     )
//                   ],
//                 ),
//                 child: const Icon(
//                   Icons.play_arrow_outlined,
//                   color: CommonColor.headingTextColor1,
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TextWidget(
//                       text: completedCoursesList[index],
//                       color: CommonColor.greyColor11,
//                       maxLine: 1,
//                       fontFamily: AppStrings.sfProDisplay,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   const TextWidget(
//                       text: '9 Mins 80 sec',
//                       color: CommonColor.greyColor11,
//                       maxLine: 1,
//                       fontFamily: AppStrings.sfProDisplay,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 12),
//                 ],
//               ),
//               const Text('')
//               // const Icon(
//               //   Icons.more_vert,
//               //   color:
//               //       CommonColor.headingTextColor1,
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
