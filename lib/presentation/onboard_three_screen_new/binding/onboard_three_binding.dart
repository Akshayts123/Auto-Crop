import '../controller/onboard_three_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardThreeScreen.
///
/// This class ensures that the OnboardThreeController is created when the
/// OnboardThreeScreen is first loaded.
class OnboardThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardThreeController());
  }
}
