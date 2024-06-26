import 'package:flutter/material.dart';

class EmployeeListFilterSection extends StatelessWidget {
  const EmployeeListFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Filters and options',
          style: TextStyle(
            color: Color(0xFF5A5959),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Container(
              width: 89,
              height: 36,
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFCFD4DC)),
                  borderRadius: BorderRadius.circular(8),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x0C101828),
                    blurRadius: 2,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.filter_list,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'A - Z',
                    style: TextStyle(
                      color: Color(0xFF262626),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
