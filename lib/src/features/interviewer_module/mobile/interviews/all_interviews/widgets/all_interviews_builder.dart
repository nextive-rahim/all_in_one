part of '../view/all_interview_section_mobile.dart';

class AllInterviewsBuilder extends GetView<AllInterviewsViewController> {
  const AllInterviewsBuilder({
    super.key,
    // required this.interviews,
  });
  // final List<ViewInterviewResponseData> interviews;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Obx(
        () => ListView.separated(
          itemCount: controller.allnterviews.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, ind) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            final interview = controller.allnterviews[index];
            return InterViewCard(
              index: index,
              interview: interview,
              isFormRequestsInterviews: true,
              //  isExpaired: interview.isFormFillUpDateExpired,
            );
          },
        ),
      ),
    );
  }
}
