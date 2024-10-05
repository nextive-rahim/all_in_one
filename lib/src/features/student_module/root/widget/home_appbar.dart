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
                height: 30,
                margin: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  ImageConstant.aioLogo,
                  fit: BoxFit.contain,
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
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Image.asset(
                        ImageConstant.notification,
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 0),
                ],
              ),
            ],
          ),
        );
}
