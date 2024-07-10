import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/model/all_interviews_model.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/selected_interview_details/widgets/candidate_details_header.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/selected_interview_details/widgets/candidate_profile_section.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/selected_interview_details/widgets/canditate_completed_topics_section.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/selected_interview_details/widgets/time_selection_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SelectedInterviewDetailsPage extends StatefulWidget {
  const SelectedInterviewDetailsPage({super.key});

  @override
  State<SelectedInterviewDetailsPage> createState() =>
      _SelectedInterviewDetailsPageState();
}

class _SelectedInterviewDetailsPageState
    extends State<SelectedInterviewDetailsPage> {
  ViewInterviewResponseData interview = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.confirmInterview,
          style: TextStyle(
            fontFamily: AppStrings.aeonikTRIAL,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 15,
            left: 15,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InterviewDetailsHeader(interview: interview),
              CandidateProfileSection(interview: interview),
              const CandidateCompletedTopicsSection(),
              InterviewTimeSelectedSection(interview: interview)
            ],
          ),
        ),
      ),
    );
  }
}
