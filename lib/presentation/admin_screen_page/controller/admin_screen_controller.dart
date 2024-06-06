import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/presentation/admin_screen_page/models/admin_screen_model.dart';

/// A controller class for the AdminScreenPage.
///
/// This class manages the state of the AdminScreenPage, including the
/// current adminScreenModelObj
class AdminScreenController extends GetxController {
  AdminScreenController(this.adminScreenModelObj);

  Rx<AdminScreenModel> adminScreenModelObj;
}
