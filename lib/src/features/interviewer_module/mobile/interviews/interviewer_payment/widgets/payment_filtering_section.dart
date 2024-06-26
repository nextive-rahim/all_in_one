import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/common_dropdown.dart';
import 'package:flutter/material.dart';

class PaymentFilteringSection extends StatefulWidget {
  const PaymentFilteringSection({super.key});

  @override
  State<PaymentFilteringSection> createState() =>
      _PaymentFilteringSectionState();
}

class _PaymentFilteringSectionState extends State<PaymentFilteringSection> {
  String? dropdownValue = 'All';
  List<String> courseLevelDropdown = [
    'All',
    'Paid',
    'In-Process',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.filterAndOptions,
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            CommonPopupMenu(
              data: courseLevelDropdown,
              selectedValue: dropdownValue,
              onSelected: (value) {
                setState(() {
                  dropdownValue = value;
                });
              },
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.filter_alt_outlined,
                      size: 25,
                      color: CommonColor.blackColor2,
                    ),
                    Text(AppStrings.sortedByLatest)
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
