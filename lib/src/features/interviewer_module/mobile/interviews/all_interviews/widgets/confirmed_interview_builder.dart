part of '../view/all_interview_section_mobile.dart';

class ConfirmInterviewsBuilder extends GetView<AllInterviewsViewController> {
  const ConfirmInterviewsBuilder({
    super.key,
    // required this.interviews,
  });
  // final List<ViewInterviewResponseData> interviews;
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
          itemCount: controller.comfirmedInterviewList.length,
          shrinkWrap: true,
          reverse: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, ind) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            final interview = controller.comfirmedInterviewList[index];
            return InterViewCard(
              index: index,
              interview: interview,
              isFormConfirmInterviews: true,
            );
          },
        ));
  }
}
