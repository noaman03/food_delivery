import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fooood/features/cart/presentation/controllers/cart_controller.dart';
import 'package:fooood/features/map/presentation/controllers/delivery_map_controller.dart';
import 'package:fooood/features/payment/domain/entities/payment_method.dart';
import 'package:fooood/features/payment/domain/entities/payment_request.dart';
import 'package:fooood/features/payment/presentation/controllers/payment_controller.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final mapController = Get.find<DeliveryMapController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Obx(() {
        final selectedLocation = mapController.selectedLocation.value;
        final fee = selectedLocation == null ? 0.0 : mapController.deliveryFee.value;
        final subtotal = cartController.subtotal;
        final total = subtotal + fee;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: <Widget>[
                      _summaryLine('Subtotal', 'EGP ${subtotal.toStringAsFixed(2)}'),
                      _summaryLine('Delivery Fee', 'EGP ${fee.toStringAsFixed(2)}'),
                      const Divider(),
                      _summaryLine(
                        'Total',
                        'EGP ${total.toStringAsFixed(2)}',
                        isBold: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Payment Method',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              _methodTile(
                title: 'Credit / Debit Card',
                method: PaymentMethod.card,
              ),
              _methodTile(
                title: 'Cash on Delivery',
                method: PaymentMethod.cash,
              ),
              _methodTile(
                title: 'Wallet',
                method: PaymentMethod.wallet,
              ),
              const SizedBox(height: 10),
              Text(
                selectedLocation == null
                    ? 'No delivery location selected. Use map tab first.'
                    : 'Location: (${selectedLocation.latitude.toStringAsFixed(4)}, '
                        '${selectedLocation.longitude.toStringAsFixed(4)})',
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: controller.isLoading.value || cartController.isEmpty
                      ? null
                      : () async {
                          if (selectedLocation == null) {
                            Get.snackbar('Location Required', 'Please pick location from map tab.');
                            return;
                          }

                          final request = PaymentRequest(
                            subtotal: subtotal,
                            deliveryFee: fee,
                            method: controller.selectedMethod.value,
                            deliveryAddress:
                                '${selectedLocation.latitude},${selectedLocation.longitude}',
                          );

                          await controller.process(request);
                          if (controller.latestResult.value != null) {
                            cartController.clearCart();
                            Get.snackbar('Success', controller.latestResult.value!);
                            Get.until((route) => route.isFirst);
                          }
                        },
                  child: controller.isLoading.value
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Pay Now'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _methodTile({
    required String title,
    required PaymentMethod method,
  }) {
    return Obx(
      () => RadioListTile<PaymentMethod>(
        contentPadding: EdgeInsets.zero,
        value: method,
        groupValue: controller.selectedMethod.value,
        onChanged: (PaymentMethod? value) {
          if (value == null) return;
          controller.selectedMethod.value = value;
        },
        title: Text(title),
      ),
    );
  }

  Widget _summaryLine(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          Text(
            label,
            style: TextStyle(fontWeight: isBold ? FontWeight.w700 : FontWeight.w400),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(fontWeight: isBold ? FontWeight.w700 : FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

