import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/formated_date_time.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/widget/delete_job.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/widget/edit_job_icon.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/view/job_details_page_mobile.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyJobCard extends StatelessWidget {
  const CompanyJobCard({super.key, required this.job});
  final JobModel job;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 262,
      width: SizeConfig.screenWidth,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 26,
          top: 29,
          right: 26,
          bottom: 20,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(
                  Routes.jobDetails,
                  arguments: [job, JobIsFrom.company],
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    textAlign: TextAlign.center,
                    text: job.jobRole ?? '',
                    color: CommonColor.greyColor4,
                    maxLine: 1,
                    fontFamily: AppStrings.sfProDisplay,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  const SizedBox(height: 7),
                  TextWidget(
                    textAlign: TextAlign.center,
                    text:
                        Get.find<ProfileViewController>().userModel?.name ?? '',
                    color: CommonColor.greyColor12,
                    maxLine: 1,
                    fontFamily: AppStrings.sfProDisplay,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Image.asset(
                        ImageConstant.jobLogo,
                        color: CommonColor.purpleColor1,
                      ),
                      const SizedBox(width: 15),
                      TextWidget(
                        textAlign: TextAlign.center,
                        text: '${job.workExpMin}-${job.workExpMax}',
                        color: CommonColor.greyColor4,
                        maxLine: 1,
                        fontFamily: AppStrings.sfProDisplay,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Image.asset(
                        ImageConstant.dollarCircle,
                        color: CommonColor.purpleColor1,
                      ),
                      const SizedBox(width: 15),
                      TextWidget(
                        textAlign: TextAlign.center,
                        text: '${job.paysalary}/ yr',
                        color: CommonColor.greyColor4,
                        maxLine: 1,
                        fontFamily: AppStrings.sfProDisplay,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Image.asset(
                        ImageConstant.send2,
                        color: CommonColor.purpleColor1,
                      ),
                      const SizedBox(width: 15),
                      TextWidget(
                        textAlign: TextAlign.center,
                        text: job.workLocation ?? '',
                        color: CommonColor.greyColor4,
                        maxLine: 1,
                        fontFamily: AppStrings.sfProDisplay,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.insert_drive_file_outlined,
                        color: CommonColor.purpleColor1,
                        size: 18,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextWidget(
                          text: job.jobDescription ?? '',
                          color: CommonColor.greyColor12,
                          maxLine: 2,
                          fontFamily: AppStrings.sfProDisplay,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        textAlign: TextAlign.start,
                        text:
                            "Posted ${FormatedDateTime.readTimestamp(int.parse(job.time ?? "0"))}",
                        color: CommonColor.greyColor12,
                        maxLine: 1,
                        fontFamily: AppStrings.sfProDisplay,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                EditJobIcon(job: job),
                const SizedBox(width: 20),
                DeletedJob(job: job),
              ],
            )
          ],
        ),
      ),
    );
  }
}
