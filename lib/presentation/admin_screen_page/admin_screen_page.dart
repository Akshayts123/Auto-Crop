import '../admin_screen_page/widgets/userprofilelist_item_widget.dart';
import 'controller/admin_screen_controller.dart';
import 'models/admin_screen_model.dart';
import 'models/userprofilelist_item_model.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:flutter/material.dart';

class AdminScreenPage extends StatelessWidget {
  AdminScreenPage({Key? key})
      : super(
          key: key,
        );

  AdminScreenController controller =
      Get.put(AdminScreenController(AdminScreenModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [
              SizedBox(height: 21.v),
              // _buildUserProfileList(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  // Widget _buildUserProfileList() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 20.h),
  //     child: Obx(
  //       () => ListView.separated(
  //         physics: NeverScrollableScrollPhysics(),
  //         shrinkWrap: true,
  //         separatorBuilder: (
  //           context,
  //           index,
  //         ) {
  //           return SizedBox(
  //             height: 17.v,
  //           );
  //         },
  //         itemCount: controller
  //             .adminScreenModelObj.value.userprofilelistItemList.value.length,
  //         itemBuilder: (context, index) {
  //           UserprofilelistItemModel model = controller
  //               .adminScreenModelObj.value.userprofilelistItemList.value[index];
  //           return UserprofilelistItemWidget(
  //             model,
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
}
