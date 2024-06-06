

import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/presentation/notifications_screen/widgets/notificationslist_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/image_constant.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/notifications_controller.dart';
import 'models/notificationslist_item_model.dart';

class Notifications extends StatelessWidget {
final NotificationsController controller = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body:  ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
              context,
              index,
              ) {
            return SizedBox(
              height: 1.v,
            );
          },
          itemCount:controller.notificationsModelObj.value
              .notificationslistItemList.value.length,
          itemBuilder: (context, index) {
            NotificationslistItemModel model = controller
                .notificationsModelObj
                .value
                .notificationslistItemList
                .value[index];
            return NotificationslistItemWidget(
              model,
            );
          },
        ),
    );
  }
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      // leadingWidth: 44.h,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: GestureDetector(
          onTap: () {
          },
          child: Text(
            "Notification",
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.secondaryContainer.withOpacity(1),
            ),
          ),
        ),
      ),
    );
  }
}
