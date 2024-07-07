import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/features/student_module/mobile/notification/controller/notification_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/notification/widget/notification_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationViewPage extends StatelessWidget {
  NotificationViewPage({super.key});
  final controller = Get.put(NotificationViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: Obx(
        () {
          if (controller.pageState == PageState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: NotificationBuilder(
                  notificationModel: controller.notificationList),
            ),
          );
        },
      ),
    );
  }
}
