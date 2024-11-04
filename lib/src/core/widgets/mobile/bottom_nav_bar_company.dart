import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/widgets/logout_button.dart';
import 'package:all_in_one/src/core/widgets/mobile/bottom_nav_bar_view_controller.dart';
import 'package:all_in_one/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarCompany extends StatefulWidget {
  const BottomNavBarCompany({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavBarCompany> createState() => _BottomNavBarCompanyState();
}

class _BottomNavBarCompanyState extends State<BottomNavBarCompany> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  final controller = Get.put(DashboardViewController());
  final profileController = Get.put(ProfileViewController());
  // final List<Widget> _children = <Widget>[
  //   const CompanyAllJobsMobilePage(),
  //   const CompanyEmployeeListPageMobile(),
  //   const CompanyPaymentPageMobile(),
  //   const GenerateCompanyInvoice(),
  //   const CompanyProfilePage()
  // ];

  static const double _borderRadius = 20;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //bool value;
    return Scaffold(
      appBar: CompanyHomeAppBar(),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: widget.navigationShell,
          bottomNavigationBar: ValueListenableBuilder<int>(
              valueListenable: _currentIndex,
              builder: (BuildContext context, int value, child) {
                return Visibility(
                  visible: controller.navBarVisibility,
                  child: Container(
                    //  height: Platform.isAndroid ? 80 : null,
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
                            icon: _buildIcon(ImageConstant.employees, 1),
                            label: 'Employee',
                          ),
                          BottomNavigationBarItem(
                            icon: _buildIcon(ImageConstant.payment, 2),
                            label: 'Payment',
                          ),
                          BottomNavigationBarItem(
                            icon: _buildIcon(ImageConstant.file, 3),
                            label: 'Invoice',
                          ),
                          BottomNavigationBarItem(
                            icon: _buildIcon(ImageConstant.users, 4),
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
      fit: BoxFit.fill,
      cacheHeight: 73,
      cacheWidth: 73,
    );
  }
}

class CompanyHomeAppBar extends AppBar {
  CompanyHomeAppBar({super.key})
      : super(
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          backgroundColor: CommonColor.purpleColor1,
          elevation: 1.5,
          shadowColor: AppColors.lightBlack10.withOpacity(0.4),
          toolbarHeight: 65,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  ImageConstant.appLogo,
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
              const LogoutButton()
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         GestureDetector(
              //           onTap: () => Get.toNamed(Routes.notification),
              //           child: Container(
              //             height: 40,
              //             width: 40,
              //             decoration: BoxDecoration(
              //               color: AppColors.grey100,
              //               borderRadius: BorderRadius.circular(8),
              //               border: Border.all(
              //                 color: AppColors.lightBlack10,
              //                 width: 1,
              //               ),
              //             ),
              //             padding: const EdgeInsets.all(8),
              //             child: const Icon(
              //               Icons.notifications_none_outlined,
              //               color: CommonColor.headingTextColor1,
              //             ),
              //           ),
              //         ),
              //         const SizedBox(width: 10),
              //       ],
              //     ),
            ],
          ),
        );
}
