import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({super.key})
      : super(
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          backgroundColor: CommonColor.whiteColor,
          // elevation: 1.5,
          // shadowColor: AppColors.lightBlack10.withOpacity(0.4),
          toolbarHeight: 65,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 35,
                margin: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  ImageConstant.aioLogo,
                  fit: BoxFit.contain,
                  cacheHeight: 105,
                  cacheWidth: 388,
                ),
              ),
              const Text(
                'All In One',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.notification),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.grey100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.lightBlack10,
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.notifications_none_outlined,
                        color: CommonColor.headingTextColor1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // GestureDetector(
                  //   onTap: () {
                  //    // Get.toNamed(Routes.profileDashboard);
                  //     // Get.find<DashboardViewController>()
                  //     //     .updateNavBarVisibility(false);
                  //     // scaffoldKey.currentState!.openDrawer();
                  //   },
                  //   child: Obx(() {
                  //     return Container(
                  //       height: 40,
                  //       width: 40,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8),
                  //         border: Border.all(
                  //           color: AppColors.lightBlack10,
                  //           width: 1,
                  //         ),
                  //       ),
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(8),
                  //         child: (controller.pageState == PageState.loading)
                  //             ? const CommonCachedNetworkImage(
                  //                 imageUrl: noProfileFoundURL,
                  //                 fit: BoxFit.cover,
                  //               )
                  //             : CommonCachedNetworkImage(
                  //                 imageUrl: controller.userModel.image?.link ??
                  //                     noProfileFoundURL,
                  //                 fit: BoxFit.cover,
                  //                 cachedHeight: 99,
                  //                 cachedWidth: 99,
                  //               ),
                  //       ),
                  //     );
                  //   }),
                  // ),
                ],
              ),
            ],
          ),
        );
}
