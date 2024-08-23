import 'package:all_in_one/src/core/widgets/common_tab_section.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/controller/interviewer_payment_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/view/interview_completed_payment.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/view/interview_pending_payment.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/widgets/interviewer_payment_builder.dart';
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
                  top: 10,
                  left: 15,
                  right: 15,
                  bottom: 50,
                ),
                child: Column(
                  children: [
                    // PaymentFilteringSection(),
                    CommonTabSection(
                      firstTabViewItems: [InterviewerPaymentBuilder()],
                      secondTabViewItems: [InterviewerPendingPaymentBuilder()],
                      thirdTabViewItems: [InterviewerCompletedPaymentBuilder()],
                      title1: 'All\nPayments',
                      title2: 'Pending\nPayments',
                      title3: 'Completed\nPayments',
                    )
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
