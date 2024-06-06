import '../controller/admin_screen_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AdminScreenTabContainerScreen.
///
/// This class ensures that the AdminScreenTabContainerController is created when the
/// AdminScreenTabContainerScreen is first loaded.
class AdminScreenTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminScreenTabContainerController());
  }
}
