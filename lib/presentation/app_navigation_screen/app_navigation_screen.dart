import 'controller/app_navigation_controller.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "add doctor screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.addCropScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "admin screen - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.adminScreenTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "crop screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.cropScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "splash screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "onboard Three".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardThreeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "sign in screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signInScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "sign up screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "HOME SCREEN".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.homeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "HOME SCREEN Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.homeScreenTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "inner page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.innerPageScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
