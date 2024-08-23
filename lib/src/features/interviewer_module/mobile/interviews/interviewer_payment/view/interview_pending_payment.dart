import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/controller/interviewer_payment_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_payment/widgets/interviewer_payment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewerPendingPaymentBuilder
    extends GetView<InterviewerPaymentViewController> {
  const InterviewerPendingPaymentBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: controller.pendingPayments.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InterviewerPaymentCard(
            paymentModel: controller.allPayments[index],
          );
        },
      );
    });
  }
}
