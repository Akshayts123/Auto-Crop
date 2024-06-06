import 'dart:typed_data';

import '../add_crop_screen/controller/add_crop_controller.dart';
import '../crop_screen/widgets/userprofile_item_widget.dart';
import 'controller/crop_controller.dart';
import 'models/crop_model_1.dart';
import 'models/userprofile_item_model.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CropScreen extends GetWidget<CropController> {
   CropScreen({Key? key})
      : super(
          key: key,
        );
  final addcontroller= Get.put(AddCropController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () {
          return controller.getCrop();
        },
        child: Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTwenty(),
                  CustomElevatedButton(
                    onPressed: () {addcontroller.clearFields(); Get.toNamed(AppRoutes.addCropScreen);},
                    height: 33.v,
                    text: "lbl_add_crops2".tr,
                    leftIcon: Container(
                      margin: EdgeInsets.only(right: 11.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgPersonadd,
                        height: 24.adaptSize,
                        color: Theme.of(context).primaryColor,
                        width: 24.adaptSize,
                      ),
                    ),
                    buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
                    buttonTextStyle: CustomTextStyles.titleMediumPrimary,
                  ),
                  SizedBox(height: 19.v),
                  _buildUserProfile(),
                  SizedBox(height: 19.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwenty() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 19.v,
      ),
      decoration: AppDecoration.fillWhiteA70001,
      child: Column(
        children: [
          SizedBox(height: 48.v),
          Text(
            "lbl_admin".tr,
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 44.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomElevatedButton(
                  onPressed: () => Get.toNamed(AppRoutes.adminScreen),
                  height: 38.v,
                  text: "lbl_farmers".tr,
                  margin: EdgeInsets.only(right: 9.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL10,
                  buttonTextStyle: theme.textTheme.titleMedium!,
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  height: 38.v,
                  text: "lbl_crops".tr,
                  margin: EdgeInsets.only(left: 9.h),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Padding(
      padding: EdgeInsets.only(
        left: 30.h,
        right: 20.h,
      ),
      child: Obx(
        () {
          if (controller.isDataLoaded.value) {
            // Data is still loading
            return Center(child: CircularProgressIndicator());
          } else if (controller.cropList.isEmpty) {
            // Data loaded, but no doctors available
            return Center(child: Text('No Crops available.'));
          } else {
            return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 14.v,
                );
              },
              itemCount: controller.cropList.length,
              itemBuilder: (context, index) {
                UserprofileItemModel model = controller
                    .cropModelObj.value.userprofileItemList.value[index];
                Map<String, dynamic> cropData = controller.cropList[index];
                return UserprofileItemWidget(
                  model: CropdetailsItemModel1(
                      id: cropData["id"]??"",
                      name:cropData["name"]??"",
                    detail:cropData["detail"]??"",
                      month: cropData["month"]??"",
                      soil: cropData["soil"]??"",
                      weather: cropData["weather"]??"",
                      image: cropData["image"]?? Uint8List(0),),
                );
              },
            );
          }
        },
      ),
    );
  }
}
