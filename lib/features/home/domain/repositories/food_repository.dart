import 'package:food_delivery_app/features/home/domain/entities/food_item.dart';

abstract class FoodRepository {
  List<FoodItem> getFoodItems();
}
