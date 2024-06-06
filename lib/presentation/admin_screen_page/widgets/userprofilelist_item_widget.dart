import '../../sign_up_screen/models/users.dart';
import '../controller/admin_screen_controller.dart';
import '../models/userprofilelist_item_model.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofilelistItemWidget extends StatelessWidget {
  UserprofilelistItemWidget(
    this.users, {
    Key? key,
  }) : super(
          key: key,
        );
  User users;
  // UserprofilelistItemModel userprofilelistItemModelObj;

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
                        Text(
                            "Farmer Name",
                            style: theme.textTheme.titleSmall,
                          ),
                        // Spacer(),
                         Text(
                           ":",
                            style: theme.textTheme.titleSmall,
                          ),

                        Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text(
                              users.name,
                              style: theme.textTheme.titleSmall,
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
                        Text(
                            "Email",
                            style: theme.textTheme.titleSmall,
                          ),

                        // Spacer(),
                         Text(
                            ":",
                            style: theme.textTheme.titleSmall,
                          ),

                        Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text(
                              users.email,
                              style: CustomTextStyles.titleSmallPrimary,

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
                        Text(
                            "Password",
                            style: theme.textTheme.titleSmall,
                          ),

                        Padding(
                          padding: EdgeInsets.only(left: 28.h),
                          child:  Text(
                              ":",
                              style: theme.textTheme.titleSmall,
                            ),

                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child:  Text(
                              users.password,
                              style: theme.textTheme.titleSmall,

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
            text: "Farmer :#${users.id}",
            buttonStyle: CustomButtonStyles.fillBlueGray,
            buttonTextStyle: theme.textTheme.titleMedium!,
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
