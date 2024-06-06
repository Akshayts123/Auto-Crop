import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/presentation/crop_screen/models/crop_model.dart';

/// A controller class for the CropScreen.
///
/// This class manages the state of the CropScreen, including the
/// current cropModelObj
class AdminController extends GetxController {
  Rx<CropModel> cropModelObj = CropModel().obs;
}
