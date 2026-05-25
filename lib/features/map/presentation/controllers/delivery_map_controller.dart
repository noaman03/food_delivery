import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'package:fooood/features/map/domain/entities/delivery_location.dart';
import 'package:fooood/features/map/domain/usecases/calculate_delivery_fee_usecase.dart';

class DeliveryMapController extends GetxController {
  DeliveryMapController(this._calculateDeliveryFeeUseCase);

  final CalculateDeliveryFeeUseCase _calculateDeliveryFeeUseCase;
  final restaurant = const DeliveryLocation(latitude: 30.0444, longitude: 31.2357);
  final selectedLocation = Rxn<DeliveryLocation>();
  final deliveryFee = 0.0.obs;
  final deliveryDistanceKm = 0.0.obs;

  LatLng get restaurantPoint => LatLng(restaurant.latitude, restaurant.longitude);

  LatLng? get selectedPoint {
    final value = selectedLocation.value;
    if (value == null) return null;
    return LatLng(value.latitude, value.longitude);
  }

  void selectLocation(LatLng point) {
    selectedLocation.value = DeliveryLocation(
      latitude: point.latitude,
      longitude: point.longitude,
    );
    final selected = selectedLocation.value!;
    deliveryFee.value = _calculateDeliveryFeeUseCase.call(
      from: restaurant,
      to: selected,
    );
    deliveryDistanceKm.value = const Distance().as(
      LengthUnit.Kilometer,
      restaurantPoint,
      point,
    );
  }
}

