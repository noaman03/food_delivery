import 'package:get/get.dart';

import 'package:fooood/app/routes/app_routes.dart';
import 'package:fooood/features/cart/presentation/pages/cart_page.dart';
import 'package:fooood/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:fooood/features/payment/presentation/pages/payment_page.dart';

class AppPages {
  static final routes = <GetPage<dynamic>>[
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

