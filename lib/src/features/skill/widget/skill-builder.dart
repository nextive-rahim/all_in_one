import 'package:all_in_one/src/features/authentication/registration/controller/registration_view_controller.dart';
import 'package:all_in_one/src/features/skill/controller/skill_controller.dart';
import 'package:all_in_one/src/features/skill/model/skills_model.dart';
import 'package:all_in_one/src/features/skill/widget/skill_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillBuilder extends StatefulWidget {
  const SkillBuilder({
    super.key,
  });

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
          return SkillCard(
            onTap: () {
              selectedsID(controller.skillsList[index]);
            },
            course: controller.skillsList[index],
            isSelectItem: Get.find<RegistrationViewController>()
                .selectedSkillIdList
                .contains(controller.skillsList[index].id),
          );
        },
      ),
    );
  }

  selectedsID(SkillsModel course) {
    if (!Get.find<RegistrationViewController>()
        .selectedSkillIdList
        .contains(course.id)) {
      Get.find<RegistrationViewController>()
          .selectedSkillIdList
          .add(course.id!);
      Get.find<RegistrationViewController>()
          .selectedSkillNameList
          .add(course.skill!);

      setState(() {});
    } else {
      Get.find<RegistrationViewController>()
          .selectedSkillIdList
          .remove(course.id);
      Get.find<RegistrationViewController>()
          .selectedSkillNameList
          .add(course.skill!);
      setState(() {});
    }
  }
}
