import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/widgets.dart';

class CandidateCompletedTopicsSection extends StatefulWidget {
  const CandidateCompletedTopicsSection({super.key});

  @override
  State<CandidateCompletedTopicsSection> createState() =>
      _CandidateCompletedTopicsSectionState();
}

class _CandidateCompletedTopicsSectionState
    extends State<CandidateCompletedTopicsSection> {
  List<String> completedTopicsList = [
    'Introduction to React for beginners',
    'Arrays & function in React',
    'Set parameters gateways',
    'React: Founder and History',
    'Tokenization History',
    'Conclusion'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 50,
      ),
      shrinkWrap: true,
      itemCount: completedTopicsList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return TextWidget(
          text: completedTopicsList[index],
          color: CommonColor.blackColor2,
          maxLine: 2,
          fontFamily: AppStrings.inter,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
    );
  }
}
