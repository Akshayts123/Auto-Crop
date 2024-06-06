import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/presentation/home_screen_two_screen/models/home_screen_two_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the HomeScreenTwoScreen.
///
/// This class manages the state of the HomeScreenTwoScreen, including the
/// current homeScreenTwoModelObj
class HomeScreenTwoController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<HomeScreenTwoModel> homeScreenTwoModelObj = HomeScreenTwoModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in homeScreenTwoModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    homeScreenTwoModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    for (var element in homeScreenTwoModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    homeScreenTwoModelObj.value.dropdownItemList1.refresh();
  }

  onSelected2(dynamic value) {
    for (var element in homeScreenTwoModelObj.value.dropdownItemList2.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    homeScreenTwoModelObj.value.dropdownItemList2.refresh();
  }
}
