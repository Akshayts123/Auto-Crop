
import 'package:auto_crop/presentation/admin_screen_tab_container_screen/admin_screen_tab_container_screen.dart';
import 'package:auto_crop/presentation/admin_screen_tab_container_screen/binding/admin_screen_tab_container_binding.dart';
import 'package:auto_crop/presentation/crop_screen/crop_screen.dart';
import 'package:auto_crop/presentation/crop_screen/binding/crop_binding.dart';
import 'package:auto_crop/presentation/dashboard/binding/dashboard_binding.dart';
import 'package:auto_crop/presentation/dashboard/dashboard_screen.dart';
import 'package:auto_crop/presentation/profile_page/profile_page.dart';
import 'package:auto_crop/presentation/splash_screen/splash_screen.dart';
import 'package:auto_crop/presentation/splash_screen/binding/splash_binding.dart';
import 'package:auto_crop/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:auto_crop/presentation/sign_in_screen/binding/sign_in_binding.dart';
import 'package:auto_crop/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:auto_crop/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:auto_crop/presentation/home_screen/home_screen.dart';
import 'package:auto_crop/presentation/home_screen/binding/home_binding.dart';
import 'package:auto_crop/presentation/home_screen_two_screen/home_screen_two_screen.dart';
import 'package:auto_crop/presentation/home_screen_two_screen/binding/home_screen_two_binding.dart';
import 'package:auto_crop/presentation/inner_page_screen/inner_page_screen.dart';
import 'package:auto_crop/presentation/inner_page_screen/binding/inner_page_binding.dart';
import 'package:auto_crop/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:auto_crop/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

import '../presentation/add_crop_screen/add_crop_screen.dart';
import '../presentation/add_crop_screen/binding/add_crop_binding.dart';
import '../presentation/admin_screen/admin_screen.dart';
import '../presentation/admin_screen/binding/crop_binding.dart';
import '../presentation/notifications_screen/binding/notifications_binding.dart';
import '../presentation/notifications_screen/notifications_screen.dart';
import '../presentation/onboard_three_screen_new/binding/onboard_three_binding.dart';
import '../presentation/onboard_three_screen_new/onboard_three_screen.dart';

class AppRoutes {
  static const String addCropScreen = '/add_crop_screen';

  static const String adminScreenPage = '/admin_screen_page';

  static const String adminScreenTabContainerScreen =
      '/admin_screen_tab_container_screen';

  static const String cropScreen = '/crop_screen';

  static const String adminScreen = '/admin_screen';

  static const String splashScreen = '/splash_screen';

  static const String onboardThreeScreen = '/onboard_three_screen_new';

  static const String signInScreen = '/sign_in_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String homeScreen = '/home_screen';

  static const String dashboard = '/dashboard_screen';

  static const String homeScreenTwoScreen = '/home_screen_two_screen';

  static const String innerPageScreen = '/inner_page_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String profilePage = '/profile_page';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: addCropScreen,
      page: () => AddCropScreen(),
      bindings: [
        AddCropBinding(),
      ],
    ),
    GetPage(
      name: adminScreenTabContainerScreen,
      page: () => AdminScreenTabContainerScreen(),
      bindings: [
        AdminScreenTabContainerBinding(),
      ],
    ),
    GetPage(
      name: cropScreen,
      page: () => CropScreen(),
      bindings: [
        CropBinding(),
      ],
    ),
    GetPage(
      name: adminScreen,
      page: () => AdminScreen(),
      bindings: [
        AdminBinding(),
      ],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: onboardThreeScreen,
      page: () => OnboardThreeScreen1(),
      bindings: [
        OnboardThreeBinding(),
      ],
    ),
    GetPage(
      name: profilePage,
      page: () => ProfilePage(),
      bindings: [

      ],
    ),
    GetPage(
      name: notificationsScreen,
      page: () => NotificationsScreen(),
      bindings: [
        NotificationsBinding(),
      ],
    ),
    GetPage(
      name: dashboard,
      page: () => DashboardScreen(),
      bindings: [
        DashboardBinding(),
      ],
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
      bindings: [
        SignInBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: homeScreenTwoScreen,
      page: () => HomeScreenTwoScreen(),
      bindings: [
        HomeScreenTwoBinding(),
      ],
    ),
    GetPage(
      name: innerPageScreen,
      page: () => InnerPageScreen(),
      bindings: [
        InnerPageBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
