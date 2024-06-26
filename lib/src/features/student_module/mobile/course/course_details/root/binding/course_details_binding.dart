import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/view_comment_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/view_reply_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/write_comment_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/comment/controller/write_reply_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/controller/is_watch_video_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_content/controller/student_course_content_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_price/controller/course_price_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/course_registration/controller/course_registration_view_controller.dart';
import 'package:all_in_one/src/features/student_module/mobile/course/course_details/user_course_availablity/controller/user_course_availablity_view_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class CourseDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentCourseContentViewController(), fenix: true);
    Get.lazyPut(() => ViewCommentViewController(), fenix: true);
    Get.lazyPut(() => CourseRegistrationViewController(), fenix: true);
    Get.lazyPut(() => CoursePriceViewController(), fenix: true);
    Get.lazyPut(() => UserCourseAvailabilityViewController(), fenix: true);
    Get.lazyPut(() => WriteCommentViewController(), fenix: true);
    Get.lazyPut(() => IsWatchVideoViewController(), fenix: true);
    Get.lazyPut(() => WriteReplyViewController(), fenix: true);
    Get.lazyPut(() => ViewReplyViewController(), fenix: true);
  }
}
