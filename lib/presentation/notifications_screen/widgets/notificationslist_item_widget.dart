import 'package:auto_crop/core/app_export.dart';

import '../../../theme/app_decoration.dart';
import '../controller/notifications_controller.dart';
import '../models/notificationslist_item_model.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class NotificationslistItemWidget extends StatelessWidget {
  NotificationslistItemWidget(
    this.notificationslistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationslistItemModel notificationslistItemModelObj;

  var controller = Get.find<NotificationsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.fillWhiteA,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 40.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => CustomImageView(
                    imagePath: notificationslistItemModelObj.image!.value,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    radius: BorderRadius.circular(
                      4.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    bottom: 13.v,
                  ),
                  child: Obx(
                    () => Text(
                      notificationslistItemModelObj.title!.value,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 3.v,
                    bottom: 13.v,
                  ),
                  child: Obx(
                    () => Text(
                      notificationslistItemModelObj.timestamp!.value,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 13.v),
          Container(
            width: 208.h,
            margin: EdgeInsets.only(left: 44.h),
            child: Obx(
              () => Text(
                notificationslistItemModelObj.body!.value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium!.copyWith(
                  height: 1.43,
                ),
              ),
            ),
          ),
          SizedBox(height: 18.v),
        ],
      ),
    );
  }
}
