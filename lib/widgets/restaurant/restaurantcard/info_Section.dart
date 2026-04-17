import 'package:flutter/material.dart';
import 'package:chowsafari_mobile/models/restaurant_card_model.dart';

class InfoSection extends StatelessWidget {
  final Restaurant restaurant;

  const InfoSection({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Category
          const Text(
            "Restaurant",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),

          const SizedBox(height: 4),

          /// Name
          Text(
            restaurant.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          /// Rating row
          Row(
            children: [
              Text("${restaurant.rating}"),
              const SizedBox(width: 4),
              Text("(${restaurant.reviews} ratings)",
                  style: const TextStyle(color: Colors.grey)),

              const SizedBox(width: 10),

              /// Open badge
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  restaurant.isOpen ? "Open" : "Closed",
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                  ),
                ),
              ),

              const SizedBox(width: 6),

              Text(
                "Closes ${restaurant.closingTime}",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),

              const SizedBox(width: 6),

              Text(
                restaurant.distance,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}