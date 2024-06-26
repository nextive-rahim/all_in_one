part of './app_pages.dart';

abstract class Routes {
  /// On boarding
  static const String initial = '/';
  static const String splash = '/splash';

  /// Authentication
  static const login = '/login';
  static const registration = '/registration';
  static const engagement = '/engagement';
  static const registrationCompleted = '/registrationCompleted';
  static const forgotPassword = '/forgot-password';
  static const otp = '/otp';
  static const setNewPassword = '/set-new-password';
  static const forgetPasswordEmailPage = '/forgetPasswordEmailPage';
  static const profileUpdatePage = '/profileUpdatePage';
  static const otpVerification = '/otpVerification';

  /// Dashboard
  static const responsibileDashboardFirstTime =
      '/responsibileDashboardFirstTime';
  static const bottomNavBarStudent = '/bottomNavBarStudent';
  static const bottomNavBarCompany = '/bottomNavBarCompany';
  static const bottomNavBarEmployee = '/bottomNavBarEmployee';
  static const bottomNavBarInterview = '/bottomNavBarInterview';

  static const responsiveLayoutDashboardInterview =
      '/responsiveLayoutDashboardInterview';
  static const dashboardRegFirstTimeEmployeeWeb =
      '/dashboardRegFirstTimeEmployeeWeb';
  static const myCompanyJobListPageWeb = '/myCompanyJobListPageWeb';
  static const jobDetails = '/jobDetails';
  static const postCompanyNewJob = '/postCompanyNewJob';
  static const responsiveLayoutCourseDetailFormRegister =
      '/responsiveLayoutCourseDetailFormRegister';
  static const companyAddEmployeePageMobile = '/companyAddEmployeePageMobile';
  static const companyAssignedCourses = '/companyAssignedCourses';
  static const companyProfileUpdatePage = '/companyProfileUpdatePage';
  static const companyJobAppliedCandidateProfile =
      '/CompanyJobAppliedCandidateProfile';
  static const companyEmployeeProfilePage = '/companyEmployeeProfilePage';
  static const companyInvoicePage = '/companyInvoicePage';
  static const categoryWiseCourse = '/categoryWiseCourse';

  /// Classroom
  static const courseDetailMobilePage = '/courseDetailMobilePage';
  static const appearTestAndScheduleInterviewMobilePage =
      '/appearTestAndScheduleInterviewMobilePage';
  static const liveClassFromCourseSection = '/liveClassFromCourseSection';
  static const courseSections = '/courseContent';
  static const courseSectionContents = '/courseSectionContents';
  static const pdfList = '/pdfList';
  static const resume = '/resume';
  static const changePassword = '/changePassword';
  static const noteDetails = '/noteDetails';
  static const courseVideo = '/courseVideo';

  /// interview

  static const selecteInterviewFormConfirmation =
      '/selecteInterviewFormConfirmation';
  static const bookStore = '/bookStore';
  static const bookPreviews = '/bookPreviews';

  /// Book Purchase
  static const cart = '/cart';
  static const addressInfo = '/addressInfo';
  static const checkout = '/checkout';
  static const congratulation = '/congratulation';

  /// Home drawer
  static const support = '/support';
  static const message = '/feedback';
  static const myCourse = '/myCourse';
  static const aboutUs = '/aboutUs';

  /// Notification & Notice
  static const notificationAndNoticeTab = '/notificationAndNoticeTab';
  static const notification = '/notification';
  static const notice = '/notice';

  /// Subject Review
  static const blogPage = '/blogPage';
  static const blogDetailsPage = '/subjectReviewDetails';

  // /// University Information
  // static const universityCategory = '/universityCategory';
  // static const instituteList = '/instituteList';
  // static const instituteDetails = '/instituteDetails';

  /// Eligibility Verification
  static const eligibilityVerification = '/eligibilityVerification';
  static const universityList = '/universityList';
  static const eligibleUniversityDetails = '/eligibleUniversityDetails';

  /// Admission Calendar
  static const admissionCalendar = '/admissionCalendarPage';
  static const admitCard = '/admitCard';
  static const seatPlane = '/seatPlane';
  static const result = '/result';

  /// Question Bank
  static const questionBank = '/questionBank';
  static const varsitySelection = '/universitySelection';
  static const unitSelection = '/unitSelection';
  static const examList = '/examList';
  static const groupExamPage = '/groupExamPage';
  static const subjectChoice = '/examSubjectChoice';
  static const examPage = '/examPage';
  static const examInfo = '/examInfo';
  static const examAnalysis = '/examAnalysis';
  static const examLeaderboard = '/examLeaderboard';
  static const courseListPage = '/courseListPage';

  ///  ProblemSolvingPage
  static const problemSolvingPage = '/problemSolvingPage';
  static const problemSolvingPostDetails = '/problemSolvingPostDetails';

  /// Courses
  static const courseDetails = '/courseDetails'; // Pre purchase details

  /// MISC
  static const updateProfilePage = '/updateProfilePage';
  static const webviewPage = '/webviewPage';
}
