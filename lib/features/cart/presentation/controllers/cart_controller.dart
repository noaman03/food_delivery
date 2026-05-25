import 'package:get/get.dart';

import 'package:fooood/features/cart/domain/entities/cart_item.dart';
import 'package:fooood/features/cart/domain/usecases/calculate_cart_total_usecase.dart';
import 'package:fooood/features/home/domain/entities/food_item.dart';

class CartController extends GetxController {
  CartController(this._calculateCartTotalUseCase);

  final CalculateCartTotalUseCase _calculateCartTotalUseCase;
  final _itemsById = <String, CartItem>{}.obs;

  List<CartItem> get items => _itemsById.values.toList();
  bool get isEmpty => _itemsById.isEmpty;
  int get totalItems => _itemsById.values.fold(0, (sum, item) => sum + item.quantity);
  double get subtotal => _calculateCartTotalUseCase(items);

  void addItem(FoodItem food) {
    final existing = _itemsById[food.id];
    if (existing == null) {
      _itemsById[food.id] = CartItem(food: food, quantity: 1);
    } else {
      _itemsById[food.id] = existing.copyWith(quantity: existing.quantity + 1);
    }
    _itemsById.refresh();
    Get.snackbar('Added', '${food.name} added to cart');
  }

  void increment(String foodId) {
    final existing = _itemsById[foodId];
    if (existing == null) return;
    _itemsById[foodId] = existing.copyWith(quantity: existing.quantity + 1);
    _itemsById.refresh();
  }

  void decrement(String foodId) {
    final existing = _itemsById[foodId];
    if (existing == null) return;
    if (existing.quantity == 1) {
      _itemsById.remove(foodId);
    } else {
      _itemsById[foodId] = existing.copyWith(quantity: existing.quantity - 1);
    }
    _itemsById.refresh();
  }

  void clearCart() {
    _itemsById.clear();
    _itemsById.refresh();
  }
}

