import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/controller/All_interviews_view_controller.dart';
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
      Get.put(InterviewerTestRequestViewController());
  final profileController = Get.put(ProfileViewController());
  final allInterviewontroller = Get.put(AllInterviewsViewController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.greyColor1,
      body: RefreshIndicator(
        onRefresh: () async {
          if (profileController.profileResponseModel.testRequest != null &&
              profileController.profileResponseModel.testRequest?.status == 3) {
            allInterviewontroller.getAllInterviews();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Obx(() {
              if (profileController.pageState == PageState.loading) {
                return const Offstage();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  profileController.profileResponseModel.testRequest == null
                      ? InterviewerTestRequestCard(
                          profileController: profileController)
                      : interviewTestRequestController
                                  .verificationPending.value ||
                              profileController.profileResponseModel.testRequest
                                      ?.status ==
                                  1
                          ? const InterviewerTestResultPendingCard()
                          : (interviewTestRequestController
                                      .isInterviewerApproved.value ||
                                  profileController.profileResponseModel
                                          .testRequest?.status ==
                                      3)
                              ? const AllInterviewsSection()
                              : const Offstage()
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
