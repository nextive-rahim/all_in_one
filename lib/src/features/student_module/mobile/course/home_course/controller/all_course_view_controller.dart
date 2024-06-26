// import 'package:all_in_one/src/core/page_state/state.dart';
// import 'package:all_in_one/src/core/utils/util.dart';
// import 'package:all_in_one/src/core/widgets/logger.dart';
// import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/course_response_model.dart';
// import 'package:all_in_one/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
// import 'package:all_in_one/src/features/student_module/mobile/course/home_course/repository/student_home_repository.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class AllCourseViewController extends GetxController {
//   final StudentHomeRepository _repository = StudentHomeRepository();

//   /// Page State
//   final Rx<PageState> _pageStateController = Rx(PageState.initial);
//   get pageState => _pageStateController.value;

//   RxList<CourseCategory> courseCategory = <CourseCategory>[].obs;
//   RxList<Collection> searchCourse = <Collection>[].obs;
//   RxList<CollectinList> courselist = <CollectinList>[].obs;

//   Future<void> getStudentHomeData() async {
//     _pageStateController(PageState.loading);

//     try {
//       final res = await _repository.fetchStudentDashboard();
//       CourseResponseModel response = CourseResponseModel.fromJson(res);

//       courseCategory.value = response.data ?? [];

//       // courselist.value =
//       // courseCategory.where((p0) => courselist.add(p0.collectinList))
//       ;
//       _pageStateController(PageState.success);
//     } catch (e, stackTrace) {
//       Log.error(e.toString());
//       Log.error(stackTrace.toString());
//       _pageStateController(PageState.error);
//     }
//   }

//   void searchHomeCourse(String searchText) {
//     Util.log(searchText);
//     String searchLowerCase = searchText.toLowerCase();
//     if (searchText.isNotEmpty) {
//       searchCourse.value = homeCourses
//           .where((element) =>
//               ((element.title!).toLowerCase().contains(searchLowerCase)))
//           .toList();

//       update();
//     } else {
//       searchCourse.clear();
//       update();
//     }
//   }
// }
