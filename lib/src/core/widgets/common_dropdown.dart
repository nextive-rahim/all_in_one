import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CommonPopupMenu extends StatelessWidget {
  const CommonPopupMenu({
    super.key,
    required this.onSelected,
    required this.data,
    required this.selectedValue,
  });
  final void Function(String)? onSelected;
  final List<String> data;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onSelected: onSelected,
      itemBuilder: (context) {
        return [
          for (var value in data)
            PopupMenuItem(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
        ];
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: CommonColor.blackColor4, width: .5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedValue!,
                style: const TextStyle(color: CommonColor.blackColor),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SkillCommonPopupMenu extends StatelessWidget {
  const SkillCommonPopupMenu({
    super.key,
    required this.onSelected,
    required this.data,
    required this.selectedValue,
  });
  final void Function(String)? onSelected;
  final List<String> data;
  final List<int>? selectedValue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onSelected: onSelected,
      itemBuilder: (context) {
        return [
          for (var value in data)
            PopupMenuItem(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
        ];
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: CommonColor.blackColor4, width: .5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                List.generate(selectedValue!.length,
                    (int index) => selectedValue?[index]).toString(),
                style: const TextStyle(color: CommonColor.blackColor),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
