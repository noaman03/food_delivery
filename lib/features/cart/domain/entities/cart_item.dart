import 'package:fooood/features/home/domain/entities/food_item.dart';

class CartItem {
  const CartItem({
    required this.food,
    required this.quantity,
  });

  final FoodItem food;
  final int quantity;

  double get totalPrice => food.price * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      food: food,
      quantity: quantity ?? this.quantity,
    );
  }
}

