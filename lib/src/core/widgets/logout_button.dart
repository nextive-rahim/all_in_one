import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Center(
                child: Text('Are you sure?'),
              ),
              content: const SingleChildScrollView(
                child: SelectableText(
                    'Once logged out, you will need to login again to access this app.'),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Util.logout(context);
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: CommonColor.redColors),
                  ),
                )
              ],
            );
          },
        );
      },
      child: const Icon(
        Icons.logout_outlined,
        color: AppColors.red,
      ),
    );
  }
}
