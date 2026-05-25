class FoodItem {
  const FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageAsset,
    required this.rating,
  });

  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageAsset;
  final double rating;
}
