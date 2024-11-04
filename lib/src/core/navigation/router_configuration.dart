import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/widgets/mobile/bottom_nav_bar_student.dart';
import 'package:all_in_one/src/features/common_features/authentication/forget_password/view/forget_password_email_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/forget_password/view/forget_password_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/forget_password/view/otp_verification_view_controller.dart';
import 'package:all_in_one/src/features/common_features/authentication/login/view/login_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/view/choose_engagement_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/view/registration_completed_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/view/registration_page.dart';
import 'package:all_in_one/src/features/common_features/profile/view/change_password_page.dart';
import 'package:all_in_one/src/features/common_features/profile/view/profile_page.dart';
import 'package:all_in_one/src/features/common_features/profile/view/profile_update_page.dart';
import 'package:all_in_one/src/features/common_features/splash/splash_page.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/view/company_profile_update_page.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/view/appear_test_and_schedule_interview_mobile.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/root/view/course_details_mobile_page.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/view/category_wise_course_page.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/home_course/view/category_with_course_page.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/job_details/view/job_details_page_mobile.dart';
import 'package:all_in_one/src/features/student_module/mobile/job/jobs/view/list_and_search_job_mobile.dart';
import 'package:all_in_one/src/features/student_module/mobile/notification/view/notification_view_page.dart';
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
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return BottomNavBarStudent(
            navigationShell:
                navigationShell); // DashboardPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.homeTab,
              name: Routes.homeTab,
              pageBuilder: (context, state) => const CategoryWithCoursePage(),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.jobTab,
              name: Routes.jobTab,
              pageBuilder: (context, state) =>
                  const ListAndSearchJobStudentMobile(),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.profileTab,
              name: Routes.profileTab,
              pageBuilder: (context, state) => ProfilePage(),
            )
          ],
        ),
      ],
    ),
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
        transitionGoRoute(
          path: Routes.categoryWiseCourse,
          name: Routes.categoryWiseCourse,
          pageBuilder: (context, state) {
            final String isFrom = state.uri.queryParameters['title'] ?? '';
            // final List<CourseModel> categoryWiseCourse =
            //     state.extra as List<CourseModel>;
            return CategoryWiseCoursePage(
              title: isFrom,
              // categoryWiseCourse: categoryWiseCourse,
            );
          },
          routes: [
            transitionGoRoute(
              path: Routes.courseDetailMobilePage,
              name: Routes.courseDetailMobilePage,
              pageBuilder: (context, state) {
                //final CourseModel courseModel = state.extra as CourseModel;
                return const CourseDetailMobilePage(
                    // collectinListData: courseModel,
                    );
              },
            ),
            transitionGoRoute(
              path: Routes.appearTestAndScheduleInterviewMobilePage,
              name: Routes.appearTestAndScheduleInterviewMobilePage,
              pageBuilder: (context, state) {
                //final CourseModel courseModel = state.extra as CourseModel;
                return const AppearTestAndScheduleInterviewMobilePage(
                    // collectinListData: courseModel,
                    );
              },
            ),
          ],
        ),
      ],
    ),
    transitionGoRoute(
      path: Routes.jobDetails,
      name: Routes.jobDetails,
      pageBuilder: (context, state) {
        final String isFrom = state.uri.queryParameters['isFrom'] ?? '';
        return JobDetailsPageMobile(isFrom: isFrom);
      },
    ),
    transitionGoRoute(
        path: Routes.companyProfileUpdatePage,
        name: Routes.companyProfileUpdatePage,
        pageBuilder: (context, state) {
          return const CompanyProfileUpdatePage();
        }),
    transitionGoRoute(
        path: Routes.profileUpdatePage,
        name: Routes.profileUpdatePage,
        pageBuilder: (context, state) {
          return ProfileUpdatePage();
        }),

    transitionGoRoute(
      path: Routes.changePassword,
      name: Routes.changePassword,
      pageBuilder: (context, state) {
        return const ChangePasswordPage();
      },
      routes: [
        // transitionGoRoute(
        //   path: Routes.payment,
        //   name: Routes.payment,
        //   pageBuilder: (context, state) {
        //     final String courseModel = state.uri.queryParameters['id'] ?? '';
        //     return CheckOutPage(id: courseModel);
        //   },
        // ),
        // transitionGoRoute(
        //   path: Routes.routine,
        //   name: Routes.routine,
        //   pageBuilder: (context, state) {
        //     final String link = state.uri.queryParameters['link'] ?? '';
        //     final String title = state.uri.queryParameters['title'] ?? '';
        //     return CourseRoutinePage(
        //       title: title,
        //       link: link,
        //     );
        //   },
        // ),
      ],
    ),
    transitionGoRoute(
      path: Routes.notification,
      name: Routes.notification,
      pageBuilder: (context, state) => NotificationViewPage(),
    ),
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
