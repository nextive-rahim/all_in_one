import 'package:all_in_one/src/core/extension/string_extension.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/model/interviewer_payment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewerPaymentCard extends StatelessWidget {
  const InterviewerPaymentCard({
    super.key,
    required this.paymentModel,
  });
  final InterviewerPaymentModel paymentModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Interview Title Need',
                style: AppTextStyle.bold16,
              ),
              const SizedBox(height: 5),
              // Text(
              //   'Subtitle ',
              //   style:
              //       AppTextStyle.bold14.copyWith(color: AppColors.lightBlack80),
              // ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.date_range),
                      const SizedBox(width: 10),
                      Text(getFormattedDate(paymentModel.createdAt)!),
                    ],
                  ),
                  Text(
                    '+ £${paymentModel.amount}',
                    style: AppTextStyle.bold16,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.watch_later_outlined),
                      const SizedBox(width: 10),
                      Text(getFormattedTime(paymentModel.createdAt)!),
                    ],
                  ),
                  Text(
                    '√ ${paymentModel.status == 1 ? 'Peding' : 'Completed'}',
                    style: AppTextStyle.bold16.copyWith(color: AppColors.green),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 10),
                      Text(Get.find<ProfileViewController>().userModel!.name ??
                          '')
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              _FeedBackSection(
                paymentModel: paymentModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeedBackSection extends StatelessWidget {
  const _FeedBackSection({
    super.key,
    required this.paymentModel,
  });
  final InterviewerPaymentModel paymentModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Interviewer Feedback',
          style: AppTextStyle.bold16,
        ),
        const SizedBox(height: 5),
        Text(
          paymentModel.feedbackContent ?? '',
          style: AppTextStyle.bold14.copyWith(color: AppColors.lightBlack80),
        )
      ],
    );
  }
}
