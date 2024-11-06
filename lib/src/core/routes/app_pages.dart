import 'package:all_in_one/src/core/widgets/mobile/bottom_nav_bar_interviewer.dart';
import 'package:all_in_one/src/features/common_features/authentication/forget_password/view/forget_password_email_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/forget_password/view/forget_password_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/forget_password/view/otp_verification_view_controller.dart';
import 'package:all_in_one/src/features/common_features/authentication/login/view/login_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/registration/view/registration_completed_page.dart';
import 'package:all_in_one/src/features/common_features/authentication/root/binding/auth_binding.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/applied_job_for_multiple_employee/binding/company_applied_job_binding.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/applied_job_for_multiple_employee/view/company_applied_job_page.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/binding/company_profile_update_binding.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_profile/view/company_profile_update_page.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/post_new_job/binding/post_job_binding.dart';
import 'package:all_in_one/src/features/company_module/mobile/company_job/post_new_job/view/post_company_new_job_page.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/binding/add_new_employee_binding.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/view/company_add_employee.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/binding/company_assigned_course_binding.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/view/company_assigned_course_page.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/company_employee_profile/view/company_employee_profile_page.dart';
import 'package:all_in_one/src/features/company_module/web/my_company_jobs/my_company_job_web.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/binding/interviews_binding.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/interviewer_test_request/binding/interviewer_test_request_binding.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/selected_interview_details/binding/confirm_interview_request_binding.dart';
import 'package:all_in_one/src/features/common_features/user_details/view/selected_interview_details_page.dart';
import 'package:all_in_one/src/features/common_features/splash/splash_page.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/binding/appear_test_binding.dart';
import 'package:all_in_one/src/features/student_module/mobile/appear_test_and_schedule_interview/view/appear_test_and_schedule_interview_mobile.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/root/binding/course_details_binding.dart';
import 'package:all_in_one/src/features/common_features/profile/binding/profile_binding.dart';
import 'package:all_in_one/src/features/common_features/profile/view/change_password_page.dart';
import 'package:all_in_one/src/features/common_features/profile/view/profile_update_page.dart';
import 'package:all_in_one/src/features/common_features/profile/view/resume_view_page.dart';
import 'package:all_in_one/src/features/student_module/mobile/notification/view/notification_view_page.dart';
import 'package:all_in_one/src/features/student_module/web/root/view/responsive_layout_course_detail_form_reg.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../features/company_module/mobile/company_invoice/view/invoice_view_page.dart';

part './app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    /// On boarding
    GetPage(
      name: Routes.initial,
      page: () => const SplashPage(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),

    /// Authentication
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: AuthenticationBinding(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),
    // GetPage(
    //   name: Routes.engagement,
    //   page: () => const ChooseEngagementPage(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.responsibileDashboardFirstTime,
    //   page: () => const Responsive(
    //     desktop: DashboardRegFirstTimeWebLarge(),
    //     tablet: DashboardRegFirstTimeWebLarge(),
    //     mobile: BottomNavBarStudent(),
    //   ),
    //   bindings: [
    //     StudentModuleBinding(),
    //     JobListBinding(),
    //   ],
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.bottomNavBarStudent,
    //   page: () => const BottomNavBarStudent(),
    //   bindings: [
    //     StudentModuleBinding(),
    //     JobListBinding(),
    //   ],
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.bottomNavBarEmployee,
    //   page: () => const BottomNavBarEmployee(),
    //   bindings: [
    //     StudentModuleBinding(),
    //     JobListBinding(),
    //   ],
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.responsiveLayoutDashboardInterview,
    //   page: () => const ResponsiveLayoutDashboardInterview(
    //   //  webLageScaffold: InterviewerDashboardWeb(),
    //     //webMediumScaffold: DashboardRegFirstTimeWebMedium(),
    //     //webSmallScaffold: DashboardRegFirstTimeWebSmall(),
    //   ),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    GetPage(
      name: Routes.bottomNavBarInterview,
      page: () => const BottomNavBarInterviewer(),
      bindings: [
        InterViewerTestRequestBinding(),
        InterviewsBinding(),
      ],
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),

    GetPage(
      name: Routes.responsiveLayoutCourseDetailFormRegister,
      page: () => const ResponsiveLayoutCourseDetailFormRegister(),
      //  binding: DashboardBinding(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),

    // GetPage(
    //   name: Routes.bottomNavBarEmployee,
    //   page: () => const BottomNavBarEmployee(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    GetPage(
      name: Routes.myCompanyJobListPageWeb,
      page: () => const MyCompanyJobListPageWeb(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),
    GetPage(
      name: Routes.forgetPasswordEmailPage,
      page: () => const ForgetPasswordEmailPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 50),
    ),
    // GetPage(
    //   name: Routes.bottomNavBarCompany,
    //   page: () => const BottomNavBarCompany(),
    //   binding: JobListBinding(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),

    // GetPage(
    //   name: Routes.registration,
    //   page: () => const RegistrationPage(),
    //   // binding: SupportBinding(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    GetPage(
      name: Routes.registrationCompleted,
      page: () => const RegistrationCompletedPage(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),
    // GetPage(
    //   name: Routes.courseDetailMobilePage,
    //   page: () => const CourseDetailMobilePage(),
    //   binding: CourseDetailsBinding(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.categoryWiseCourse,
    //   page: () => const CategoryWiseCoursePage(),
    //   binding: CourseDetailsBinding(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    GetPage(
      name: Routes.appearTestAndScheduleInterviewMobilePage,
      page: () => const AppearTestAndScheduleInterviewMobilePage(),
      transition: Transition.fade,
      binding: AppearTestBinding(),
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),

    GetPage(
      name: Routes.selecteInterviewFormConfirmation,
      page: () => const SelectedInterviewDetailsPage(),
      binding: ConfirmInterviewRequestBinding(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),
    // GetPage(
    //   name: Routes.jobDetails,
    //   page: () => const JobDetailsPageMobile(),
    //   // binding: BlogsBinding(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),

    GetPage(
      name: Routes.postCompanyNewJob,
      page: () => const PostCompanyNewJobPage(),
      binding: PostJobBinding(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),
    GetPage(
      name: Routes.companyAddEmployeePageMobile,
      page: () => const CompanyAddEmployeePageMobile(),
      binding: AddedNewEmployeeBinding(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),
    GetPage(
      name: Routes.companyAssignedCourses,
      page: () => const CompanyAssignedCourses(),
      binding: CompanyAssingedCourseBinding(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),

    // /// Course Details
    GetPage(
      name: Routes.companyProfileUpdatePage,
      page: () => const CompanyProfileUpdatePage(),
      binding: CompanyProfileUpdateBinding(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),
    // GetPage(
    //   name: Routes.companyJobAppliedCandidateProfile,
    //   bindings: [CourseDetailsBinding(), UserDetailsBinding()],
    //   page: () => const CompanyJobAppliedCandidateProfile(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    GetPage(
      name: Routes.companyInvoicePage,
      page: () => const CompanyInvoiceViewPage(),
      binding: CourseDetailsBinding(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),

    GetPage(
      name: Routes.companyEmployeeProfilePage,
      page: () => const CompanyEmployeeProfilePage(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),

    GetPage(
      name: Routes.profileUpdatePage,
      page: () => ProfileUpdatePage(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      binding: ProfileBinding(),
      transitionDuration: const Duration(milliseconds: 50),
    ),
    // GetPage(
    //   name: Routes.courseVideo,
    //   page: () => const VideoPlayerPage(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgetPasswordPage(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),
    GetPage(
      name: Routes.resume,
      page: () => const ResumeViewPage(),
      transition: Transition.fade,
      // curve: Curves.easeInOut,
      // transitionDuration: const Duration(milliseconds: 50),
    ),
    GetPage(
      name: Routes.changePassword,
      binding: ChangePasswordBinding(),
      page: () => const ChangePasswordPage(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),

    GetPage(
      name: Routes.notification,
      page: () => NotificationViewPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 50),
    ),
    GetPage(
      name: Routes.otpVerification,
      page: () => const OTPverificationPage(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),
    GetPage(
      name: Routes.companyAppliedJobForMultipleEmployee,
      binding: CompanyAppliedJobBinding(),
      page: () => const CompanyAppliedJobForMultipleEmployee(),
      transition: Transition.fade,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 50),
    ),

    // /// Book Purchases
    // GetPage(
    //   name: Routes.cart,
    //   page: () => const CartPage(),
    //   binding: CartBinding(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.addressInfo,
    //   page: () => const AddressInformationPage(),
    //   binding: AddressInfoBinding(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.checkout,
    //   page: () => const CheckoutPage(),
    //   binding: CoursePurchaseBinding(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.congratulation,
    //   page: () => const CongratulationPage(),
    //   binding: CoursePurchaseBinding(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.webviewPage,
    //   page: () => const WebViewPage(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.examInfo,
    //   page: () => ExamInfoPage(),
    //   binding: ExamInfoBinding(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.subjectChoice,
    //   page: () => SubjectChoicePage(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.groupExamPage,
    //   page: () => const GroupExamPage(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.examPage,
    //   page: () => ExamPage(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.examAnalysis,
    //   page: () => const ExamAnalysisPage(),
    //   binding: ExamAnalysisBinding(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
    // GetPage(
    //   name: Routes.examLeaderboard,
    //   page: () => ExamLeaderboardPage(),
    //   binding: LeaderboardBinding(),
    //   transition: Transition.fade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 50),
    // ),
  ];
}
