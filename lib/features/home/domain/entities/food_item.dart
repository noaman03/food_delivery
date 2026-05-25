class FoodItem {
  const FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageAsset,
    required this.rating,
    required this.restaurant,
    required this.deliveryTime,
    this.offer,
  });

  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageAsset;
  final double rating;
  final String restaurant;
  final String deliveryTime;
  final String? offer;
}
