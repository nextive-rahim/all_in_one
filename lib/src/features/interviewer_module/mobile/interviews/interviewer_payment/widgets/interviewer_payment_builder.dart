import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/widgets/interviewer_payment_card.dart';
import 'package:flutter/material.dart';

class InterviewerPaymentBuilder extends StatelessWidget {
  const InterviewerPaymentBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const InterviewerPaymentCard();
        },);
  }
}
