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
        restaurant: 'Burger District',
        deliveryTime: '25-35 min',
        offer: '20% off',
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
        restaurant: 'Napoli Oven',
        deliveryTime: '30-40 min',
        offer: 'Free delivery',
      ),
      FoodItem(
        id: 'f3',
        name: 'Salmon Bowl',
        description: 'Healthy bowl with salmon, avocado, and mixed greens.',
        price: 219,
        category: 'Healthy',
        imageAsset: 'assets/images/salad.png',
        rating: 4.8,
        restaurant: 'Green Bowl',
        deliveryTime: '20-30 min',
      ),
      FoodItem(
        id: 'f4',
        name: 'Pasta Alfredo',
        description: 'Creamy alfredo pasta with parmesan and herbs.',
        price: 165,
        category: 'Pasta',
        imageAsset: 'assets/images/pizza big.png',
        rating: 4.4,
        restaurant: 'Pasta House',
        deliveryTime: '35-45 min',
        offer: 'Buy 1 get 1',
      ),
      FoodItem(
        id: 'f5',
        name: 'Pepperoni Feast',
        description: 'Crispy pepperoni, mozzarella, tomato sauce, and oregano.',
        price: 195,
        category: 'Pizza',
        imageAsset: 'assets/images/pizza hut.png',
        rating: 4.6,
        restaurant: 'Slice Street',
        deliveryTime: '25-35 min',
      ),
      FoodItem(
        id: 'f6',
        name: 'Family Meal Box',
        description: 'Pizza, fries, salad, and dips for a complete dinner.',
        price: 289,
        category: 'Deals',
        imageAsset: 'assets/images/Group 17772.png',
        rating: 4.9,
        restaurant: 'FoodHub Deals',
        deliveryTime: '30-45 min',
        offer: 'Save EGP 70',
      ),
    ];
  }
}
