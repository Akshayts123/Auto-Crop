import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
class UserprofileItemModel {
  UserprofileItemModel({
    this.almondsText,
    this.loremIpsumText,
    this.id,
  }) {
    almondsText = almondsText ?? Rx("ALMONDS");
    loremIpsumText = loremIpsumText ??
        Rx("There are many variations\nof passages of\nLorem Ipsum available,");
    id = id ?? Rx("");
  }

  Rx<String>? almondsText;

  Rx<String>? loremIpsumText;

  Rx<String>? id;
}
