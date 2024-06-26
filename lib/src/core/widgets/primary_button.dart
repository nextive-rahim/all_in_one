import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
    required this.widget,
    this.backgroundColor,
  });

  final Function onTap;
  final bool isLoading;
  final Widget widget;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor ?? CommonColor.purpleColor1,
        gradient: const LinearGradient(
          colors: [
            CommonColor.purpleColor1,
            CommonColor.purpleColor1,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: isLoading ? null : () => onTap(),
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: Colors.white,
                  ),
                ),
              )
            : widget,
      ),
    );
  }
}
