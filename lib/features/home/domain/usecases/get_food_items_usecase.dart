import 'package:fooood/features/home/domain/entities/food_item.dart';
import 'package:fooood/features/home/domain/repositories/food_repository.dart';

class GetFoodItemsUseCase {
  GetFoodItemsUseCase(this._repository);

  final FoodRepository _repository;

  List<FoodItem> call() => _repository.getFoodItems();
}

