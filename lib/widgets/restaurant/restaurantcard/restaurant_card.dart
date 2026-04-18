import 'package:flutter/material.dart';
import 'info_Section.dart';
import 'action_Section.dart';
import 'image_Section.dart';
import 'package:chowsafari_mobile/models/restaurant_card_model.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(imageUrls: restaurant.images),
            InfoSection(restaurant: restaurant),
            const ActionSection(),
          ],
        ),
      ),
    );
  }
}