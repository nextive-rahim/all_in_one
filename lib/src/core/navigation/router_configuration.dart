import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/features/common_features/authentication/forget_password/view/forget_password_email_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/forget_password/view/forget_password_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/forget_password/view/otp_verification_view_controller.dart';
import 'package:all_in_one/src/features/common_features/authentication/login/view/login_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/view/choose_engagement_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/view/registration_completed_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/view/registration_page.dart';
import 'package:all_in_one/src/features/common_features/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: Routes.splash,
  routes: <RouteBase>[
    // StatefulShellRoute.indexedStack(
    //   builder: (context, state, navigationShell) {
    //     // the UI shell
    //     return const BottomNavBarStudent(); // DashboardPage(navigationShell: navigationShell);
    //   },
    //   branches: const [
    // StatefulShellBranch(
    //   navigatorKey: _shellNavigatorAKey,
    //   routes: [
    //     // top route inside branch
    //     transitionGoRoute(
    //       path: Routes.coursesTab,
    //       name: Routes.coursesTab,
    //       pageBuilder: (context, state) =>
    //           const CategoryWithCoursesTabPage(),
    //     )
    //   ],
    // ),
    // StatefulShellBranch(
    //   navigatorKey: _shellNavigatorBKey,
    //   routes: [
    //     // top route inside branch
    //     transitionGoRoute(
    //       path: Routes.homeTab,
    //       name: Routes.homeTab,
    //       pageBuilder: (context, state) => const HomePage(),
    //     )
    //   ],
    // ),
    // StatefulShellBranch(
    //   navigatorKey: _shellNavigatorCKey,
    //   routes: [
    //     // top route inside branch
    //     transitionGoRoute(
    //       path: Routes.classRoomTab,
    //       name: Routes.classRoomTab,
    //       pageBuilder: (context, state) => const ClassRoomPage(),
    //     )
    //   ],
    // ),
    // ],
    // ),
    transitionGoRoute(
      path: Routes.splash,
      name: Routes.splash,
      pageBuilder: (context, state) => const SplashPage(),
    ),
    transitionGoRoute(
      path: Routes.login,
      name: Routes.login,
      pageBuilder: (context, state) => const LoginPage(),
      routes: [
        transitionGoRoute(
          path: Routes.engagement,
          name: Routes.engagement,
          pageBuilder: (context, state) {
            final String isFrom = state.uri.queryParameters['title'] ?? 'Null';
            final List listData = state.extra as List;
            return ChooseEngagementPage(title: isFrom, list: listData);
          },
          routes: [
            transitionGoRoute(
              path: Routes.registration,
              name: Routes.registration,
              pageBuilder: (context, state) {
                final String userType =
                    state.uri.queryParameters['userType'] ?? 'Null';
                return RegistrationPage(userTyper: userType);
              },
              routes: [
                transitionGoRoute(
                  path: Routes.registrationCompleted,
                  name: Routes.registrationCompleted,
                  pageBuilder: (context, state) {
                    return const RegistrationCompletedPage();
                  },
                ),
              ],
            ),
            transitionGoRoute(
              path: Routes.forgetPasswordEmailPage,
              name: Routes.forgetPasswordEmailPage,
              pageBuilder: (context, state) {
                return const ForgetPasswordEmailPage();
              },
              routes: [
                transitionGoRoute(
                  path: Routes.otpVerification,
                  name: Routes.otpVerification,
                  pageBuilder: (context, state) {
                    return const OTPverificationPage();
                  },
                  routes: [
                    transitionGoRoute(
                      path: Routes.forgotPassword,
                      name: Routes.forgotPassword,
                      pageBuilder: (context, state) {
                        return const ForgetPasswordPage();
                      },
                      routes: [],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // transitionGoRoute(
        //   path: Routes.otp,
        //   name: Routes.otp,
        //   pageBuilder: (context, state) {
        //     final String isFrom = state.uri.queryParameters['isFrom'] ?? '';
        //     return OtpPage(isFrom: isFrom);
        //   },
        //   routes: [
        //     transitionGoRoute(
        //       path: Routes.setNewPassword,
        //       name: Routes.setNewPassword,
        //       pageBuilder: (context, state) => const ResetPasswordPage(),
        //     ),
        //   ],
        // ),
      ],
    ),
    // transitionGoRoute(
    //   path: Routes.categoryWiseCourses,
    //   name: Routes.categoryWiseCourses,
    //   pageBuilder: (context, state) {
    //     final String slug = state.uri.queryParameters['slug'] ?? '';
    //     final String title = state.uri.queryParameters['title'] ?? '';
    //     return CategoryWiseCoursesPage(
    //       slug: slug,
    //       title: title,
    //     );
    //   },
    // ),
    // transitionGoRoute(
    //   path: Routes.courseSection,
    //   name: Routes.courseSection,
    //   pageBuilder: (context, state) {
    //     final String title = state.uri.queryParameters['title'] ?? '';
    //     final String slug = state.uri.queryParameters['slug'] ?? '';
    //     return SectionPage(
    //       slug: slug,
    //       title: title,
    //     );
    //   },
    //   routes: [
    //     transitionGoRoute(
    //       path: Routes.content,
    //       name: Routes.content,
    //       pageBuilder: (context, state) {
    //         final String slug = state.uri.queryParameters['slug']!;
    //         final String title = state.uri.queryParameters['title']!;
    //         return ContentPage(
    //           slug: slug,
    //           title: title,
    //         );
    //       },
    //     ),
    //   ],
    // ),
    // transitionGoRoute(
    //   path: Routes.courseDetails,
    //   name: Routes.courseDetails,
    //   pageBuilder: (context, state) {
    //     final String slug = state.uri.queryParameters['slug'] ?? '';
    //     final String title = state.uri.queryParameters['title'] ?? '';
    //     return CourseDetailsPage(
    //       slug: slug,
    //       title: title,
    //     );
    //   },
    //   routes: [
    //     transitionGoRoute(
    //       path: Routes.payment,
    //       name: Routes.payment,
    //       pageBuilder: (context, state) {
    //         final String courseModel = state.uri.queryParameters['id'] ?? '';
    //         return CheckOutPage(id: courseModel);
    //       },
    //     ),
    //     transitionGoRoute(
    //       path: Routes.routine,
    //       name: Routes.routine,
    //       pageBuilder: (context, state) {
    //         final String link = state.uri.queryParameters['link'] ?? '';
    //         final String title = state.uri.queryParameters['title'] ?? '';
    //         return CourseRoutinePage(
    //           title: title,
    //           link: link,
    //         );
    //       },
    //     ),
    //   ],
    // ),
    // transitionGoRoute(
    //   path: Routes.congratulation,
    //   name: Routes.congratulation,
    //   pageBuilder: (context, state) => const CongratulationPage(),
    // ),
    // transitionGoRoute(
    //   path: Routes.noticeBoard,
    //   name: Routes.noticeBoard,
    //   pageBuilder: (context, state) => const NoticeBoardPage(),
    //   routes: [
    //     transitionGoRoute(
    //       path: Routes.noticeDetailsPage,
    //       name: Routes.noticeDetailsPage,
    //       pageBuilder: (context, state) {
    //         final String slug = state.uri.queryParameters['slug']!;
    //         return NoticeDetailsPage(slug: slug);
    //       },
    //     ),
    //   ],
    // ),
    // transitionGoRoute(
    //   path: Routes.passwordChange,
    //   name: Routes.passwordChange,
    //   pageBuilder: (context, state) => const PassWordChangePage(),
    // ),
    // transitionGoRoute(
    //   path: Routes.privacyPolicy,
    //   name: Routes.privacyPolicy,
    //   pageBuilder: (context, state) => const PrivacyPolicyPage(),
    // ),
    // transitionGoRoute(
    //   path: Routes.support,
    //   name: Routes.support,
    //   pageBuilder: (context, state) => const SupportPage(),
    // ),
    // transitionGoRoute(
    //   path: Routes.faq,
    //   name: Routes.faq,
    //   pageBuilder: (context, state) => FaqPage(
    //     faqEntity: state.extra as List<FaqEntity>,
    //   ),
    // ),
    // transitionGoRoute(
    //   path: Routes.profileUpdated,
    //   name: Routes.profileUpdated,
    //   pageBuilder: (context, state) => const ProfileUpdatedPage(),
    // ),
    // transitionGoRoute(
    //   path: Routes.video,
    //   name: Routes.video,
    //   pageBuilder: (context, state) {
    //     final String videoLink = state.uri.queryParameters['videoLink']!;
    //     final String title = state.uri.queryParameters['title']!;
    //     final String description =
    //         state.uri.queryParameters['description'] ?? '';
    //     return LiveVideoPage(
    //       videoLink: videoLink,
    //       title: title,
    //       description: description,
    //     );
    //   },
    // ),
    // transitionGoRoute(
    //   path: Routes.webViewScreen,
    //   name: Routes.webViewScreen,
    //   pageBuilder: (context, state) {
    //     final String url = state.uri.queryParameters['url'] ?? '';
    //     final String title = state.uri.queryParameters['title'] ?? '';
    //     final String slug = state.uri.queryParameters['slug'] ?? '';
    //     return WebViewScreen(
    //       url: url,
    //       title: title,
    //       slug: slug,
    //     );
    //   },
    // ),
    // transitionGoRoute(
    //   path: Routes.ranking,
    //   name: Routes.ranking,
    //   pageBuilder: (context, state) {
    //     final String title = state.uri.queryParameters['title']!;
    //     final String id = state.uri.queryParameters['id']!;
    //     return Ranking(
    //       title: title,
    //       id: id,
    //     );
    //   },
    // ),
  ],
);

GoRoute transitionGoRoute({
  required String path,
  required String name,
  List<RouteBase>? routes,
  required Widget Function(BuildContext, GoRouterState) pageBuilder,
}) {
  return GoRoute(
    path: path,
    name: name,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      child: pageBuilder(context, state),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          textDirection: TextDirection.ltr,
          position: animation.drive(
            Tween(
              begin: const Offset(1.5, 0),
              end: Offset.zero,
            ).chain(
              CurveTween(curve: Curves.easeInOut),
            ),
          ),
          child: child,
        );
      },
    ),
    routes: routes ?? [],
  );
}
