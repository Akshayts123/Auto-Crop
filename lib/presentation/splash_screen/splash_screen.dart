import 'controller/splash_controller.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 18.v),
                      Image.asset(
                           ImageConstant.imgsplash,
                          color: Colors.white,
                          height: 103.adaptSize,
                          width: 103.adaptSize),
                      SizedBox(height: 17.v),
                      Text("lbl_agro_crop".tr,
                          style: CustomTextStyles
                              .headlineSmallMontserratWhiteA70001)
                    ]))));
  }
}
