import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/view/all_interview_section_mobile.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_test_request/controller/interviewer_test_request_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_test_request/widgets/interviewer_test_request_card.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_test_request/widgets/interviewer_test_result_pending_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewerHomePageMobile extends StatefulWidget {
  const InterviewerHomePageMobile({super.key});

  @override
  State<InterviewerHomePageMobile> createState() =>
      _InterviewerHomePageMobileState();
}

class _InterviewerHomePageMobileState extends State<InterviewerHomePageMobile> {
  final interviewTestRequestController =
      Get.find<InterviewerTestRequestViewController>();
  final profileController = Get.put(ProfileViewController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.greyColor1,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            profileController.profileResponseModel.testRequest?.status == 1 ||
                    interviewTestRequestController.verificationPending.value
                ? const InterviewerTestResultPendingCard()
                : profileController.profileResponseModel.testRequest == null
                    ? InterviewerTestRequestCard(
                        profileController: profileController)
                    : (interviewTestRequestController
                                .isInterviewerApproved.value ||
                            profileController
                                    .profileResponseModel.testRequest?.status ==
                                3)
                        ? const AllInterviewsSection()
                        : const Offstage()
          ],
        ),
      ),
    );
  }
}
