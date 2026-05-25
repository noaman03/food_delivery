import 'package:get/get.dart';

import 'package:fooood/features/cart/domain/usecases/calculate_cart_total_usecase.dart';
import 'package:fooood/features/cart/presentation/controllers/cart_controller.dart';
import 'package:fooood/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:fooood/features/home/data/datasources/food_local_data_source.dart';
import 'package:fooood/features/home/data/repositories/food_repository_impl.dart';
import 'package:fooood/features/home/domain/repositories/food_repository.dart';
import 'package:fooood/features/home/domain/usecases/get_food_items_usecase.dart';
import 'package:fooood/features/home/presentation/controllers/home_controller.dart';
import 'package:fooood/features/map/domain/usecases/calculate_delivery_fee_usecase.dart';
import 'package:fooood/features/map/presentation/controllers/delivery_map_controller.dart';
import 'package:fooood/features/payment/data/datasources/payment_remote_data_source.dart';
import 'package:fooood/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:fooood/features/payment/domain/repositories/payment_repository.dart';
import 'package:fooood/features/payment/domain/usecases/process_payment_usecase.dart';
import 'package:fooood/features/payment/presentation/controllers/payment_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodLocalDataSource>(() => FoodLocalDataSource(), fenix: true);
    Get.lazyPut<FoodRepository>(
      () => FoodRepositoryImpl(Get.find<FoodLocalDataSource>()),
      fenix: true,
    );
    Get.lazyPut<GetFoodItemsUseCase>(
      () => GetFoodItemsUseCase(Get.find<FoodRepository>()),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<GetFoodItemsUseCase>()),
      fenix: true,
    );

    Get.lazyPut<CalculateCartTotalUseCase>(
      () => CalculateCartTotalUseCase(),
      fenix: true,
    );
    Get.lazyPut<CartController>(
      () => CartController(Get.find<CalculateCartTotalUseCase>()),
      fenix: true,
    );

    Get.lazyPut<CalculateDeliveryFeeUseCase>(
      () => CalculateDeliveryFeeUseCase(),
      fenix: true,
    );
    Get.lazyPut<DeliveryMapController>(
      () => DeliveryMapController(Get.find<CalculateDeliveryFeeUseCase>()),
      fenix: true,
    );

    Get.lazyPut<PaymentRemoteDataSource>(
      () => PaymentRemoteDataSource(),
      fenix: true,
    );
    Get.lazyPut<PaymentRepository>(
      () => PaymentRepositoryImpl(Get.find<PaymentRemoteDataSource>()),
      fenix: true,
    );
    Get.lazyPut<ProcessPaymentUseCase>(
      () => ProcessPaymentUseCase(Get.find<PaymentRepository>()),
      fenix: true,
    );
    Get.lazyPut<PaymentController>(
      () => PaymentController(Get.find<ProcessPaymentUseCase>()),
      fenix: true,
    );

    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
  }
}
