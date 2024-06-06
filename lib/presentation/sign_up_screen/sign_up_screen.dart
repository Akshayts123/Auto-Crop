import 'package:auto_crop/presentation/home_screen/controller/home_controller.dart';

import '../../data/database/database.dart';
import 'controller/sign_up_controller.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/core/utils/validation_functions.dart';
import 'package:auto_crop/widgets/custom_checkbox_button.dart';
import 'package:auto_crop/widgets/custom_elevated_button.dart';
import 'package:auto_crop/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'models/users.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends GetWidget<SignUpController> {
  SignUpScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "lbl_create_account".tr,
                        style: CustomTextStyles.headlineSmallSecondaryContainer,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "msg_fill_your_information".tr,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    SizedBox(height: 25.v),
                    Text(
                      "lbl_name".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 4.v),
                    _buildName(),
                    SizedBox(height: 20.v),
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "lbl_email".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(height: 4.v),
                    _buildEmail(),
                    SizedBox(height: 20.v),
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "lbl_password".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(height: 4.v),
                    _buildPassword(),
                    SizedBox(height: 20.v),
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "msg_confirm_password".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(height: 4.v),
                    _buildConfirmPassword(),
                    SizedBox(height: 21.v),
                    _buildAgreeWithTermsAndConditions(),
                    SizedBox(height: 17.v),
                    _buildSignUp(context),
                    SizedBox(height: 28.v),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "msg_already_have_an2".tr,
                          style: CustomTextStyles.titleSmallff000000,
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.signInScreen),
                          child: Text(
                            "lbl_sign_in2".tr,
                            style: CustomTextStyles.titleSmallff416e1d,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildName() {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: CustomTextFormField(
        autofocus: false,
        controller: controller.nameController,
        // hintText: "msg_example_gmail_com".tr,
        textInputType: TextInputType.text, // Change to TextInputType.text for name
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "enter name".tr; // Provide an error message for empty name
          }
          return null;
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: CustomTextFormField(
        autofocus: false,
        controller: controller.emailController,
        hintText: "msg_example_gmail_com".tr,
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword() {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: Obx(
            () => CustomTextFormField(
          autofocus: false,
          controller: controller.passwordController,
          suffix: InkWell(
            onTap: () {
              controller.isShowPassword.value =
              !controller.isShowPassword.value;
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(30.h, 12.v, 11.h, 12.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgEye,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 48.v,
          ),
          obscureText: controller.isShowPassword.value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "msg enter password".tr;
            }
            return null;
          },
        ),
      ),
    );
  }


  /// Section Widget
  Widget _buildConfirmPassword() {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: Obx(
        () => CustomTextFormField(
          autofocus: false,
          controller: controller.confirmPasswordController,
          textInputAction: TextInputAction.done,
          suffix: InkWell(
            onTap: () {
              controller.isShowPassword1.value =
                  !controller.isShowPassword1.value;
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(30.h, 12.v, 11.h, 12.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgEye,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 48.v,
          ),
          obscureText: controller.isShowPassword1.value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "enter confirm password".tr;
            }
            return null;
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAgreeWithTermsAndConditions() {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: Obx(
        () => CustomCheckboxButton(
          text: "msg_agree_with_terms".tr,
          value: controller.agreeWithTermsAndConditions.value,
          padding: EdgeInsets.symmetric(vertical: 1.v),
          onChange: (value) {
            controller.agreeWithTermsAndConditions.value = value;
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUp(context) {
    return CustomElevatedButton(
      onPressed: () async {
      if (_formKey.currentState!.validate() &&
          controller.agreeWithTermsAndConditions.value) {
        if (controller.passwordController.text ==
            controller.confirmPasswordController.text) {
          User user = User(
            name: controller.nameController.text,
            email: controller.emailController.text,
            password: controller.passwordController.text,
          );

          DatabaseHelper dbHelper = DatabaseHelper();
          await dbHelper.open();
          await dbHelper.insertUser(user);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Sign-up successful!'),
              duration: Duration(seconds: 2),
            ),
          );
          homeController.
              signUpUser(user);
          await DatabaseHelper().saveUserName(user.name);

          // Navigate to login screen or any other screen
          Get.toNamed(AppRoutes.signInScreen);

        } else {
          // Show password mismatch error
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return AlertDialog(
          //       title: Text('Error'),
          //       content: Text('Passwords do not match'),
          //       actions: [
          //         TextButton(
          //           onPressed: () {
          //             Navigator.pop(context);
          //           },
          //           child: Text('OK'),
          //         ),
          //       ],
          //     );
          //   },
          // );
        }
        // Get.toNamed(AppRoutes.dashboard);
      }},
      text: "lbl_sign_up2".tr,
    );
  }
}
