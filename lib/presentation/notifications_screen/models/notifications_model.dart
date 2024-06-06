import '../../../core/app_export.dart';
import 'notificationslist_item_model.dart';

/// This class defines the variables used in the [notifications_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationsModel {
  Rx<List<NotificationslistItemModel>> notificationslistItemList = Rx([
    NotificationslistItemModel(
        image: ImageConstant.imgImage.obs,
        title: "Tomorrow's Treats!".obs,
        timestamp: "9 days ago".obs,
        body:
            "Last chance to add a little extra to your Tuesday delivery.".obs),
    NotificationslistItemModel(
        body: "New menu items are in! What will you try next?".obs)
  ]);
}
