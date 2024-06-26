import 'package:flutter/material.dart';

class CourseCardLoading extends StatelessWidget {
  const CourseCardLoading({super.key,this.height});
  final double ?height;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:height?? 232,
              alignment: Alignment.center,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: Border(),
              ),
              child: Container(
                width: 76,
                height: 76,
                alignment: Alignment.center,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(side: BorderSide.none),
                ),
                child: const Icon(
                  Icons.play_arrow_outlined,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(''),
            const Text(''),
            const SizedBox(height: 30)
          ],
        );
      },
    );
  }
}
