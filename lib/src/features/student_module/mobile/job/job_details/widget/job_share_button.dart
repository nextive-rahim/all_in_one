import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class JobShareButton extends StatelessWidget {
  const JobShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextWidget(
            textAlign: TextAlign.start,
            text: "Share on social media",
            color: CommonColor.blackColor1,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          GestureDetector(
            onTap: () {
              _shareLink();
            },
            child: Icon(
              Icons.share,
              size: 30,
              color: CommonColor.blue300,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _shareLink() async {
    await Share.shareUri(Uri.parse('www.google.com'));
  }
}
