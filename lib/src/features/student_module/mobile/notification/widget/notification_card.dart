import 'package:all_in_one/src/core/extension/sizebox_extension.dart';
import 'package:all_in_one/src/core/extension/string_extension.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/student_module/mobile/notification/model/notification_model.dart';
import 'package:flutter/widgets.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notificationModel});
  final NotificationModel? notificationModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: .5,
              color: AppColors.black,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(notificationModel?.text ?? ''),
              10.sh,
              Text(
                getFormattedDateTime(notificationModel?.createdAt) ?? '',
                style: const TextStyle(
                  color: CommonColor.purpleColor1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
