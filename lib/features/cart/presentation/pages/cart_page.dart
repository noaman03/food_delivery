import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fooood/app/routes/app_routes.dart';
import 'package:fooood/features/cart/domain/entities/cart_item.dart';
import 'package:fooood/features/cart/presentation/controllers/cart_controller.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basket')),
      body: Obx(() {
        if (controller.items.isEmpty) {
          return const _EmptyCart();
        }

        final delivery = controller.subtotal > 250 ? 0.0 : 24.0;
        final total = controller.subtotal + delivery;

        return Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                itemCount: controller.items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (BuildContext context, int index) {
                  return _CartItemTile(item: controller.items[index]);
                },
              ),
            ),
            _CartSummary(
              subtotal: controller.subtotal,
              delivery: delivery,
              total: total,
              onCheckout: () => Get.toNamed(AppRoutes.payment),
            ),
          ],
        );
      }),
    );
  }
}

class _CartItemTile extends GetView<CartController> {
  const _CartItemTile({required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                item.food.imageAsset,
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.food.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.food.restaurant,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF6B7280),
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'EGP ${(item.food.price * item.quantity).toStringAsFixed(0)}',
                    style: const TextStyle(
                      color: Color(0xFFFC8019),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFEFE3),
                borderRadius: BorderRadius.circular(99),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () => controller.decrement(item.food.id),
                    icon: const Icon(Icons.remove_rounded),
                  ),
                  Text(
                    '${item.quantity}',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () => controller.increment(item.food.id),
                    icon: const Icon(Icons.add_rounded),
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

class _CartSummary extends StatelessWidget {
  const _CartSummary({
    required this.subtotal,
    required this.delivery,
    required this.total,
    required this.onCheckout,
  });

  final double subtotal;
  final double delivery;
  final double total;
  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, -8),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          _SummaryLine(
              label: 'Subtotal', value: 'EGP ${subtotal.toStringAsFixed(0)}'),
          const SizedBox(height: 8),
          _SummaryLine(
            label: 'Delivery',
            value:
                delivery == 0 ? 'Free' : 'EGP ${delivery.toStringAsFixed(0)}',
          ),
          const Divider(height: 24),
          _SummaryLine(
            label: 'Total',
            value: 'EGP ${total.toStringAsFixed(0)}',
            strong: true,
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onCheckout,
              icon: const Icon(Icons.lock_rounded),
              label: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryLine extends StatelessWidget {
  const _SummaryLine({
    required this.label,
    required this.value,
    this.strong = false,
  });

  final String label;
  final String value;
  final bool strong;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          label,
          style:
              TextStyle(fontWeight: strong ? FontWeight.w900 : FontWeight.w600),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontWeight: strong ? FontWeight.w900 : FontWeight.w700,
            color: strong ? const Color(0xFFFC8019) : null,
          ),
        ),
      ],
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 118,
              height: 118,
              decoration: const BoxDecoration(
                color: Color(0xFFFFEFE3),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 56,
                color: Color(0xFFFC8019),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Your basket is empty',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add meals from restaurants near you and they will appear here.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            FilledButton(
              onPressed: () => Get.offAllNamed(AppRoutes.dashboard),
              child: const Text('Browse restaurants'),
            ),
          ],
        ),
      ),
    );
  }
}
