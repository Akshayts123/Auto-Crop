import 'controller/inner_page_controller.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/widgets/app_bar/appbar_leading_image.dart';
import 'package:auto_crop/widgets/app_bar/custom_app_bar.dart';
import 'package:auto_crop/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class InnerPageScreen extends GetWidget<InnerPageController> {
  const InnerPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments = Get.arguments;
    final image = arguments?["image"];
    final name = arguments?["name"];
    final detail = arguments?["detail"];

    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(children: [
                  Image.memory(
                       image,
                      height: 156.v,
                      width: 335.h,
                    fit: BoxFit.cover,
                      ),
                  SizedBox(height: 14.v),
                  Text(name,
                      style: CustomTextStyles.titleSmallBold),
                  SizedBox(height: 11.v),
                  Container(
                      width: 294.h,
                      margin: EdgeInsets.only(left: 19.h, right: 21.h),
                      child: Text(detail,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodySmall12)),
                  SizedBox(height: 39.v),
                  _buildTwentyEight(),
                  Spacer(flex: 51),
                  CustomElevatedButton(text: "msg_add_to_my_garden".tr),
                  Spacer(flex: 48)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,

            margin: EdgeInsets.fromLTRB(24.h, 20.v, 335.h, 20.v),
            onTap: () {
              onTapArrowBack();
            }));
  }

  /// Section Widget
  Widget _buildTwentyEight() {
    final Map<String, dynamic>? arguments = Get.arguments;
    final month = arguments?["month"];
    final soil = arguments?["soil"];
    final weather = arguments?["weather"];
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 66.h, vertical: 28.v),
        decoration: AppDecoration.fillBlueGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 0.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text("Month".tr,
                        style: theme.textTheme.labelLarge),
                    Padding(
                        padding: EdgeInsets.only(left: 37.h),
                        child: Text(month,
                            style: theme.textTheme.labelLarge))
                  ])),
              SizedBox(height: 14.v),
              Padding(
                  padding: EdgeInsets.only(right: 0.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 1.v),
                            child: Text("lbl_soil".tr,
                                style: theme.textTheme.labelLarge)),
                        Text(soil,
                            style: theme.textTheme.labelLarge)
                      ])),
              SizedBox(height: 13.v),
              Padding(
                  padding: EdgeInsets.only(right: 0.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Weather".tr,
                            style: theme.textTheme.labelLarge),
                        Text(weather,
                            style: theme.textTheme.labelLarge)
                      ]))
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowBack() {
    Get.back();
  }
}
