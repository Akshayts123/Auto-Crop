import '../../../core/app_export.dart';

/// This class is used in the [thirtyone_item_widget] screen.
class ThirtyoneItemModel {
  ThirtyoneItemModel({
    this.almondsImage,
    this.almondsText,
    this.variationsText,
    this.id,
  }) {
    almondsImage = almondsImage ?? Rx(ImageConstant.imgRectangle35);
    almondsText = almondsText ?? Rx("ALMONDS");
    variationsText = variationsText ??
        Rx("There are many variations\nof passages of\nLorem Ipsum available,");
    id = id ?? Rx("");
  }

  Rx<String>? almondsImage;

  Rx<String>? almondsText;

  Rx<String>? variationsText;

  Rx<String>? id;
}
