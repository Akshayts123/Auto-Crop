import '../controller/crop_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CropScreen.
///
/// This class ensures that the CropController is created when the
/// CropScreen is first loaded.
class CropBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CropController());
  }
}
