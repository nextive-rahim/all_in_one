part of '../view/all_interview_section_mobile.dart';

class CompletedInterviewsBuilder extends GetView<AllInterviewsViewController> {
  const CompletedInterviewsBuilder({
    super.key,
    // required this.interviews,
  });
  //final List<ViewInterviewResponseData> interviews;
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
          itemCount: controller.completedInterviewList.length,
          shrinkWrap: true,
          reverse: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, ind) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            final interview = controller.completedInterviewList[index];
            return InterViewCard(
              index: index,
              interview: interview,
              isFormCompletedInterviews: true,
            );
          },
        ));
  }
}
