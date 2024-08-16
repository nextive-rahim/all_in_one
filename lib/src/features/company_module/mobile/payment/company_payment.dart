import 'package:all_in_one/src/core/extension/sizebox_extension.dart';
import 'package:all_in_one/src/core/extension/string_extension.dart';
import 'package:all_in_one/src/core/extension/text_extension.dart';
import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/widgets/my_separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyPaymentPageMobile extends StatefulWidget {
  const CompanyPaymentPageMobile({
    super.key,
  });

  @override
  State<CompanyPaymentPageMobile> createState() =>
      _CompanyPaymentPageMobileState();
}

class _CompanyPaymentPageMobileState extends State<CompanyPaymentPageMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: CommonColor.whiteColor,
        //   title: const TextWidget(
        //       text: "Welcome Back",
        //       color: CommonColor.headingTextColor1,
        //       maxLine: 1,
        //       fontFamily: AppStrings.inter,
        //       fontWeight: FontWeight.w500,
        //       fontSize: 14),
        // ),

        backgroundColor: CommonColor.greyColor1,
        body: Column(
          children: [
            // const StudentAppBarMobile(
            //   titel1: AppStrings.companyName,
            //   title2: "Find and manage your interviews",
            //   isBack: false,
            //   searchHintText: "",
            //   isShowNotificationIcon: false,
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.screenWidth,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFEBEBEB)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                //  width: 286,
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text:
                                            'Total remuneration for the month of ',
                                        style: TextStyle(
                                          color: Color(0xFF262626),
                                          fontSize: 20,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: getFormattedDate(DateTime.now()),
                                        style: const TextStyle(
                                          color: Color(0xFF262626),
                                          fontSize: 20,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: ' is ',
                                        style: TextStyle(
                                          color: Color(0xFF262626),
                                          fontSize: 20,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: '\$502',
                                        style: TextStyle(
                                          color: Color(0xFF262626),
                                          fontSize: 20,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const SizedBox(
                                width: 265,
                                child: Text(
                                  'Requested to pay within first week of this month.',
                                  style: TextStyle(
                                    color: Color(0xFF585858),
                                    fontSize: 16,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              InkWell(
                                onTap: () {
                                  print('object');
                                  Get.snackbar(
                                    'Waring',
                                    'Payment gateway not ready yet',
                                    backgroundColor: CommonColor.redColors,
                                    colorText: Colors.white,
                                  );
                                },
                                child: Container(
                                  width: 165,
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: AppColors.primary,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFEBEBEB)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x0C101828),
                                        blurRadius: 2,
                                        offset: Offset(0, 1),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Pay now',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0.10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Text(
                            'Cost breakdown for this month',
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.info_outline),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        height: 467,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFEBEBEB)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x0C000000),
                              blurRadius: 20,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(22, 30, 22, 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Paying for ',
                                    style: TextStyle(
                                      color: Color(0xFF262626),
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  10.sw,
                                  Text(getFormattedDate(DateTime.now())!)
                                      .fontSize(20)
                                      .bold(FontWeight.w600)
                                ],
                              ),
                              const SizedBox(height: 28),
                              Container(
                                width: SizeConfig.screenWidth,
                                height: 5,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFEBEBEB)),
                              ),
                              const SizedBox(height: 28),
                              SizedBox(
                                width: SizeConfig.screenWidth,
                                // height: 175,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Subscription Plan',
                                          style: TextStyle(
                                            color: Color(0xFF363636),
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '\$432',
                                          style: TextStyle(
                                            color: Color(0xFF363636),
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 18),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Employee Cost',
                                          style: TextStyle(
                                            color: Color(0xFF363636),
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '\$60',
                                          style: TextStyle(
                                            color: Color(0xFF363636),
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'TAX',
                                          style: TextStyle(
                                            color: Color(0xFF363636),
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '\$10',
                                          style: TextStyle(
                                            color: Color(0xFF363636),
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 25),
                                    MySeparator(color: CommonColor.greyColor4),
                                    SizedBox(height: 18),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total Cost',
                                          style: TextStyle(
                                            color: Color(0xFF363636),
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '\$502',
                                          style: TextStyle(
                                            color: Color(0xFF363636),
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40),
                              Center(
                                child: Container(
                                  width: 165,
                                  height: 40,
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: AppColors.primary,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFCFD4DC)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x0C101828),
                                        blurRadius: 2,
                                        offset: Offset(0, 1),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Get.snackbar(
                                        'Waring',
                                        'Payment gateway not ready yet',
                                        backgroundColor: CommonColor.redColors,
                                        colorText: Colors.white,
                                      );
                                    },
                                    child: const Text(
                                      'Pay Now',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              const Center(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Issue with payment?',
                                        style: TextStyle(
                                          color: Color(0xFF585858),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          height: 0.14,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' ',
                                        style: TextStyle(
                                          color: Color(0xFF585858),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          //  textDecoration: TextDecoration.underline,
                                          height: 0.14,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Request Assistance',
                                        style: TextStyle(
                                          color: Color(0xFF585858),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          //   textDecoration: TextDecoration.underline,
                                          height: 0.14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
