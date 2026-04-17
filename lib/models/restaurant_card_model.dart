class Restaurant {
  final String id;
  final String name;
  final double rating;
  final int reviews;
  final bool isOpen;
  final String closingTime;
  final String distance;
  final List<String> images;

  Restaurant({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.isOpen,
    required this.closingTime,
    required this.distance,
    required this.images,
  });
}