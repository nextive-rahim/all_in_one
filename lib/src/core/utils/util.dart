import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum UrlType { image, video, unknown }

class SnackBarService {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  static void showErrorSnackBar(String content) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: CommonColor.redColors,
      duration: const Duration(seconds: 2),
    ));
  }

  static void showInfoSnackBar(String content) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: CommonColor.greenColor1,
      duration: const Duration(seconds: 2),
    ));
  }
}

class Util {
  static void log(Object? object) {
    if (kDebugMode) {
      print(object);
    }
  }

  static void displayErrorToast(
    BuildContext context,
    String messsage,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(messsage),
        backgroundColor: CommonColor.redColors,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static void displayInfoToast(
    BuildContext context,
    String messsage,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(messsage),
        backgroundColor: CommonColor.greenColor1,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static UrlType getUrlType(String url) {
    Uri uri = Uri.parse(url);
    String typeString = uri.path.substring(uri.path.length - 3).toLowerCase();
    if (typeString == 'jpg' || typeString == 'jpeg' || typeString == 'png') {
      return UrlType.image;
    }
    if (typeString == 'mp4') {
      return UrlType.video;
    } else {
      return UrlType.unknown;
    }
  }

  static void showLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(67, 66, 66, 0.498)),
          child: Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: CommonColor.whiteColor,
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  const SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Image.asset(
                        ImageConstant.aioLogo,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static String getInitials(String name) {
    List<String> names = name.split(" ");
    String initials = "";
    int numWords = 2;

    if (numWords < names.length) {
      numWords = names.length;
    }
    for (var i = 0; i < numWords; i++) {
      initials += names[i][0];
    }
    return initials;
  }

  static void logout(BuildContext context) async {
    CacheService().dispose();
    context.goNamed(Routes.login);
    // Get.offAllNamed(Routes.login);
  }
}
