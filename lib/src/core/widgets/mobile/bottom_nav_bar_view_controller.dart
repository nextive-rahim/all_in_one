import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DashboardViewController extends GetxController {
  final RxInt _index = 0.obs;

  int get currentIndex => _index.value;

  void updateIndex(int index) => _index.value = index;

  /// Navbar visibility
  final RxBool _navBarVisibility = true.obs;

  bool get navBarVisibility => _navBarVisibility.value;

  void updateNavBarVisibility(bool value) => _navBarVisibility.value = value;
}
