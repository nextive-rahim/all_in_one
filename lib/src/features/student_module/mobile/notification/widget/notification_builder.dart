import 'package:all_in_one/src/features/student_module/mobile/notification/model/notification_model.dart';
import 'package:all_in_one/src/features/student_module/mobile/notification/widget/notification_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class NotificationBuilder extends StatelessWidget {
  const NotificationBuilder({super.key, required this.notificationModel});
  final List<NotificationModel>? notificationModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: notificationModel?.length,
        itemBuilder: (context, index) {
          return NotificationCard(notificationModel: notificationModel![index]);
        });
  }
}
