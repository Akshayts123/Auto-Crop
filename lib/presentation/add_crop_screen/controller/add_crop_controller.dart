import 'dart:typed_data';

import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/presentation/crop_screen/controller/crop_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/crop_database/crop_database.dart';
import '../models/add_doctor_model.dart';

/// A controller class for the AddDoctorScreen.
///
/// This class manages the state of the AddDoctorScreen, including the
/// current addDoctorModelObj
class AddCropController extends GetxController {
  var cropList = <Map<String, dynamic>>[].obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  final CropController cropController =  Get.put(CropController());
  Rx<AddCropModel> addCropModelObj = AddCropModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
  }
  String selectedWeather = "";
  String selectedSoil = "";
  String selectedMonth = "";

// Modify your onSelected and onChanged methods in HomeController
  onSelected(SelectionPopupModel? value) {
    selectedDropDownValue = value;
    selectedMonth = value?.title ?? ""; // Store selected value in the variable
    updateDropdownItemList(addCropModelObj.value.dropdownItemList, value);
  }

  onSelected1(SelectionPopupModel? value) {
    selectedDropDownValue1 = value;
    selectedSoil = value?.title ?? ""; // Store selected value in the variable
    updateDropdownItemList(addCropModelObj.value.dropdownItemList1, value);
  }

  onSelected2(SelectionPopupModel? value) {
    selectedDropDownValue2 = value;
    selectedWeather = value?.title ?? ""; // Store selected value in the variable
    updateDropdownItemList(addCropModelObj.value.dropdownItemList2, value);
  }
  // onSelected(SelectionPopupModel? value) {
  //   selectedDropDownValue = value;
  //
  //   updateDropdownItemList(addCropModelObj.value.dropdownItemList, value);
  // }
  //
  // onSelected1(SelectionPopupModel? value) {
  //   selectedDropDownValue1 = value;
  //   updateDropdownItemList(addCropModelObj.value.dropdownItemList1, value);
  // }
  //
  // onSelected2(SelectionPopupModel? value) {
  //   selectedDropDownValue2 = value;
  //   updateDropdownItemList(addCropModelObj.value.dropdownItemList2, value);
  // }

  void updateDropdownItemList(Rx<List<SelectionPopupModel>> itemList, SelectionPopupModel? value) {
    for (var element in itemList.value) {
      element.isSelected = false;
      if (element.id == value?.id) {
        element.isSelected = true;
      }
    }
    itemList.refresh();
  }

  Rx<Uint8List> medicineImageBytes = Uint8List(0).obs;
  void setMedicineImageBytes(Uint8List bytes) {
    medicineImageBytes.value = bytes;
  }
   final dbHelper = DatabaseHelpercrop.instance;
  // Function to update medicine in the database
  Future<void> editCropInDatabase(int cropid) async {
    try {
      // Fetch the current medicine details from the database
      Map<String, dynamic>? currentCropData = await dbHelper.getCrop(cropid);

      // Check if currentMedicineData is not null
      if (currentCropData != null) {
        // Set the initial values in the controllers
        nameController.text = currentCropData['name'] ?? '';
        detailController.text = currentCropData['detail'] ?? '';

        selectedDropDownValue = addCropModelObj.value.dropdownItemList.value.firstWhere(
              (element) => element.title == currentCropData['month'],
          orElse: () => null as SelectionPopupModel,
        );
        selectedDropDownValue1 = addCropModelObj.value.dropdownItemList1.value.firstWhere(
              (element) => element.title == currentCropData['soil'],
          orElse: () => null as SelectionPopupModel,
        );
        selectedDropDownValue2 = addCropModelObj.value.dropdownItemList2.value.firstWhere(
              (element) => element.title == currentCropData['weather'],
          orElse: () => null as SelectionPopupModel,
        );
        // Set the medicine image bytes
        setMedicineImageBytes(currentCropData['image'] ?? Uint8List(0));
        update();
        // Navigate to the AddMedicineScreen for editing
        // await Get.toNamed(
        //   AppRoutes.addMedicineScreen,
        //   arguments: {
        //     'medicineId': medicineId,
        //   },
        // );
      } else {
        // Handle the case where currentMedicineData is null
        print('Error: Medicine data not found for ID $cropid');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the edit operation
      print('Error during edit: $e');
    }
  }

  Future<void> updateCropInDatabase(int cropid) async {
    try {
      // Fetch the updated values from the controllers
      Map<String, dynamic> updatedData = {
        'name': nameController.text,
        'detail': detailController.text,
        'month': selectedDropDownValue?.title??"",
        'soil': selectedDropDownValue1?.title ?? "",
        'weather': selectedDropDownValue2?.title ?? "",
        'image': medicineImageBytes.value,
      };

      // Update the medicine in the database
      await dbHelper.updateCrop(cropid, updatedData);

      // Debugging print
      print('Medicine updated successfully');
    } catch (e) {
      // Handle any exceptions that may occur during the update operation
      print('Error during update: $e');
    }
  }


  Future<void> deleteCropFromDatabase(int cropid) async {
    await dbHelper.deleteCrop(cropid);
    print('Medicine deleted successfully');
  }

  Future<void> getCropByConditions(String weather, String soil, String month) async {
    try {

      // Call the method in CropController to fetch crops based on conditions
      await cropController.getCropByConditions(weather, soil, month);
    } catch (e) {
      // Handle any exceptions that may occur during the fetch operation
      print('Error during getCropByConditions: $e');
    } finally {
      // Set isDataLoaded back to true when loading is complete or an error occurs
    }
  }

  Future<void> addOrUpdateCrop() async {
    final arguments = Get.arguments;
    final cropid = arguments?['cropid'] as int?;

    Map<String, dynamic> cropData = {
      'name': nameController.text,
      'detail': detailController.text,
      'month': selectedDropDownValue?.title ?? "",
      'soil': selectedDropDownValue1?.title ?? "",
      'weather': selectedDropDownValue2?.title ?? "",
      'image': medicineImageBytes.value,
    };

    print('Adding/Updating medicine to database: $cropData');

    if (cropid == null) {
      // Add new medicine
      await dbHelper.insertCrop(cropData);
      await cropController.getCrop();
      print('Medicine added successfully');
    } else {
      // Update existing medicine
      await dbHelper.updateCrop(cropid, cropData);
      await cropController.getCrop();
      print('Medicine updated successfully');
    }

    // Navigate to the MedicinesScreen after saving or updating
    Get.offNamed(AppRoutes.cropScreen);

  }

  Future<Uint8List?> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return await pickedFile.readAsBytes();
    }
    return null;
  }
  void clearFields() {
    nameController.clear();
    detailController.clear();
    selectedDropDownValue = null;
    selectedDropDownValue1 = null;
    selectedDropDownValue2 = null;
    medicineImageBytes.value = Uint8List(0);
    update();
  }
}
