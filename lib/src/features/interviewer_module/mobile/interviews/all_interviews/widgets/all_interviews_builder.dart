import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/model/all_interviews_model.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/widgets/interview_card.dart';
import 'package:flutter/material.dart';

class AllInterviewsBuilder extends StatelessWidget {
  const AllInterviewsBuilder({
    super.key,
    required this.interviews,
  });
  final List<ViewInterviewResponseData> interviews;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: interviews.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, ind) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (context, index) {
        final interview = interviews[index];
        return InterViewCard(
          index: index,
          interview: interview,
          isFormRequestsInterviews: true,
        );
      },
    );
  }
}
