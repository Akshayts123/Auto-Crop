import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [crop_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CropModel {
  Rx<List<UserprofileItemModel>> userprofileItemList =
  Rx(_generateUserProfileItems());

  static List<UserprofileItemModel> _generateUserProfileItems() {
    List<UserprofileItemModel> userProfileItems = [];

    for (int i = 0; i < 1000; i++) {
      userProfileItems.add(
        UserprofileItemModel(
          almondsText: "ALMONDS".obs,
          loremIpsumText:
          "There are many variations\nof passages of\nLorem Ipsum available,"
              .obs,
        ),
      );
    }

    return userProfileItems;
  }
}
