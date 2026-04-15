class FoodItem {
  final String id;
  final String name;
  final String categoryId;
  final String image;
  final double price;
  final String description;
  final String time;
  final double takeoutPrice;
  final List<String> images;

  FoodItem({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
    required this.price,
    required this.description,
    required this.time,
    required this.images,
    required this.takeoutPrice,
  });
}