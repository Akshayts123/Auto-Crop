import 'package:auto_crop/data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [add_doctor_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddCropModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "January",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "February",
    ),
    SelectionPopupModel(
      id: 3,
      title: "March",
    ),
    SelectionPopupModel(
      id: 4,
      title: "April",
    ),
    SelectionPopupModel(
      id: 5,
      title: "May",
    ),
    SelectionPopupModel(
      id: 6,
      title: "June",
    ),
    SelectionPopupModel(
      id: 7,
      title: "July",
    ),
    SelectionPopupModel(
      id: 8,
      title: "August",
    ),
    SelectionPopupModel(
      id: 9,
      title: "September",
    ),
    SelectionPopupModel(
      id: 10,
      title: "October",
    ),
    SelectionPopupModel(
      id: 11,
      title: "November",
    ),
    SelectionPopupModel(
      id: 12,
      title: "December",
    )
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Gelisols",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Histosols",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Spodosols",
    ),
    SelectionPopupModel(
      id: 4,
      title: "Andisols",
    )
    ,
    SelectionPopupModel(
      id: 5,
      title: "Oxisols",
    )
    ,
    SelectionPopupModel(
      id: 6,
      title: "Vertisols",
    )
    ,
    SelectionPopupModel(
      id: 7,
      title: "Aridisols",
    )
    ,
    SelectionPopupModel(
      id: 8,
      title: "Ultisols",
    ),
    SelectionPopupModel(
      id: 9,
      title: "Mollisols",
    ),
    SelectionPopupModel(
      id: 10,
      title: "Alfisols",
    ),
    SelectionPopupModel(
      id: 11,
      title: "Inceptisols",
    ),
    SelectionPopupModel(
      id: 12,
      title: "Entisols",
    )

  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList2 = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Clouds",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Snow",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Thunder and lightning",
    )
    ,
    SelectionPopupModel(
      id: 4,
      title: "Frost and ice",
    )
    ,
    SelectionPopupModel(
      id: 5,
      title: "Rain",
    ),
    SelectionPopupModel(
      id: 6,
      title: "Fog",
    ),
    SelectionPopupModel(
      id: 7,
      title: "Humidity",
    ),
    SelectionPopupModel(
      id: 8,
      title: "Hail",
    ),
    SelectionPopupModel(
      id: 9,
      title: "Hurricanes",
    ),
    SelectionPopupModel(
      id: 10,
      title: "Wind",
    ),
    SelectionPopupModel(
      id: 11,
      title: "Tornado",
    ),
    SelectionPopupModel(
      id: 12,
      title: "Storms",
    ),
    SelectionPopupModel(
      id: 13,
      title: "Temperature",
    )
  ]);
}
