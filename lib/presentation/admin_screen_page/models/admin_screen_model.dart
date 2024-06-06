import '../../../core/app_export.dart';
import 'userprofilelist_item_model.dart';

/// This class defines the variables used in the [admin_screen_page],
/// and is typically used to hold data that is passed between different parts of the application.
class AdminScreenModel {
  Rx<List<UserprofilelistItemModel>> userprofilelistItemList = Rx([
    UserprofilelistItemModel(
        farmerName: "Farmer Name".obs,
        text: ":".obs,
        anoopK: "Anoop k".obs,
        emailID: "Email ID".obs,
        text1: ":".obs,
        email: "ahgagha@gmail.com".obs,
        phoneNumber: "Phone Number".obs,
        text2: ":".obs,
        phoneNumber1: "1234567892".obs)
  ]);
}
