import 'dart:io';

import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/theme/theme.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = MyHttpOverrides();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await CacheService().initialize();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // debugInvertOversizedImages = true;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      navigatorObservers: [RouteObserver<ModalRoute<void>>()],
      getPages: AppPages.pages,
      theme: themeData,
      // home:bo
      //     //BottomNavBarStudent()
      //     //BottomNavBarEmployee()
      //     // BottomNavBarInterviewer()
      //     //BottomNavBar(),
      //     //DashboardRegFirstTimeWeb()
      //     SplashPage(),
      // //BottomNavBarCompany()
    );
  }
}

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive({
    super.key,
    required this.desktop,
    required this.mobile,
    required this.tablet,
  });

  /// mobile < 650
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  /// tablet >= 650
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650;

  ///desktop >= 1100
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1100) {
        return desktop;
      } else if (constraints.maxWidth >= 650) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}

///...... Student........
/// student@gmail.com   type :1

///...... Employee........
///employee@gmail.com  type :2

///...... Company........
/// company1@gmail.com   type :3

///...... Interviwer........
///interviewer@gmail.com type :4



