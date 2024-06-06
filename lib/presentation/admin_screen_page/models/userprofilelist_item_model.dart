import '../../../core/app_export.dart';

/// This class is used in the [userprofilelist_item_widget] screen.
class UserprofilelistItemModel {
  UserprofilelistItemModel({
    this.farmerName,
    this.text,
    this.anoopK,
    this.emailID,
    this.text1,
    this.email,
    this.phoneNumber,
    this.text2,
    this.phoneNumber1,
    this.id,
  }) {
    farmerName = farmerName ?? Rx("Farmer Name");
    text = text ?? Rx(":");
    anoopK = anoopK ?? Rx("Anoop k");
    emailID = emailID ?? Rx("Email ID");
    text1 = text1 ?? Rx(":");
    email = email ?? Rx("ahgagha@gmail.com");
    phoneNumber = phoneNumber ?? Rx("Password");
    text2 = text2 ?? Rx(":");
    phoneNumber1 = phoneNumber1 ?? Rx("1234567892");
    id = id ?? Rx("");
  }

  Rx<String>? farmerName;

  Rx<String>? text;

  Rx<String>? anoopK;

  Rx<String>? emailID;

  Rx<String>? text1;

  Rx<String>? email;

  Rx<String>? phoneNumber;

  Rx<String>? text2;

  Rx<String>? phoneNumber1;

  Rx<String>? id;
}
