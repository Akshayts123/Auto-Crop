import '../../data/database/database.dart';
import '../sign_up_screen/models/users.dart';
import 'controller/sign_in_controller.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/core/utils/validation_functions.dart';
import 'package:auto_crop/widgets/custom_elevated_button.dart';
import 'package:auto_crop/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SignInScreen extends GetWidget<SignInController> {
  SignInScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                padding: EdgeInsets.symmetric(horizontal: 19.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "lbl_sign_in".tr,
                      style: CustomTextStyles.headlineSmallSecondaryContainer,
                    ),
                    SizedBox(height: 11.v),
                    Text(
                      "msg_hi_welcome_back".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                    SizedBox(height: 31.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_email".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(height: 4.v),
                    CustomTextFormField(
                      autofocus: false,
                      controller: controller.emailController,
                      hintText: "msg_example_gmail_com".tr,
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null ||
                            (!isValidEmail(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_email".tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_password".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(height: 4.v),
                    Obx(
                      () => CustomTextFormField(
                        autofocus: false,
                        controller: controller.passwordController,
                        textInputAction: TextInputAction.done,
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
                      ),
                    ),
                    SizedBox(height: 7.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "msg_forgot_password".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    CustomElevatedButton(
                      onPressed: () async{
                        if (_formKey.currentState!.validate()) {
                          DatabaseHelper dbHelper = DatabaseHelper();
                          await dbHelper.open();

                          String enteredEmail = controller.emailController!.text;
                          String enteredPassword = controller.passwordController!.text;

                          // Check if the entered credentials are for the admin
                          if (enteredEmail == 'admin@gmail.com' && enteredPassword == '123456') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Admin login successful!'),
                                duration: Duration(seconds: 2),
                              ),
                            );

                            // Navigate to admin screen
                            Get.toNamed(AppRoutes.adminScreen);
                          } else {
                            // For regular users, check the database for login
                            User? user = await dbHelper.getUser(enteredEmail, enteredPassword);

                            if (user != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Login-in successful!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );

                              // Navigate to dashboard for regular users
                              Get.toNamed(AppRoutes.dashboard);
                            } else {
                              // Show login failed error
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Invalid email or password'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                          // controller.login();
                        }
                      },
                      text: "lbl_sign_in".tr,
                    ),
                    SizedBox(height: 41.v),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                           "msg_don_t_have_an_account2".tr,
                          style: CustomTextStyles.titleSmallff000000,
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.signUpScreen),
                          child: Text(
                          
                            "lbl_sign_up".tr,
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
}
