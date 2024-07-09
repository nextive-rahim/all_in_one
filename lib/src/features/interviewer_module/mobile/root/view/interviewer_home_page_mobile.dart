import 'package:all_in_one/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/view/all_interview_section_mobile.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_test_request/controller/interviewer_test_request_view_controller.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_test_request/view/interviewer_test_request_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewerHomePageMobile extends StatefulWidget {
  const InterviewerHomePageMobile({
    super.key,
  });

  @override
  State<InterviewerHomePageMobile> createState() =>
      _InterviewerHomePageMobileState();
}

class _InterviewerHomePageMobileState extends State<InterviewerHomePageMobile> {
  final interviewTestRequestController =
      Get.find<InterviewerTestRequestViewController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isInterviewerApproved =
        CacheService.boxAuth.read(CacheKeys.interviewApproval);
    return Scaffold(
      backgroundColor: CommonColor.greyColor1,
      body: SingleChildScrollView(
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                (!interviewTestRequestController.isInterviewerApproved.value ||
                        !isInterviewerApproved == true)
                    ? AllInterviewsSection()
                    : const InterviewerTestRequestSection()
              ],
            )),
      ),
    );
  }
}
