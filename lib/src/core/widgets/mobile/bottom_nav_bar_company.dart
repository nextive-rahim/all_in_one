import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/widgets/mobile/bottom_nav_bar_view_controller.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_invoice/view/generate_invoice_page.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/view/comapny_profile_page.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/root/presentation/view/company_all_jobs_page.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/view/company_employee_list.dart';
import 'package:all_in_one/src/features/company_module/mobile/payment/company_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:all_in_one/src/core/utils/colors.dart';

class BottomNavBarCompany extends StatefulWidget {
  const BottomNavBarCompany({super.key});

  @override
  State<BottomNavBarCompany> createState() => _BottomNavBarCompanyState();
}

class _BottomNavBarCompanyState extends State<BottomNavBarCompany> {
  final controller = Get.put(DashboardViewController());
  final List<Widget> _children = <Widget>[
    const CompanyAllJobsMobilePage(),
    const CompanyEmployeeListPageMobile(),
    const CompanyPaymentPageMobile(),
    const GenerateCompanyInvoice(),
    const CompanyProfilePage()
  ];

  static const double _borderRadius = 20;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //bool value;
    return Scaffold(
      appBar: CompanyHomeAppBar(),
      body: Obx(
        () {
          return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              body: IndexedStack(
                index: controller.currentIndex,
                children: _children,
              ),
              bottomNavigationBar: Obx(
                () {
                  return Visibility(
                    visible: controller.navBarVisibility,
                    child: Container(
                      //  height: Platform.isAndroid ? 80 : null,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(_borderRadius),
                          topLeft: Radius.circular(_borderRadius),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.navBarShadow,
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, -3)),
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
                              icon: _buildIcon(ImageConstant.bookOpenLogo, 0),
                              label: 'Home',
                            ),
                            BottomNavigationBarItem(
                              icon: _buildIcon(ImageConstant.users, 1),
                              label: 'Employee',
                            ),
                            BottomNavigationBarItem(
                              icon: _buildIcon(ImageConstant.dollarCircle, 2),
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
                          currentIndex: controller.currentIndex,
                          selectedItemColor: AppColors.selectedNavItem,
                          onTap: controller.updateIndex,
                        ),
                      ),
                    ),
                  );
                },
              ),
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
      color: controller.currentIndex == index
          ? AppColors.selectedNavItem
          : AppColors.unselectedNavItem,
      height: 28,
      width: 28,
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     GestureDetector(
              //       onTap: () => Get.toNamed(Routes.notification),
              //       child: Container(
              //         height: 40,
              //         width: 40,
              //         decoration: BoxDecoration(
              //           color: AppColors.grey100,
              //           borderRadius: BorderRadius.circular(8),
              //           border: Border.all(
              //             color: AppColors.lightBlack10,
              //             width: 1,
              //           ),
              //         ),
              //         padding: const EdgeInsets.all(8),
              //         child: const Icon(
              //           Icons.notifications_none_outlined,
              //           color: CommonColor.headingTextColor1,
              //         ),
              //       ),
              //     ),
              const SizedBox(width: 10),

              //  ],
              // ),
            ],
          ),
        );
}
