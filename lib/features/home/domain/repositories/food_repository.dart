import 'package:fooood/features/home/domain/entities/food_item.dart';

abstract class FoodRepository {
  List<FoodItem> getFoodItems();
}

