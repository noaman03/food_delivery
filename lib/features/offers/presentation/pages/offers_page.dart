import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fooood/features/cart/presentation/controllers/cart_controller.dart';
import 'package:fooood/features/home/domain/entities/food_item.dart';
import 'package:fooood/features/home/presentation/controllers/home_controller.dart';

class OffersPage extends GetView<HomeController> {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Obx(() {
      final offerItems = controller.foods
          .where((item) => item.offer != null)
          .toList(growable: false);

      return ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: <Widget>[
          const _OfferBanner(),
          const SizedBox(height: 18),
          Text(
            'Deals you can order now',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 12),
          ...offerItems.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _OfferTile(
                item: item,
                onAdd: () => cartController.addItem(item),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const _VoucherCard(
            code: 'FOODHUB30',
            title: '30% off your next order',
            subtitle: 'Use on baskets above EGP 180',
            icon: Icons.confirmation_number_rounded,
          ),
          const SizedBox(height: 12),
          const _VoucherCard(
            code: 'FREEDEL',
            title: 'Free delivery weekend',
            subtitle: 'Available on selected restaurants',
            icon: Icons.delivery_dining_rounded,
          ),
        ],
      );
    });
  }
}

class _OfferBanner extends StatelessWidget {
  const _OfferBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: -24,
            bottom: -28,
            child: Image.asset(
              'assets/images/pizza hut.png',
              width: 190,
              height: 190,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Big bites, small prices',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Fresh offers from restaurants around you.',
                    style: TextStyle(
                      color: Color(0xFFE5E7EB),
                      fontWeight: FontWeight.w600,
                      height: 1.35,
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

class _OfferTile extends StatelessWidget {
  const _OfferTile({
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
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                item.imageAsset,
                width: 76,
                height: 76,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.offer ?? 'Special offer',
                    style: const TextStyle(
                      color: Color(0xFFFC8019),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.restaurant,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  Text(
                    '${item.name} • ${item.deliveryTime}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            IconButton.filled(
              onPressed: onAdd,
              icon: const Icon(Icons.add_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class _VoucherCard extends StatelessWidget {
  const _VoucherCard({
    required this.code,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String code;
  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFFFD8BE)),
      ),
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
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.w900)),
                const SizedBox(height: 3),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          Text(
            code,
            style: const TextStyle(
              color: Color(0xFFFC8019),
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
