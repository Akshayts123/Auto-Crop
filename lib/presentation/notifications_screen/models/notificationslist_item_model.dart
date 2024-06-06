import '../../../core/app_export.dart';

/// This class is used in the [notificationslist_item_widget] screen.
class NotificationslistItemModel {
  NotificationslistItemModel({
    this.image,
    this.title,
    this.timestamp,
    this.body,
    this.id,
  }) {
    image = image ?? Rx(ImageConstant.imgImage);
    title = title ?? Rx("Tomorrow's Treats!");
    timestamp = timestamp ?? Rx("9 days ago");
    body = body ??
        Rx("Last chance to add a little extra to your Tuesday delivery.");
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? title;

  Rx<String>? timestamp;

  Rx<String>? body;

  Rx<String>? id;
}
