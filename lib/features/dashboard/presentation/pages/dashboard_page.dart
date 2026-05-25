import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fooood/app/routes/app_routes.dart';
import 'package:fooood/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:fooood/features/home/presentation/pages/home_page.dart';
import 'package:fooood/features/map/presentation/pages/map_page.dart';
import 'package:fooood/features/profile/presentation/pages/profile_page.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Food Delivery'),
          actions: <Widget>[
            IconButton(
              onPressed: () => Get.toNamed(AppRoutes.cart),
              icon: const Icon(Icons.shopping_bag_outlined),
              tooltip: 'Cart',
            ),
          ],
        ),
        body: switch (controller.currentIndex.value) {
          1 => const MapPage(),
          2 => const ProfilePage(),
          _ => const HomePage(),
        },
        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.changeTab,
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.restaurant_menu_outlined),
              selectedIcon: Icon(Icons.restaurant_menu),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.map_outlined),
              selectedIcon: Icon(Icons.map),
              label: 'Map',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
