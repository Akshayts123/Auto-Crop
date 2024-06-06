import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/presentation/crop_screen/models/crop_model.dart';

import '../../../data/crop_database/crop_database.dart';

/// A controller class for the CropScreen.
///
/// This class manages the state of the CropScreen, including the
/// current cropModelObj
class CropController extends GetxController {
  Rx<CropModel> cropModelObj = CropModel().obs;
  var cropList = <Map<String, dynamic>>[].obs;
  RxBool isDataLoaded = true.obs;
  @override
  void onInit() {
    getCrop();
    super.onInit();
  }
  late final DatabaseHelpercrop dbHelper; // Declare dbHelper as an instance variable

  // Constructor to initialize dbHelper
  CropController() {
    dbHelper = DatabaseHelpercrop.instance;
  }

  // Function to get medicines from the database
  Future<void> getCrop() async {
    // Debugging print
    print('Fetching medicines from the database');

    cropList.value = await dbHelper.getAllCrop();
    isDataLoaded.value = false;
    // Debugging print
    print('Medicines fetched: $cropList');
  }
  Future<void> getCropByConditions(String weather, String soil, String month) async {
    // Implement your logic to fetch crops based on conditions (weather, soil, month)
    // Use dbHelper or any other method you have to interact with the database
    try {
      // Example: Fetch crops from the database based on conditions
      List<Map<String, dynamic>> crops = await dbHelper.getCropByConditions(weather, soil, month);

      // Update the cropList
      cropList.value = crops;

      // Debugging print
      print('Crops fetched based on conditions: $crops');
    } catch (e) {
      // Handle any exceptions that may occur during the fetch operation
      print('Error during getCropByConditions: $e');
    }
  }
}
