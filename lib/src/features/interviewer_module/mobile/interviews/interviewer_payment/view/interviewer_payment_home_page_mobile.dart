import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/controller/interviewer_payment_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/widgets/interviewer_payment_builder.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/widgets/payment_filtering_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewerPaymentHomePageMobile extends StatelessWidget {
  const InterviewerPaymentHomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InterviewerPaymentViewController());
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getInterviewerPayment();
        },
        child: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
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
      ),
    );
  }
}
