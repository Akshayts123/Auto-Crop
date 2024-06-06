

import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/presentation/home_screen_two_screen/home_screen_two_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import '../all_seeds_screen/all_seeds_screen.dart';
import '../home_screen/controller/home_controller.dart';
import '../home_screen/home_screen.dart';
import '../notifications_screen/notification.dart';
import '../notifications_screen/notifications_screen.dart';
import '../profile_page/profile_page.dart';
import '../sign_up_screen/models/users.dart';
import 'controller/dashboard_controller.dart';
class DashboardScreen extends StatelessWidget {
   DashboardScreen();
   final DashboardController controller = Get.put(DashboardController());
   final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final pages =[
      HomeScreen( ),
      AllSeedsWidget(),
      Notifications(),
      ProfilePage(),
    ];
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
        bottomNavigationBar:Obx(() =>  BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.energy_savings_leaf),
              label: 'All Seeds',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            // Update the current index using GetX
            controller.currentIndex.value = index;

            // Handle navigation based on the selected index
            // You can use a switch statement or if-else conditions
            switch (index) {
              case 0:
              // Navigate to Home
                break;
              case 1:
              // Navigate to Cart
                break;
              case 2:
              // Navigate to Notification
                break;
              case 3:
              // Navigate to Profile
                break;
            }
          },
        ),),
    );
  }
}
