import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void errorHandler(
  Object e,
  StackTrace stackTrace, {
  String feedback = "Something went wrong",
  bool disableFeedback = false,
}) {
  Log.error(e.toString());
  Log.error(stackTrace.toString());
  Get.snackbar(
    'Failed',
    feedback,
    snackPosition: SnackPosition.TOP,
    backgroundColor: CommonColor.redColors,
    colorText: Colors.white,
  );
}
