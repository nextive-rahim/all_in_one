import 'package:all_in_one/src/features/common_features/skill/controller/skill_controller.dart';
import 'package:all_in_one/src/features/common_features/skill/model/skills_model.dart';
import 'package:all_in_one/src/features/common_features/skill/widget/skill_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillBuilder extends StatefulWidget {
  const SkillBuilder({
    super.key,
    required this.selectedSkillIdList,
    required this.selectedSkillNameList,
  });
  final RxList<int?> selectedSkillIdList;
  final RxList<String> selectedSkillNameList;
  @override
  State<SkillBuilder> createState() => SkillBuilderState();
}

class SkillBuilderState extends State<SkillBuilder> {
  final SkillViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        shrinkWrap: true,
        itemCount: controller.skillsList.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final bool alreadyAssinged = widget.selectedSkillIdList
              .any((v) => v == controller.skillsList[index].id);
          return SkillCard(
            onTap: () {
              selectedsID(controller.skillsList[index]);
            },
            course: controller.skillsList[index],
            isSelectItem: alreadyAssinged ||
                widget.selectedSkillIdList
                    .contains(controller.skillsList[index].id),
          );
        },
      ),
    );
  }

  selectedsID(SkillsModel course) {
    if (!widget.selectedSkillIdList.contains(course.id)) {
      widget.selectedSkillIdList.add(course.id!);
      widget.selectedSkillNameList.add(course.skill!);

      setState(() {});
    } else {
      widget.selectedSkillIdList.remove(course.id);
      widget.selectedSkillNameList.remove(course.skill!);
      setState(() {});
    }
  }
}
