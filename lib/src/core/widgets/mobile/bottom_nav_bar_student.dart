import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/widgets/mobile/bottom_nav_bar_view_controller.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:all_in_one/src/features/student_module/root/widget/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarStudent extends StatefulWidget {
  const BottomNavBarStudent({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;
  @override
  State<BottomNavBarStudent> createState() => _BottomNavBarStudentState();
}

GlobalKey navBarGlobalKey = GlobalKey(debugLabel: 'bottomAppBar');

class _BottomNavBarStudentState extends State<BottomNavBarStudent> {
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

  // final List<Widget> _children = <Widget>[
  //   const CategoryWithCoursePage(),
  //   const ListAndSearchJobStudentMobile(),
  //   ProfilePage(),
  // ];

  static const double _borderRadius = 0;

  @override
  Widget build(BuildContext context) {
    //bool value;
    return Scaffold(
      key: UniqueKey(),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: HomeAppBar(),
          body: widget.navigationShell,
          bottomNavigationBar: ValueListenableBuilder<int>(
            valueListenable: _currentIndex,
            builder: (BuildContext context, int value, child) {
              return Visibility(
                visible: controller.navBarVisibility,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(_borderRadius),
                      topLeft: Radius.circular(_borderRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.lightBlack10,
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
                      elevation: 10,
                      backgroundColor: CommonColor.whiteColor,
                      type: BottomNavigationBarType.fixed,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: _buildIcon(ImageConstant.bookOpenLogo, 0),
                          label: 'Courses',
                        ),
                        BottomNavigationBarItem(
                          icon: _buildIcon(ImageConstant.job2, 1),
                          label: 'Jobs',
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
            },
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_currentIndex.value == 0) {
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
      height: 30,
      width: 30,
      // cacheHeight: 73,
      // cacheWidth: 73,
    );
  }
}
