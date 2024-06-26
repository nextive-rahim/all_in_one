import 'package:flutter/material.dart';

class JobCardLoading extends StatelessWidget {
  const JobCardLoading({
    super.key,
    this.height = 250,
  });
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (context, index) {
        return Container(
          height: height,
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      },
    );
  }
}
