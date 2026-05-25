import 'package:get/get.dart';

import 'package:fooood/features/home/domain/entities/food_item.dart';
import 'package:fooood/features/home/domain/usecases/get_food_items_usecase.dart';

class HomeController extends GetxController {
  HomeController(this._getFoodItemsUseCase);

  final GetFoodItemsUseCase _getFoodItemsUseCase;

  final foods = <FoodItem>[].obs;
  final selectedCategory = 'All'.obs;

  List<String> get categories {
    final values = foods.map((item) => item.category).toSet().toList()..sort();
    return <String>['All', ...values];
  }

  List<FoodItem> get visibleFoods {
    final category = selectedCategory.value;
    if (category == 'All') {
      return foods;
    }
    return foods.where((item) => item.category == category).toList();
  }

  @override
  void onInit() {
    super.onInit();
    foods.assignAll(_getFoodItemsUseCase.call());
  }

  void setCategory(String category) {
    selectedCategory.value = category;
  }
}

