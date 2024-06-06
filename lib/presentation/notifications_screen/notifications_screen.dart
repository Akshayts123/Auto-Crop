import 'package:auto_crop/core/app_export.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../notifications_screen/widgets/notificationslist_item_widget.dart';
import 'controller/notifications_controller.dart';
import 'models/notificationslist_item_model.dart';
import 'package:flutter/material.dart';


// ignore_for_file: must_be_immutable
class NotificationsScreen extends GetWidget<NotificationsController> {
  const NotificationsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Obx(
          () => ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 1.v,
              );
            },
            itemCount: controller.notificationsModelObj.value
                .notificationslistItemList.value.length,
            itemBuilder: (context, index) {
              NotificationslistItemModel model = controller
                  .notificationsModelObj
                  .value
                  .notificationslistItemList
                  .value[index];
              return NotificationslistItemWidget(
                model,
              );
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 44.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgVector,
        margin: EdgeInsets.only(
          left: 36.h,
          top: 12.v,
          bottom: 12.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_notifications".tr,

      ),
    );
  }
}
