import 'package:auto_crop/core/app_export.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/database/database.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import 'controller/profile_controller.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key})
      : super(
          key: key,
        );

  ProfileController controller = Get.put(ProfileController(ProfileModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 5.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTen(),
              SizedBox(height: 22.v),
              _buildLockColumn(),
              SizedBox(height: 19.v),
              Opacity(
                opacity: 0.8,
                child: Text(
                  "more".tr,
                  style: CustomTextStyles.titleSmallPrimary,
                ),
              ),
              SizedBox(height: 20.v),
              _buildUserColumn(),
              SizedBox(height: 2.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      title: AppbarTitle(
        text: "profile".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
  final DatabaseHelper dbHelper = DatabaseHelper();
  /// Section Widget
  Widget _buildTen() {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.outlineBlackF.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 57.adaptSize,
            width: 57.adaptSize,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse643,
                  height: 57.adaptSize,
                  color: Colors.white,
                  width: 57.adaptSize,
                  radius: BorderRadius.circular(
                    28.h,
                  ),
                  alignment: Alignment.center,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgLock,
                  height: 40.v,
                  width: 32.h,
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 7.v),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgUserImage,
                  height: 53.adaptSize,
                  width: 53.adaptSize,

                  radius: BorderRadius.circular(
                    26.h,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 11.h,
              top: 10.v,
              bottom: 10.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "msg_itunuoluwa_abidoye".tr,
                //   style: theme.textTheme.titleSmall,
                // ),
                // SizedBox(height: 2.v),
                FutureBuilder<String?>(
                  // Fetch the username asynchronously
                  future: dbHelper.getUserName(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // If the Future is still running, show a loading indicator
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // If there's an error, display an error message
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else {
                      // If the Future is complete, display the username
                      String userName = snapshot.data ?? 'Guest';
                      return Text(
                        '$userName',
                        style: CustomTextStyles.titleMediumWhiteA70001,
                      );
                    }
                  },
                ),
                // Text(
                //   "itunuoluwa".tr,
                //   style: CustomTextStyles.titleMediumWhiteA70001,
                // ),
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgIcOutlineModeEditOutline,
            height: 24.adaptSize,
            color: Colors.white,
            width: 24.adaptSize,
            margin: EdgeInsets.only(
              top: 14.v,
              right: 8.h,
              bottom: 19.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLockColumn() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 24.v,
      ),
      decoration: AppDecoration.outlineBlack9000f.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                height: 40.adaptSize,
                width: 40.adaptSize,
                padding: EdgeInsets.all(10.h),
                child: CustomImageView(
                  color: Colors.white,
                  imagePath: ImageConstant.imgLockPrimary,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 2.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "my account".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 5.v),
                    Text(
                      "msg make changes to".tr,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 56,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgVideoCamera,
                height: 14.adaptSize,

                width: 14.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 13.v),
              ),
              Spacer(
                flex: 43,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
                height: 20.v,
                width: 20.h,
                color: Colors.black,
                margin: EdgeInsets.symmetric(vertical: 14.v),
              ),
            ],
          ),
          SizedBox(height: 25.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                height: 40.adaptSize,
                width: 40.adaptSize,
                padding: EdgeInsets.all(10.h),
                child: CustomImageView(
                  color: Colors.white,
                  imagePath: ImageConstant.imgLockPrimary,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 2.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "saved beneficiary".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 5.v),
                    Text(
                      "manage your saved".tr,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
                height: 20.v,
                width: 20.h,
                color: Colors.black,
                margin: EdgeInsets.symmetric(vertical: 14.v),
              ),
            ],
          ),
          SizedBox(height: 25.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                height: 40.adaptSize,
                width: 40.adaptSize,
                padding: EdgeInsets.all(10.h),
                child: CustomImageView(
                  color: Colors.white,
                  imagePath: ImageConstant.imgLocation,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "face id touch".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 6.v),
                    Text(
                      "manage your device".tr,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Spacer(),
              // Obx(
              //   () => CustomSwitch(
              //     margin: EdgeInsets.symmetric(vertical: 5.v),
              //     value: controller.isSelectedSwitch.value,
              //     onChange: (value) {
              //       controller.isSelectedSwitch.value = value;
              //     },
              //   ),
              // ),
            ],
          ),
          // SizedBox(height: 25.v),
          // _buildArrowDown(
          //   logoutText: "two factor authentication".tr,
          //   furtherSecureText: "further secure your".tr,
          // ),
          SizedBox(height: 25.v),
          _buildArrowDown(
            logoutText: "log out".tr,
            furtherSecureText: "further secure your".tr,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserColumn() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.outlineBlack9000f.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildFavoriteRow(
            aboutApp: "help support".tr,
          ),
          SizedBox(height: 25.v),
          _buildFavoriteRow(
            aboutApp: "about app".tr,
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildArrowDown({
    required String logoutText,
    required String furtherSecureText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          height: 40.adaptSize,
          width: 40.adaptSize,
          padding: EdgeInsets.all(10.h),
          decoration: IconButtonStyleHelper.fillPrimary,
          child: CustomImageView(
            imagePath: ImageConstant.imgArrowDown,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.h,
            top: 2.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                logoutText,
                style: CustomTextStyles.titleSmallSemiBold.copyWith(
                  color: theme.colorScheme.errorContainer,
                ),
              ),
              SizedBox(height: 5.v),
              Text(
                furtherSecureText,
                style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 11.v,
          width: 6.h,
          margin: EdgeInsets.symmetric(vertical: 14.v),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildFavoriteRow({required String aboutApp}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          height: 40.adaptSize,
          width: 40.adaptSize,
          padding: EdgeInsets.all(10.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgFavorite,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.h,
            top: 12.v,
            bottom: 10.v,
          ),
          child: Text(
            aboutApp,
            style: theme.textTheme.labelLarge!.copyWith(
              color: theme.colorScheme.primaryContainer,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          color: Colors.black,
          height: 20.v,
          width: 20.h,
          margin: EdgeInsets.symmetric(vertical: 14.v),
        ),
      ],
    );
  }
}
