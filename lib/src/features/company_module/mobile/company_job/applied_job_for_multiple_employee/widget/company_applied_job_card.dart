import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/text_style.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';

class CompanyAppliedJonCard extends StatefulWidget {
  const CompanyAppliedJonCard({
    super.key,
    required this.course,
    this.isSelectItem = false,
    required this.onTap,
  });
  final EmployeeModel? course;
  final bool isSelectItem;
  final void Function()? onTap;
  @override
  State<CompanyAppliedJonCard> createState() => _CompanyAppliedJonCardState();
}

class _CompanyAppliedJonCardState extends State<CompanyAppliedJonCard> {
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
            widget.course?.name ?? '',
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
      // trailing: Wrap(
      //   children: [
      //     const Text(
      //       "Level  :   ",
      //       style: AppTextStyle.bold14,
      //     ),
      //     Text(
      //       widget.course?.id.toString() ?? '',
      //       style: AppTextStyle.bold16,
      //     ),
      //   ],
      // ),
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
