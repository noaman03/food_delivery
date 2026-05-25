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
      () => CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const _HeroOffer(),
                  const SizedBox(height: 16),
                  _SearchField(onChanged: controller.setSearchQuery),
                  const SizedBox(height: 16),
                  _SectionHeader(
                    title: 'Categories',
                    action: '${controller.visibleFoods.length} places',
                  ),
                  const SizedBox(height: 10),
                  _CategoryRail(
                    categories: controller.categories,
                    selected: controller.selectedCategory.value,
                    onSelected: controller.setCategory,
                  ),
                  const SizedBox(height: 18),
                  const _SectionHeader(
                    title: 'Popular near you',
                    action: 'Fast delivery',
                  ),
                ],
              ),
            ),
          ),
          if (controller.visibleFoods.isEmpty)
            const SliverFillRemaining(
              hasScrollBody: false,
              child: _EmptyFoods(),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
              sliver: SliverList.separated(
                itemCount: controller.visibleFoods.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
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

class _HeroOffer extends StatelessWidget {
  const _HeroOffer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color(0xFFFC8019),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: -26,
            bottom: -36,
            child: Image.asset(
              'assets/images/pizza big.png',
              width: 190,
              height: 190,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            right: 24,
            top: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(99),
              ),
              child: const Text(
                '30% OFF',
                style: TextStyle(
                  color: Color(0xFFFC8019),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hungry?',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Order fresh meals from top restaurants around you.',
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: 'Search restaurants or dishes',
        prefixIcon: Icon(Icons.search_rounded),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.action,
  });

  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        const Spacer(),
        Text(
          action,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: const Color(0xFFFC8019),
                fontWeight: FontWeight.w800,
              ),
        ),
      ],
    );
  }
}

class _CategoryRail extends StatelessWidget {
  const _CategoryRail({
    required this.categories,
    required this.selected,
    required this.onSelected,
  });

  final List<String> categories;
  final String selected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index];
          final isSelected = selected == category;
          return ChoiceChip(
            avatar: Icon(
              _iconForCategory(category),
              size: 18,
              color: isSelected ? Colors.white : const Color(0xFFFC8019),
            ),
            label: Text(category),
            selected: isSelected,
            onSelected: (_) => onSelected(category),
            selectedColor: const Color(0xFFFC8019),
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF1F2933),
              fontWeight: FontWeight.w800,
            ),
            side: BorderSide.none,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(99),
            ),
          );
        },
      ),
    );
  }

  IconData _iconForCategory(String category) {
    return switch (category) {
      'Burgers' => Icons.lunch_dining_rounded,
      'Pizza' => Icons.local_pizza_rounded,
      'Healthy' => Icons.eco_rounded,
      'Pasta' => Icons.ramen_dining_rounded,
      'Deals' => Icons.local_offer_rounded,
      _ => Icons.restaurant_rounded,
    };
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
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    item.imageAsset,
                    width: 112,
                    height: 112,
                    fit: BoxFit.cover,
                  ),
                ),
                if (item.offer != null)
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF111827),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        item.offer!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.restaurant,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF6B7280),
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.star_rounded,
                          size: 18, color: Color(0xFFFFB020)),
                      const SizedBox(width: 3),
                      Text(
                        item.rating.toStringAsFixed(1),
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.schedule_rounded,
                          size: 16, color: Color(0xFF6B7280)),
                      const SizedBox(width: 3),
                      Flexible(
                        child: Text(
                          item.deliveryTime,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Text(
                        'EGP ${item.price.toStringAsFixed(0)}',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: const Color(0xFFFC8019),
                                  fontWeight: FontWeight.w900,
                                ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 36,
                        child: FilledButton(
                          onPressed: onAdd,
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                          ),
                          child: const Text('Add'),
                        ),
                      ),
                    ],
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

class _EmptyFoods extends StatelessWidget {
  const _EmptyFoods();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.search_off_rounded,
              size: 54,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            Text(
              'No meals found',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Try a different search or category.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
