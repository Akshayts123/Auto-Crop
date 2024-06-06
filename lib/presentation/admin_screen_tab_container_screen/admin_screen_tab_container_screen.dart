import 'controller/admin_screen_tab_container_controller.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/presentation/admin_screen_page/admin_screen_page.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AdminScreenTabContainerScreen
    extends GetWidget<AdminScreenTabContainerController> {
  const AdminScreenTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAdminTabView(),
              SizedBox(
                height: 638.v,
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    AdminScreenPage(),
                    AdminScreenPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAdminTabView() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.fillWhiteA70001,
      child: Column(
        children: [
          SizedBox(height: 57.v),
          Text(
            "lbl_admin".tr,
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 44.v),
          Container(
            height: 38.v,
            width: 335.h,
            child: TabBar(
              controller: controller.tabviewController,
              labelPadding: EdgeInsets.zero,
              labelColor: appTheme.whiteA70001,
              labelStyle: TextStyle(
                fontSize: 16.fSize,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelColor:
                  theme.colorScheme.secondaryContainer.withOpacity(1),
              unselectedLabelStyle: TextStyle(
                fontSize: 16.fSize,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
              indicator: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(
                  10.h,
                ),
              ),
              tabs: [
                Tab(
                  child: Text(
                    "lbl_farmers".tr,
                  ),
                ),
                Tab(
                  child: Text(
                    "lbl_crops".tr,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
