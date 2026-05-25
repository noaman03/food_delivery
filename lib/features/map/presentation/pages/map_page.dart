import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'package:fooood/features/map/presentation/controllers/delivery_map_controller.dart';

class MapPage extends GetView<DeliveryMapController> {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: controller.restaurantPoint,
                    initialZoom: 12,
                    onTap: (_, point) => controller.selectLocation(point),
                  ),
                  children: <Widget>[
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.fooood.app',
                    ),
                    MarkerLayer(
                      markers: <Marker>[
                        Marker(
                          point: controller.restaurantPoint,
                          width: 40,
                          height: 40,
                          child: const Icon(
                            Icons.storefront,
                            color: Colors.deepOrange,
                            size: 34,
                          ),
                        ),
                        if (controller.selectedPoint != null)
                          Marker(
                            point: controller.selectedPoint ?? const LatLng(0, 0),
                            width: 40,
                            height: 40,
                            child: const Icon(
                              Icons.location_pin,
                              color: Colors.red,
                              size: 38,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Text('Tap map to set delivery location'),
                    const Spacer(),
                    if (controller.selectedPoint != null)
                      const Icon(Icons.check_circle, color: Colors.green),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    const Text('Distance'),
                    const Spacer(),
                    Text('${controller.deliveryDistanceKm.value.toStringAsFixed(1)} km'),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    const Text('Delivery Fee'),
                    const Spacer(),
                    Text('EGP ${controller.deliveryFee.value.toStringAsFixed(2)}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

