import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_level/model/level_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';

class CourseLevelSection extends StatefulWidget {
  const CourseLevelSection({super.key, this.collectinListData});
  final CourseModel? collectinListData;
  @override
  State<CourseLevelSection> createState() => _CourseLevelSectionState();
}

class _CourseLevelSectionState extends State<CourseLevelSection> {
  String? dropdownValue = 'All';
  List<LevelModel> courseLevelDropdown = [
    LevelModel(id: 0, name: 'All', type: 0),
    LevelModel(id: 1, name: 'Beginners', type: 1),
    LevelModel(id: 2, name: 'Intermediate', type: 2),
    LevelModel(id: 3, name: 'Advanced', type: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const TextWidget(
        //     textAlign: TextAlign.start,
        //     text: AppStrings.courseLevel,
        //     color: CommonColor.headingTextColor1,
        //     maxLine: 2,
        //     fontFamily: AppStrings.aeonikTRIAL,
        //     fontWeight: FontWeight.w400,
        //     fontSize: 16),
        // const SizedBox(
        //   height: 14,
        // ),
        Container(
            width: 142,
            height: 36,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 0.50, color: CommonColor.greyColor5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(widget.collectinListData?.coursesLevel ?? '')

            //  DropdownButton<String>(
            //   value: dropdownValue,
            //   underline: Container(),
            //   icon: const Icon(Icons.expand_more),
            //   style: const TextStyle(color: Colors.black),
            //   onChanged: (String? value) {
            //     dropdownValue = value!;
            //     setState(() {});
            //   },
            //   items: courseLevelDropdown.map<DropdownMenuItem<String>>(
            //     (LevelModel value) {
            //       return DropdownMenuItem<String>(
            //         value: value.name,
            //         child: Text(value.name ?? ''),
            //       );
            //     },
            //   ).toList(),
            // ),
            ),
        const SizedBox(height: 14),
      ],
    );
  }
}
