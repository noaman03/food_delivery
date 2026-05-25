import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fooood/features/cart/presentation/controllers/cart_controller.dart';
import 'package:fooood/features/home/domain/entities/food_item.dart';
import 'package:fooood/features/home/presentation/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Obx(
      () => Column(
        children: <Widget>[
          SizedBox(
            height: 58,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (BuildContext context, int index) {
                final category = controller.categories[index];
                final isSelected =
                    controller.selectedCategory.value == category;
                return ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (_) => controller.setCategory(category),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: controller.visibleFoods.length,
              itemBuilder: (BuildContext context, int index) {
                final item = controller.visibleFoods[index];
                return _FoodCard(
                  item: item,
                  onAdd: () => cartController.addItem(item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FoodCard extends StatelessWidget {
  const _FoodCard({
    required this.item,
    required this.onAdd,
  });

  final FoodItem item;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                item.imageAsset,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Text(
                        'EGP ${item.price.toStringAsFixed(0)}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.star_rounded,
                        size: 18,
                        color: Colors.amber.shade700,
                      ),
                      Text(item.rating.toString()),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 72),
              child: FilledButton(
                onPressed: onAdd,
                child: const Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
