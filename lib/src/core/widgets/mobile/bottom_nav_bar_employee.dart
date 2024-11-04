import 'dart:io';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/widgets/mobile/bottom_nav_bar_view_controller.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_update_view_controller.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/root/widget/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarEmployee extends StatefulWidget {
  const BottomNavBarEmployee({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavBarEmployee> createState() => _BottomNavBarEmployeeState();
}

class _BottomNavBarEmployeeState extends State<BottomNavBarEmployee> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  final controller = Get.put(DashboardViewController());
  final profileController = Get.put(ProfileViewController());
  final jobontroller = Get.put(JobsViewController());
  final profileUPdatecontroller = Get.put(UpdateProfileiewController());
  // final List<Widget> _children = <Widget>[
  //   const CategoryWithCoursePage(),
  //   ProfilePage()
  // ];

  static const double _borderRadius = 20;
  @override
  Widget build(BuildContext context) {
    //bool value;
    return Scaffold(
      appBar: HomeAppBar(
        context: context,
      ),
      body: Obx(
        () {
          return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              body: widget.navigationShell,
              bottomNavigationBar: ValueListenableBuilder<int>(
                  valueListenable: _currentIndex,
                  builder: (BuildContext context, int value, child) {
                    return Visibility(
                      visible: controller.navBarVisibility,
                      child: Container(
                        height: Platform.isAndroid ? 80 : null,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(_borderRadius),
                            topLeft: Radius.circular(_borderRadius),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: CommonColor.purpleColor1,
                                spreadRadius: 0,
                                blurRadius: 0,
                                offset: Offset(0, -1)),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(_borderRadius),
                            topRight: Radius.circular(_borderRadius),
                          ),
                          child: BottomNavigationBar(
                            type: BottomNavigationBarType.fixed,
                            items: <BottomNavigationBarItem>[
                              BottomNavigationBarItem(
                                icon: _buildIcon(ImageConstant.home, 0),
                                label: 'Home',
                              ),
                              BottomNavigationBarItem(
                                icon: _buildIcon(ImageConstant.users, 2),
                                label: 'Profile',
                              ),
                            ],
                            currentIndex: _currentIndex.value,
                            selectedItemColor: AppColors.selectedNavItem,
                            onTap: (index) {
                              _currentIndex.value = index;

                              _goBranch(index);
                              controller.updateIndex;
                            },
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          );
        },
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (controller.currentIndex == 0) {
      return true;
    } else {
      controller.updateIndex(0);
      return false;
    }
  }

  Image _buildIcon(String asset, int index) {
    return Image.asset(
      asset,
      color: _currentIndex.value == index
          ? AppColors.selectedNavItem
          : AppColors.unselectedNavItem,
      height: 28,
      width: 28,
      cacheHeight: 73,
      cacheWidth: 73,
    );
  }
}
