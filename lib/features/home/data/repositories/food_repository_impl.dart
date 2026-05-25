import 'package:fooood/features/home/data/datasources/food_local_data_source.dart';
import 'package:fooood/features/home/domain/entities/food_item.dart';
import 'package:fooood/features/home/domain/repositories/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository {
  FoodRepositoryImpl(this._localDataSource);

  final FoodLocalDataSource _localDataSource;

  @override
  List<FoodItem> getFoodItems() => _localDataSource.getFoodItems();
}
