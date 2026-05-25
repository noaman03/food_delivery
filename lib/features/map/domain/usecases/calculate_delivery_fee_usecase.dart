import 'dart:math' as math;

import 'package:fooood/features/map/domain/entities/delivery_location.dart';

class CalculateDeliveryFeeUseCase {
  double call({
    required DeliveryLocation from,
    required DeliveryLocation to,
  }) {
    final distanceKm = _haversineDistance(
      from.latitude,
      from.longitude,
      to.latitude,
      to.longitude,
    );

    final fee = 20 + (distanceKm * 3.5);
    return fee.clamp(20, 120);
  }

  double _haversineDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const earthRadiusKm = 6371.0;
    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) *
            math.cos(_toRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadiusKm * c;
  }

  double _toRadians(double degree) => degree * (math.pi / 180);
}
