import '../controller/home_screen_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HomeScreenTwoScreen.
///
/// This class ensures that the HomeScreenTwoController is created when the
/// HomeScreenTwoScreen is first loaded.
class HomeScreenTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenTwoController());
  }
}
