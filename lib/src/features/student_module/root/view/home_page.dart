import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? title;
  final Function? onLogout;
  const HomePage({super.key, this.title, this.onLogout});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CommonColor.whiteColor,
          title: TextWidget(
              text: widget.title ?? '', //"Welcome Back",
              color: CommonColor.headingTextColor1,
              maxLine: 1,
              fontFamily: AppStrings.inter,
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
        backgroundColor: CommonColor.greyColor1,
        body: Center(
            child: widget.onLogout == null
                ? const SizedBox()
                : GestureDetector(
                    onTap: () async {
                      Util.logout(context);
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(255, 25, 92, 146)),
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 15, color: CommonColor.whiteColor),
                      ),
                    ),
                  )
            // TextWidget(
            //     text: widget.title,
            //     color: CommonColor.headingTextColor1,
            //     maxLine: 1,
            //     fontFamily: AppStrings.aeonikTRIAL,
            //     fontWeight: FontWeight.w700,
            //     fontSize: 20),
            ),
      ),
    );
  }
}
