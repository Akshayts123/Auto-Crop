import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/presentation/dashboard/dashboard_screen.dart';
import 'package:auto_crop/presentation/home_screen/home_screen.dart';
import 'package:auto_crop/presentation/home_screen/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/crop_database/crop_database.dart';
import '../../../data/database/database.dart';
import '../../add_crop_screen/controller/add_crop_controller.dart';
import '../../crop_screen/controller/crop_controller.dart';
import '../../sign_up_screen/models/users.dart';

/// A controller class for the HomeScreen.
///
/// This class manages the state of the HomeScreen, including the
/// current homeModelObj
class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<Map<String, dynamic>> searchResults = <Map<String, dynamic>>[].obs;

  Rx<HomeModel> homeModelObj = HomeModel().obs;
  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;
  RxBool isDataLoaded = true.obs;
  SelectionPopupModel? selectedDropDownValue2;
  String selectedWeather = "";
  String selectedSoil = "";
  String selectedMonth = "";
  Future<void> fetchData() async {
    // Simulate fetching data from an API or other source
    await Future.delayed(Duration(seconds: 2));
    // Update your data or perform any other necessary actions
  }
  RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in homeModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    homeModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    for (var element in homeModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    homeModelObj.value.dropdownItemList1.refresh();
  }

  onSelected2(dynamic value) {
    for (var element in homeModelObj.value.dropdownItemList2.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    homeModelObj.value.dropdownItemList2.refresh();
  }
  final AddCropController addCropController = Get.put(AddCropController());
  final CropController cropController = Get.put(CropController());
  // late RxList<Map<String, dynamic>> cropList;

  @override
  void onInit() {
    // cropList = addCropController.cropList;
    super.onInit();
  }

  void fetchCrops(String weather, String soil, String month) async {
    try {
      isDataLoaded.value = false;
      // Call the method to fetch crops based on conditions
      // List<Map<String, dynamic>> crops = await DatabaseHelpercrop.instance.getCropByConditions(weather, soil, month);
      List<Map<String, dynamic>> crops = await DatabaseHelpercrop.instance.getCropByConditions(weather, soil, month);
      // Update the display with the fetched crops
      // You can use the fetched 'crops' list to update your UI
      // print('Fetched Crops: $crops');

      // For example, you can update a list in your state or controller
      addCropController.cropList.assignAll(crops);
      searchResults.clear();
    } catch (e) {
      // Handle any exceptions that may occur during the fetch
      print('Error fetching crops: $e');
    }
  }
  Rx<User?> signedUpUser = Rx<User?>(null);

   signUpUser(User user) async {
    signedUpUser.value = user;

    // Create an instance of DatabaseHelper
    DatabaseHelper dbHelper = DatabaseHelper();

    // Open the database
    await dbHelper.open();

    // Save the user's name
    await dbHelper.saveUserName(user.name);
  }
  void searchCrops(String keyword) {
    if (keyword.isEmpty) {
      searchResults.clear();
      return;
    }

    searchResults.assignAll(cropController.cropList.where((crop) {
      return crop['name'].toLowerCase().contains(keyword.toLowerCase()) ||
          crop['weather'].toLowerCase().contains(keyword.toLowerCase()) ||
          crop['soil'].toLowerCase().contains(keyword.toLowerCase()) ||
          crop['month'].toLowerCase().contains(keyword.toLowerCase());
    }));
  }
  // void fetchCrops() async {
  //   // Get the selected values from the AddCropController
  //   final String weather = addCropController.selectedDropDownValue2?.title ?? "";
  //   final String soil = addCropController.selectedDropDownValue1?.title ?? "";
  //   final String month = addCropController.selectedDropDownValue?.title ?? "";
  //
  //   // Call the method to fetch crops based on the selected values
  //   await addCropController.getCropByConditions(weather, soil, month);
  // }

}
