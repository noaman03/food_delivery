import 'package:fooood/features/cart/domain/entities/cart_item.dart';

class CalculateCartTotalUseCase {
  double call(Iterable<CartItem> items) {
    return items.fold<double>(0, (sum, item) => sum + item.totalPrice);
  }
}
