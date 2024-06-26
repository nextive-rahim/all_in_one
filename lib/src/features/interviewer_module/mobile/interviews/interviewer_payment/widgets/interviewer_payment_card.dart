import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class InterviewerPaymentCard extends StatelessWidget {
  const InterviewerPaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Principles of UX in development',
                style: AppTextStyle.bold16,
              ),
              const SizedBox(height: 5),
              Text(
                'Subtitle ',
                style:
                    AppTextStyle.bold14.copyWith(color: AppColors.lightBlack80),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.date_range),
                      SizedBox(width: 10),
                      Text('26th May 2024')
                    ],
                  ),
                  Text(
                    '+ £52',
                    style: AppTextStyle.bold16,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.watch_later_outlined),
                      SizedBox(width: 10),
                      Text('9:30 PM')
                    ],
                  ),
                  Text(
                    '√ Paid',
                    style: AppTextStyle.bold16.copyWith(color: AppColors.green),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 10),
                      Text('Interviwer Name')
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              const _FeedBackSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeedBackSection extends StatelessWidget {
  const _FeedBackSection();

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
          'Interviewer Feedbaca book or other written or printed work, regarded in terms of its content rather than its physical form.',
          style: AppTextStyle.bold14.copyWith(color: AppColors.lightBlack80),
        )
      ],
    );
  }
}
