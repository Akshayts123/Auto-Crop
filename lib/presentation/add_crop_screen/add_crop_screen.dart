import 'dart:typed_data';

import 'controller/add_crop_controller.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/widgets/app_bar/appbar_leading_image.dart';
import 'package:auto_crop/widgets/app_bar/appbar_title.dart';
import 'package:auto_crop/widgets/app_bar/custom_app_bar.dart';
import 'package:auto_crop/widgets/custom_drop_down.dart';
import 'package:auto_crop/widgets/custom_elevated_button.dart';
import 'package:auto_crop/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddCropScreen extends GetWidget<AddCropController> {
  const AddCropScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 16.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_name".tr,
                          style: theme.textTheme.titleSmall)),
                  SizedBox(height: 4.v),
                  CustomTextFormField(
                      controller: controller.nameController,
                      textInputAction: TextInputAction.done),
                  SizedBox(height: 4.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_month".tr,
                          style: theme.textTheme.titleSmall)),
                  SizedBox(height: 4.v),
                  CustomDropDown(

                    fillColor: Colors.white,
                      borderDecoration: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width: 1)),
                      icon: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 14.v, 10.h, 10.v),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowdropdown,
                              color: Colors.black,
                              height: 24.adaptSize,
                              width: 24.adaptSize)),
                      suffix: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 14.v, 10.h, 10.v),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowdropdown,
                              color: Colors.black,
                              height: 24.adaptSize,
                              width: 24.adaptSize)),
                      items: controller
                          .addCropModelObj.value.dropdownItemList!.value,
                      onChanged: (value) {
                        controller.onSelected(value);
                      }),
                  SizedBox(height: 4.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_soil".tr,
                          style: theme.textTheme.titleSmall)),
                  SizedBox(height: 4.v),
                  CustomDropDown(
                      fillColor: Colors.white,
                      borderDecoration: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width: 1)),

                      icon: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 14.v, 10.h, 10.v),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowdropdown,
                              height: 24.adaptSize,
                              width: 24.adaptSize)),
                      suffix: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 14.v, 10.h, 10.v),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowdropdown,
                              color: Colors.black,
                              height: 24.adaptSize,
                              width: 24.adaptSize)),
                      items: controller
                          .addCropModelObj.value.dropdownItemList1!.value,
                      onChanged: (value) {
                        controller.onSelected1(value);

                      }),
                  SizedBox(height: 4.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_whether".tr,
                          style: theme.textTheme.titleSmall)),
                  SizedBox(height: 4.v),
                  CustomDropDown(
                      fillColor: Colors.white,
                      borderDecoration: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width: 1)),

                      icon: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 14.v, 10.h, 10.v),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowdropdown,
                              height: 24.adaptSize,
                              width: 24.adaptSize)),
                      suffix: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 14.v, 10.h, 10.v),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowdropdown,
                              color: Colors.black,
                              height: 24.adaptSize,
                              width: 24.adaptSize)),
                      items: controller
                          .addCropModelObj.value.dropdownItemList2!.value,
                      onChanged: (value) {
                        controller.onSelected2(value);
                      }),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Description".tr,
                          style: theme.textTheme.titleSmall)),
                  SizedBox(height: 4.v),
                  CustomTextFormField(
                      controller: controller.detailController,
                      textInputAction: TextInputAction.done),
                  SizedBox(height: 58.v),
                  GestureDetector(onTap: () async{
                    Uint8List? imageBytes = await controller.pickImage();
                    if (imageBytes != null) {
                      controller.setMedicineImageBytes(imageBytes);
                    }
                  },
                    child: Container(
                        height: 125.v,
                        width: 157.h,

                        padding: EdgeInsets.all(36.h),
                        decoration: AppDecoration.fillBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10),
                        child: Obx(() {
                          return controller.medicineImageBytes.value.isNotEmpty
                              ? Image.memory(
                            controller.medicineImageBytes.value,
                            fit: BoxFit.cover,
                          )
                              : Center(
                            child: Icon(Icons.add_a_photo, size: 40.0),
                          );
                        }),),
                  ),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildSubmitButton()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft();
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_add_crops".tr));
  }

  /// Section Widget
  _buildSubmitButton() {
    return CustomElevatedButton(
        margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 44.v),
        buttonTextStyle: CustomTextStyles.titleMediumWhiteA70001,
      onPressed: () async {
        try {
          final arguments = Get.arguments;
          final cropId = arguments?['cropid'] as int?;

          cropId == null
              ? await _saveMedicine()
              : await _updateMedicine(cropId);
        } catch (e) {
          print('Error: $e');
        }
      },
      height: 40.v,
      width: 154.h,
      text: (Get.arguments != null && Get.arguments!['cropid'] != null)
          ? "Update".tr
          : "Submit".tr,
    );
  }


  Future<void> _saveMedicine() async {
    await controller.addOrUpdateCrop();
  }


  Future<void> _updateMedicine(int cropid) async {
    await controller.addOrUpdateCrop();
  }
  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
