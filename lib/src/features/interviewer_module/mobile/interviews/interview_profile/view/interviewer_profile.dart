import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/mobile/student_app_bar.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class InterviewerProfile extends StatefulWidget {
  final Function onLogout;
  const InterviewerProfile({super.key, required this.onLogout});

  @override
  State<InterviewerProfile> createState() => _InterviewerProfileState();
}

class _InterviewerProfileState extends State<InterviewerProfile> {
  @override
  void initState() {
    // _fetchDummyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColor.greyColor1,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: StudentAppBarMobile(
                titel1: AppStrings.myProfile,
                title2: '',
                isBack: false,
                searchHintText: '',
                // onSearchListener: (value) {},
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 8,
                    bottom: 60,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          const SizedBox(
                            height: 212,
                          ),
                          Container(
                            width: SizeConfig.screenWidth,
                            height: 162,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage(ImageConstant.profilePicBg),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              left: 30,
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(ImageConstant.profilePic),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: const CircleBorder(
                                    side: BorderSide(
                                      width: 5,
                                      //style: BorderSide.none,
                                      color: Colors.white,
                                    ),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x19000000),
                                      blurRadius: 20,
                                      offset: Offset(0, 5),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              )),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 161,
                              height: 36,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.50,
                                      color: CommonColor.greyColor5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: CommonColor.blackColor3,
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: const Row(
                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  TextWidget(
                                      text: AppStrings.changeCover,
                                      color: CommonColor.blackColor4,
                                      maxLine: 1,
                                      fontFamily: AppStrings.inter,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 21),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Container(
                          width: SizeConfig.screenWidth,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x0C000000),
                                blurRadius: 80,
                                offset: Offset(0, 4),
                                spreadRadius: 5,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, bottom: 44, top: 44),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // const TextWidget(
                                //     text: 'Akash Kumar',
                                //     color: CommonColor.greyColor4,
                                //     maxLine: 2,
                                //     fontFamily: AppStrings.aeonikTRIAL,
                                //     fontWeight: FontWeight.w400,
                                //     fontSize: 30),
                                // const SizedBox(
                                //   height: 16,
                                // ),
                                const TextWidget(
                                    text: "StudentID: " "858585858",
                                    color: CommonColor.greyColor4,
                                    maxLine: 2,
                                    fontFamily: AppStrings.aeonikTRIAL,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // const TextWidget(
                                //     text: 'Tata consultancy Services',
                                //     color: CommonColor.greyColor12,
                                //     maxLine: 2,
                                //     fontFamily: AppStrings.aeonikTRIAL,
                                //     fontWeight: FontWeight.w400,
                                //     fontSize: 14),
                                // const SizedBox(
                                //   height: 27,
                                // ),
                                // Container(
                                //   width: 137,
                                //   height: 47,
                                //   decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //       image: AssetImage(ImageConstant.tcs),
                                //       fit: BoxFit.cover,
                                //     ),
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 45,
                                ),
                                Container(
                                  width: SizeConfig.screenWidth,
                                  height: 1,
                                  color: CommonColor.greyColor18,
                                ),
                                const SizedBox(
                                  height: 27,
                                ),
                                const TextWidget(
                                    text: AppStrings.description,
                                    color: CommonColor.greyColor4,
                                    maxLine: 1,
                                    fontFamily: AppStrings.aeonikTRIAL,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20),
                                const SizedBox(
                                  height: 11,
                                ),
                                const TextWidget(
                                    text:
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam finibus magna in finibus porta. Quisque elit lectus, ...',
                                    color: CommonColor.greyColor4,
                                    maxLine: 4,
                                    fontFamily: AppStrings.aeonikTRIAL,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                                const SizedBox(
                                  height: 24,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: 199,
                                      height: 142,
                                      decoration: ShapeDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(ImageConstant.cv),
                                          fit: BoxFit.fill,
                                        ),
                                        gradient: LinearGradient(
                                          begin: const Alignment(0.00, -1.00),
                                          end: const Alignment(0, 1),
                                          colors: [
                                            Colors.black.withOpacity(0),
                                            Colors.black
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 50,
                                      bottom: 16,
                                      child: Container(
                                          width: 44,
                                          height: 44,
                                          alignment: Alignment.center,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 0.50,
                                                  color:
                                                      CommonColor.greyColor5),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            shadows: const [
                                              BoxShadow(
                                                color: CommonColor.blackColor3,
                                                blurRadius: 2,
                                                offset: Offset(0, 1),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                          child: const Icon(
                                            Icons.file_upload_outlined,
                                            color:
                                                CommonColor.headingTextColor2,
                                          )),
                                    ),
                                    Positioned(
                                      right: 40,
                                      bottom: 16,
                                      child: Container(
                                          width: 44,
                                          height: 44,
                                          alignment: Alignment.center,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 0.50,
                                                  color:
                                                      CommonColor.greyColor5),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            shadows: const [
                                              BoxShadow(
                                                color: CommonColor.blackColor3,
                                                blurRadius: 2,
                                                offset: Offset(0, 1),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                          child: const Icon(
                                            Icons.delete_outline,
                                            color:
                                                CommonColor.headingTextColor2,
                                          )),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const TextWidget(
                                    text: 'Resume ',
                                    color: CommonColor.greyColor11,
                                    maxLine: 2,
                                    fontFamily: AppStrings.sfProDisplay,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                                const SizedBox(
                                  height: 3,
                                ),
                                const TextWidget(
                                    text: 'Last updated 31st May at 9:15',
                                    color: CommonColor.greyColor11,
                                    maxLine: 2,
                                    fontFamily: AppStrings.sfProDisplay,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                                const SizedBox(
                                  height: 8,
                                ),
                                const TextWidget(
                                    text: '146 KB',
                                    color: CommonColor.greyColor11,
                                    maxLine: 1,
                                    fontFamily: AppStrings.sfProDisplay,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                                const SizedBox(
                                  height: 22,
                                ),
                                Container(
                                  width: SizeConfig.screenWidth,
                                  height: 44,
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: CommonColor.blueColor1,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: CommonColor.blueColor1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: CommonColor.blackColor3,
                                        blurRadius: 2,
                                        offset: Offset(0, 1),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: const TextWidget(
                                      text: AppStrings.editProfile,
                                      color: CommonColor.whiteColor,
                                      maxLine: 1,
                                      fontFamily: AppStrings.inter,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Util.logout(context);
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 44,
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      color: CommonColor.blueColor2,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 0.50,
                                            color: CommonColor.blueColor1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      shadows: const [
                                        BoxShadow(
                                          color: CommonColor.blackColor3,
                                          blurRadius: 2,
                                          offset: Offset(0, 1),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    child: const TextWidget(
                                        text: "Logout",
                                        color: CommonColor.whiteColor,
                                        maxLine: 1,
                                        fontFamily: AppStrings.inter,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
