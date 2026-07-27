import 'package:get/get.dart';

import 'package:food_delivery_app/app/routes/app_routes.dart';
import 'package:food_delivery_app/features/cart/presentation/pages/cart_page.dart';
import 'package:food_delivery_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:food_delivery_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:food_delivery_app/features/onboarding/presentation/pages/splash_page.dart';
import 'package:food_delivery_app/features/payment/presentation/pages/payment_page.dart';

class AppPages {
  static final routes = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: AppRoutes.splash,
      page: SplashPage.new,
    ),
    GetPage<dynamic>(
      name: AppRoutes.onboarding,
      page: OnboardingPage.new,
    ),
    GetPage<dynamic>(
      name: AppRoutes.dashboard,
      page: DashboardPage.new,
    ),
    GetPage<dynamic>(
      name: AppRoutes.cart,
      page: CartPage.new,
    ),
    GetPage<dynamic>(
      name: AppRoutes.payment,
      page: PaymentPage.new,
    ),
  ];
}
