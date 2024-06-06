import '../../data/database/database.dart';
import '../admin_screen_page/controller/admin_screen_controller.dart';
import '../admin_screen_page/models/admin_screen_model.dart';
import '../admin_screen_page/models/userprofilelist_item_model.dart';
import '../admin_screen_page/widgets/userprofilelist_item_widget.dart';
import '../crop_screen/widgets/userprofile_item_widget.dart';
import '../sign_up_screen/models/users.dart';
import 'controller/admin_controller.dart';
import 'models/userprofile_item_model.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AdminScreen extends GetWidget<AdminController> {
  AdminScreen({Key? key})
      : super(
          key: key,
        );
  AdminScreenController controllers =
  Get.put(AdminScreenController(AdminScreenModel().obs));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTwenty(),
                SizedBox(height: 19.v),
                _buildUserProfile(),
                SizedBox(height: 19.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwenty() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 19.v,
      ),
      decoration: AppDecoration.fillWhiteA70001,
      child: Column(
        children: [
          SizedBox(height: 48.v),
          Text(
            "lbl_admin".tr,
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 44.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomElevatedButton(
                  height: 38.v,
                  text: "lbl_farmers".tr,
                  margin: EdgeInsets.only(right: 9.h),

                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  onPressed: () => Get.toNamed(AppRoutes.cropScreen),
                  height: 38.v,
                  text: "lbl_crops".tr,
                  margin: EdgeInsets.only(left: 9.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL10,
                  buttonTextStyle: theme.textTheme.titleMedium!,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  // Widget _buildUserProfile() {
  //   return FutureBuilder<List<User>>(
  //     future: fetchAllUsers(), // Define a function to fetch all users from the database
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       } else if (snapshot.hasError) {
  //         return Center(child: Text('Error: ${snapshot.error}'));
  //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
  //         return Center(child: Text('No users found.'));
  //       } else {
  //         List<User> userList = snapshot.data!;
  //         return ListView.builder(
  //           shrinkWrap: true,
  //           scrollDirection: Axis.vertical,
  //           itemCount: userList.length,
  //           itemBuilder: (context, index) {
  //             User user = userList[index];
  //             return ListTile(
  //               title: Text('Name: ${user.name}'),
  //               subtitle: Text('Email: ${user.email}'),
  //             );
  //           },
  //         );
  //       }
  //     },
  //   );
  // }
  Future<List<User>> fetchAllUsers() async {
    try {
      DatabaseHelper dbHelper = DatabaseHelper();
      await dbHelper.open();

      List<User>? users = await dbHelper.getAllUsers();

      if (users != null) {
        return users;
      } else {
        print('Error: getAllUsers returned null');
        return [];
      }
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }

  /// Section Widget
  Widget _buildUserProfile() {
   return FutureBuilder<List<User>>(
        future: fetchAllUsers(), // Define a function to fetch all users from the database
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
    return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    return Center(child: Text('No users found.'));
    } else {
    List<User> userList = snapshot.data!;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child:  ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
                context,
                index,
                ) {
              return SizedBox(
                height: 17.v,
              );
            },
            itemCount: userList.length,
            itemBuilder: (context, index) {
              User user = userList[index];
              // UserprofilelistItemModel model = controllers
              //     .adminScreenModelObj.value.userprofilelistItemList.value[index];
              return UserprofilelistItemWidget(
                user
              );
            },
          ),

      );}});
    }
}
