import 'package:get/get.dart';

class ResponsibleViewController extends GetxController {
  RxDouble screenWidth = 0.0.obs;
  RxDouble screenHeight = 0.0.obs;
  RxBool isDesktop = false.obs;
  RxBool isTablet = false.obs;
  RxBool isMobile = false.obs;
}
