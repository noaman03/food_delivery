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
        final fee = selectedLocation == null
            ? (cartController.subtotal > 250 ? 0.0 : 24.0)
            : mapController.deliveryFee.value;
        final subtotal = cartController.subtotal;
        final total = subtotal + fee;

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: <Widget>[
            _CheckoutCard(
              icon: Icons.location_on_rounded,
              title: selectedLocation == null
                  ? 'Choose delivery location'
                  : 'Delivery location',
              subtitle: selectedLocation == null
                  ? 'Use the Map tab to pin your address.'
                  : '${selectedLocation.latitude.toStringAsFixed(4)}, '
                      '${selectedLocation.longitude.toStringAsFixed(4)}',
            ),
            const SizedBox(height: 12),
            Text(
              'Payment method',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 10),
            _methodTile(
              icon: Icons.credit_card_rounded,
              title: 'Credit / Debit Card',
              method: PaymentMethod.card,
            ),
            _methodTile(
              icon: Icons.payments_rounded,
              title: 'Cash on Delivery',
              method: PaymentMethod.cash,
            ),
            _methodTile(
              icon: Icons.account_balance_wallet_rounded,
              title: 'Wallet',
              method: PaymentMethod.wallet,
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    _summaryLine(
                        'Subtotal', 'EGP ${subtotal.toStringAsFixed(0)}'),
                    _summaryLine(
                      'Delivery',
                      fee == 0 ? 'Free' : 'EGP ${fee.toStringAsFixed(0)}',
                    ),
                    const Divider(height: 26),
                    _summaryLine(
                      'Total',
                      'EGP ${total.toStringAsFixed(0)}',
                      isBold: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: controller.isLoading.value
                  ? null
                  : () async {
                      final request = PaymentRequest(
                        subtotal: subtotal,
                        deliveryFee: fee,
                        method: controller.selectedMethod.value,
                        deliveryAddress: selectedLocation == null
                            ? 'Current address'
                            : '${selectedLocation.latitude.toStringAsFixed(4)}, '
                                '${selectedLocation.longitude.toStringAsFixed(4)}',
                      );
                      await controller.process(request);
                      cartController.clearCart();
                      Get.until((route) => route.isFirst);
                      Get.snackbar(
                        'Order placed',
                        'Your food is being prepared.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
              icon: controller.isLoading.value
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.check_circle_rounded),
              label: Text(
                  controller.isLoading.value ? 'Processing' : 'Place order'),
            ),
          ],
        );
      }),
    );
  }

  Widget _methodTile({
    required IconData icon,
    required String title,
    required PaymentMethod method,
  }) {
    return Obx(
      () => Card(
        child: RadioListTile<PaymentMethod>(
          value: method,
          groupValue: controller.selectedMethod.value,
          onChanged: (PaymentMethod? value) {
            if (value == null) return;
            controller.selectedMethod.value = value;
          },
          secondary: Icon(icon, color: const Color(0xFFFC8019)),
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
        ),
      ),
    );
  }

  Widget _summaryLine(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.w900 : FontWeight.w600),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.w900 : FontWeight.w700,
              color: isBold ? const Color(0xFFFC8019) : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckoutCard extends StatelessWidget {
  const _CheckoutCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: const Color(0xFFFFEFE3),
              child: Icon(icon, color: const Color(0xFFFC8019)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF6B7280),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
