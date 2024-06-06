import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/presentation/inner_page_screen/models/inner_page_model.dart';

/// A controller class for the InnerPageScreen.
///
/// This class manages the state of the InnerPageScreen, including the
/// current innerPageModelObj
class InnerPageController extends GetxController {
  Rx<InnerPageModel> innerPageModelObj = InnerPageModel().obs;
}
