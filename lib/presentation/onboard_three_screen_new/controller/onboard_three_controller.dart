
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../models/onboard_three_model.dart';

/// A controller class for the OnboardThreeScreen.
///
/// This class manages the state of the OnboardThreeScreen, including the
/// current onboardThreeModelObj
class OnboardThreeController extends GetxController {
  Rx<OnboardThreeModel> onboardThreeModelObj = OnboardThreeModel().obs;
}
