import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/app/bindings/initial_binding.dart';
import 'package:food_delivery_app/app/routes/app_pages.dart';
import 'package:food_delivery_app/app/routes/app_routes.dart';
import 'package:food_delivery_app/core/theme/app_theme.dart';

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
    );
  }
}
