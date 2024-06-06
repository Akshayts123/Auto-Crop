import '../controller/add_crop_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddDoctorScreen.
///
/// This class ensures that the AddDoctorController is created when the
/// AddDoctorScreen is first loaded.
class AddCropBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCropController());
  }
}
