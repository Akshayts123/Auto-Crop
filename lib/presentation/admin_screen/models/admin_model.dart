import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [crop_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CropModel {
  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([
    UserprofileItemModel(
        almondsText: "ALMONDS".obs,
        loremIpsumText:
            "There are many variations\nof passages of\nLorem Ipsum available,"
                .obs),
    UserprofileItemModel(
        almondsText: "ALMONDS".obs,
        loremIpsumText:
            "There are many variations\nof passages of\nLorem Ipsum available,"
                .obs),
    UserprofileItemModel(
        almondsText: "ALMONDS".obs,
        loremIpsumText:
            "There are many variations\nof passages of\nLorem Ipsum available,"
                .obs),
    UserprofileItemModel(
        almondsText: "ALMONDS".obs,
        loremIpsumText:
            "There are many variations\nof passages of\nLorem Ipsum available,"
                .obs)
  ]);
}
