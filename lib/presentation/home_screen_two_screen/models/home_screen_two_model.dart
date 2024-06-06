import 'package:auto_crop/data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import 'thirtyone_item_model.dart';

/// This class defines the variables used in the [home_screen_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeScreenTwoModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList2 = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  Rx<List<ThirtyoneItemModel>> thirtyoneItemList = Rx([
    ThirtyoneItemModel(
        almondsImage: ImageConstant.imgRectangle35.obs,
        almondsText: "ALMONDS".obs,
        variationsText:
            "There are many variations\nof passages of\nLorem Ipsum available,"
                .obs),
    ThirtyoneItemModel(
        almondsImage: ImageConstant.imgRectangle37.obs,
        almondsText: "ALMONDS".obs,
        variationsText:
            "There are many variations\nof passages of\nLorem Ipsum available,"
                .obs),
    ThirtyoneItemModel(
        almondsImage: ImageConstant.imgRectangle40.obs,
        almondsText: "ALMONDS".obs,
        variationsText:
            "There are many variations\nof passages of\nLorem Ipsum available,"
                .obs),
    ThirtyoneItemModel(
        almondsImage: ImageConstant.imgRectangle41.obs,
        almondsText: "ALMONDS".obs,
        variationsText:
            "There are many variations\nof passages of\nLorem Ipsum available,"
                .obs),
    ThirtyoneItemModel(
        almondsImage: ImageConstant.imgRectangle44.obs,
        almondsText: "ALMONDS".obs,
        variationsText:
            "There are many variations\nof passages of\nLorem Ipsum available,"
                .obs),
    ThirtyoneItemModel(
        almondsImage: ImageConstant.imgRectangle45.obs,
        almondsText: "ALMONDS".obs,
        variationsText:
            "There are many variations\nof passages of\nLorem Ipsum available,"
                .obs)
  ]);
}
