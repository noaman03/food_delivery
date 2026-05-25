import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: <Widget>[
        const _ActiveOrderCard(
          title: 'Napoli Oven',
          status: 'Preparing your order',
          eta: 'Arrives in 28 min',
          image: 'assets/images/pizza.png',
          progress: 0.45,
        ),
        const SizedBox(height: 18),
        Text(
          'Recent orders',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        const SizedBox(height: 12),
        const _PastOrderTile(
          restaurant: 'Burger District',
          meal: 'Chicken Burger',
          date: 'Yesterday',
          total: 'EGP 139',
          image: 'assets/images/food.png',
        ),
        const SizedBox(height: 12),
        const _PastOrderTile(
          restaurant: 'Green Bowl',
          meal: 'Salmon Bowl',
          date: 'May 21',
          total: 'EGP 219',
          image: 'assets/images/salad.png',
        ),
        const SizedBox(height: 12),
        const _PastOrderTile(
          restaurant: 'FoodHub Deals',
          meal: 'Family Meal Box',
          date: 'May 18',
          total: 'EGP 289',
          image: 'assets/images/Group 17772.png',
        ),
      ],
    );
  }
}

class _ActiveOrderCard extends StatelessWidget {
  const _ActiveOrderCard({
    required this.title,
    required this.status,
    required this.eta,
    required this.image,
    required this.progress,
  });

  final String title;
  final String status;
  final String eta;
  final String image;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFC8019),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Active order',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 7,
                    backgroundColor: Colors.white24,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  eta,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Image.asset(image, width: 104, height: 104, fit: BoxFit.contain),
        ],
      ),
    );
  }
}

class _PastOrderTile extends StatelessWidget {
  const _PastOrderTile({
    required this.restaurant,
    required this.meal,
    required this.date,
    required this.total,
    required this.image,
  });

  final String restaurant;
  final String meal;
  final String date;
  final String total;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child:
                  Image.asset(image, width: 70, height: 70, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    restaurant,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 3),
                  Text(meal, style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 6),
                  Text(
                    '$date - $total',
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Reorder'),
            ),
          ],
        ),
      ),
    );
  }
}
