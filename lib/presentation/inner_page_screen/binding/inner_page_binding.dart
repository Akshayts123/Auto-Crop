import '../controller/inner_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the InnerPageScreen.
///
/// This class ensures that the InnerPageController is created when the
/// InnerPageScreen is first loaded.
class InnerPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InnerPageController());
  }
}
