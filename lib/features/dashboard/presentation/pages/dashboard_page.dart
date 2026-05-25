import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fooood/app/routes/app_routes.dart';
import 'package:fooood/features/cart/presentation/controllers/cart_controller.dart';
import 'package:fooood/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:fooood/features/home/presentation/pages/home_page.dart';
import 'package:fooood/features/map/presentation/pages/map_page.dart';
import 'package:fooood/features/offers/presentation/pages/offers_page.dart';
import 'package:fooood/features/orders/presentation/pages/orders_page.dart';
import 'package:fooood/features/profile/presentation/pages/profile_page.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Delivering to',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF6B7280),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.location_on_rounded,
                      color: Color(0xFFFC8019), size: 18),
                  SizedBox(width: 3),
                  Text(
                    'Home - Cairo',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                  ),
                  Icon(Icons.keyboard_arrow_down_rounded, size: 18),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: Obx(
                () => Badge.count(
                  count: cartController.items.fold<int>(
                    0,
                    (sum, item) => sum + item.quantity,
                  ),
                  isLabelVisible: cartController.items.isNotEmpty,
                  child: IconButton.filledTonal(
                    onPressed: () => Get.toNamed(AppRoutes.cart),
                    icon: const Icon(Icons.shopping_bag_outlined),
                    tooltip: 'Cart',
                  ),
                ),
              ),
            ),
          ],
        ),
        body: switch (controller.currentIndex.value) {
          1 => const OffersPage(),
          2 => const OrdersPage(),
          3 => const MapPage(),
          4 => const ProfilePage(),
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
              icon: Icon(Icons.local_offer_outlined),
              selectedIcon: Icon(Icons.local_offer),
              label: 'Offers',
            ),
            NavigationDestination(
              icon: Icon(Icons.receipt_long_outlined),
              selectedIcon: Icon(Icons.receipt_long),
              label: 'Orders',
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
