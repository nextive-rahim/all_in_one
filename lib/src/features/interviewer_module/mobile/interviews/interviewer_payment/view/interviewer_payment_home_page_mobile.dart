import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/widgets/interviewer_payment_builder.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/widgets/payment_filtering_section.dart';
import 'package:flutter/material.dart';

class InterviewerPaymentHomePageMobile extends StatefulWidget {
  const InterviewerPaymentHomePageMobile({super.key});

  @override
  State<InterviewerPaymentHomePageMobile> createState() =>
      _InterviewePaymentrHomePageMobileState();
}

class _InterviewePaymentrHomePageMobileState
    extends State<InterviewerPaymentHomePageMobile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 15,
                right: 15,
                bottom: 80,
              ),
              child: Column(
                children: [
                  PaymentFilteringSection(),
                  InterviewerPaymentBuilder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
