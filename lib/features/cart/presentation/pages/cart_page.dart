import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fooood/app/routes/app_routes.dart';
import 'package:fooood/features/cart/presentation/controllers/cart_controller.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Obx(() {
        if (controller.isEmpty) {
          return const Center(
            child: Text('Your cart is empty. Add items from Home.'),
          );
        }

        return Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = controller.items[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(item.food.name),
                      subtitle: Text('EGP ${item.food.price.toStringAsFixed(0)}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            onPressed: () => controller.decrement(item.food.id),
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                          Text('${item.quantity}'),
                          IconButton(
                            onPressed: () => controller.increment(item.food.id),
                            icon: const Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Text('Subtotal'),
                      const Spacer(),
                      Text(
                        'EGP ${controller.subtotal.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => Get.toNamed(AppRoutes.payment),
                      child: const Text('Proceed to Payment'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

