import 'package:fooood/features/home/domain/entities/food_item.dart';

class FoodLocalDataSource {
  List<FoodItem> getFoodItems() {
    return const <FoodItem>[
      FoodItem(
        id: 'f1',
        name: 'Chicken Burger',
        description: 'Grilled chicken, cheddar, lettuce, and special sauce.',
        price: 139,
        category: 'Burgers',
        imageAsset: 'assets/images/food.png',
        rating: 4.7,
      ),
      FoodItem(
        id: 'f2',
        name: 'Margherita Pizza',
        description:
            'Classic stone-baked pizza with fresh basil and mozzarella.',
        price: 189,
        category: 'Pizza',
        imageAsset: 'assets/images/pizza.png',
        rating: 4.5,
      ),
      FoodItem(
        id: 'f3',
        name: 'Salmon Bowl',
        description: 'Healthy bowl with salmon, avocado, and mixed greens.',
        price: 219,
        category: 'Healthy',
        imageAsset: 'assets/images/salad.png',
        rating: 4.8,
      ),
      FoodItem(
        id: 'f4',
        name: 'Pasta Alfredo',
        description: 'Creamy alfredo pasta with parmesan and herbs.',
        price: 165,
        category: 'Pasta',
        imageAsset: 'assets/images/pizza big.png',
        rating: 4.4,
      ),
    ];
  }
}
