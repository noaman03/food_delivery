import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fooood/app/bindings/initial_binding.dart';
import 'package:fooood/app/routes/app_pages.dart';
import 'package:fooood/app/routes/app_routes.dart';
import 'package:fooood/core/theme/app_theme.dart';

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.dashboard,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
    );
  }
}

