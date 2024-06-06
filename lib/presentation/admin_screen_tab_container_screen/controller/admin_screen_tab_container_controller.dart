import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/presentation/admin_screen_tab_container_screen/models/admin_screen_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AdminScreenTabContainerScreen.
///
/// This class manages the state of the AdminScreenTabContainerScreen, including the
/// current adminScreenTabContainerModelObj
class AdminScreenTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<AdminScreenTabContainerModel> adminScreenTabContainerModelObj =
      AdminScreenTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
