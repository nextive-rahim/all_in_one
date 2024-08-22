import 'package:flutter/material.dart';

void gobalDailogBox(BuildContext context, Function() onPressed, String message,
    {String? title, String? yesButtonText}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title ?? 'Something went wrong'),
        content: SingleChildScrollView(
          child: SelectableText(message),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(yesButtonText ?? 'OK'),
          )
        ],
      );
    },
  );
}
