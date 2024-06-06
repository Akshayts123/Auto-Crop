import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/presentation/sign_in_screen/models/sign_in_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SignInScreen.
///
/// This class manages the state of the SignInScreen, including the
/// current signInModelObj
class SignInController extends GetxController {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  Rx<SignInModel> signInModelObj = SignInModel().obs;
  Rx<bool> isShowPassword = true.obs;

  void login() {
    String email = emailController?.text.trim() ?? "";
    String password = passwordController?.text.trim() ?? "";

    if (email == 'admin@gmail.com' && password == '123456') {

      // Navigate to admin page
      Get.toNamed(AppRoutes.adminScreen);
    } else {
      Get.toNamed(AppRoutes.dashboard);
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController?.dispose();
    passwordController?.dispose();
  }
}