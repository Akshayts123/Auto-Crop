
import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../admin_screen_page/controller/admin_screen_controller.dart';
import '../../admin_screen_page/models/userprofilelist_item_model.dart';

// ignore: must_be_immutable
class UserprofilelistItemWidget extends StatelessWidget {
  UserprofilelistItemWidget(
    this.userprofilelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofilelistItemModel userprofilelistItemModelObj;

  var controller = Get.find<AdminScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.v,
      width: 335.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 22.h,
                vertical: 10.v,
              ),
              decoration: AppDecoration.outlineSecondaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.v),
                  Padding(
                    padding: EdgeInsets.only(right: 105.h),
                    child: Row(
                      children: [
                        Obx(
                          () => Text(
                            userprofilelistItemModelObj.farmerName!.value,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Spacer(),
                        Obx(
                          () => Text(
                            userprofilelistItemModelObj.text!.value,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Obx(
                            () => Text(
                              userprofilelistItemModelObj.anoopK!.value,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.v),
                  Padding(
                    padding: EdgeInsets.only(right: 23.h),
                    child: Row(
                      children: [
                        Obx(
                          () => Text(
                            userprofilelistItemModelObj.emailID!.value,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Spacer(),
                        Obx(
                          () => Text(
                            userprofilelistItemModelObj.text1!.value,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Obx(
                            () => Text(
                              userprofilelistItemModelObj.email!.value,
                              style: CustomTextStyles.titleSmallPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7.v),
                  Padding(
                    padding: EdgeInsets.only(right: 76.h),
                    child: Row(
                      children: [
                        Obx(
                          () => Text(
                            userprofilelistItemModelObj.phoneNumber!.value,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 28.h),
                          child: Obx(
                            () => Text(
                              userprofilelistItemModelObj.text2!.value,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Obx(
                            () => Text(
                              userprofilelistItemModelObj.phoneNumber1!.value,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomElevatedButton(
            height: 31.v,
            width: 335.h,
            text: "lbl_farmer_467861".tr,
            buttonStyle: CustomButtonStyles.fillBlueGray,
            buttonTextStyle: theme.textTheme.titleMedium!,
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
