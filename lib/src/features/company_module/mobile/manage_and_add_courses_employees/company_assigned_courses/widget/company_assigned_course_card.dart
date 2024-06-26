import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/text_style.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';

class CompanyAssingnedCoursesCard extends StatefulWidget {
  const CompanyAssingnedCoursesCard({
    super.key,
    required this.course,
    this.isSelectItem = false,
    required this.onTap,
  });
  final CourseModel? course;
  final bool isSelectItem;
  final void Function()? onTap;
  @override
  State<CompanyAssingnedCoursesCard> createState() =>
      _CompanyAssingnedCoursesCardState();
}

class _CompanyAssingnedCoursesCardState
    extends State<CompanyAssingnedCoursesCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Name :  ",
            style: AppTextStyle.bold14,
          ),
          Text(
            widget.course?.title ?? '',
            style: AppTextStyle.bold16,
          ),
        ],
      ),
      subtitle: Wrap(
        children: [
          const Text(
            "ID  :   ",
            style: AppTextStyle.bold14,
          ),
          Text(
            widget.course?.id.toString() ?? '',
            style: AppTextStyle.bold16,
          ),
        ],
      ),
      trailing: Wrap(
        children: [
          const Text(
            "Level  :   ",
            style: AppTextStyle.bold14,
          ),
          Text(
            widget.course?.id.toString() ?? '',
            style: AppTextStyle.bold16,
          ),
        ],
      ),
      leading: _mainUI(widget.isSelectItem),
    );
  }

  Widget _mainUI(bool isSelected) {
    return Icon(
      isSelected ? Icons.check_box : Icons.check_box_outline_blank,
      color: AppColors.deepBlue,
    );
  }
}
