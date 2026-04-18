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
            style: TextStyle(color: Colors.grey, fontSize: 12,fontWeight: FontWeight.w500,),
          ),

          const SizedBox(height: 4),

          /// Name
          Row(
            children: [
                Text(
            restaurant.name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.favorite_border, color: Color(0xFF7C7C7C), size: 18),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.share_outlined, color: Color(0xFF7C7C7C), size: 18),
          ),
            ],
          ),
          

          const SizedBox(height: 6),

          /// Rating row
          Row(
            children: [
              Text("${restaurant.rating}",style: TextStyle(color: Color(0xFF7C7C7C),fontSize: 10,fontWeight: FontWeight.w500),),
              const SizedBox(width: 4),
              Text("(${restaurant.reviews} ratings)",
                  style: const TextStyle(color: Color(0xFF7C7C7C),fontSize: 10,fontWeight: FontWeight.w500)),

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
                    color: Color(0xFF448A10),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(width: 6),

              Text(
                "Closes ${restaurant.closingTime}",
                style: const TextStyle(color: Color(0xFF7C7C7C), fontSize: 10,fontWeight: FontWeight.w500),
              ),

              const SizedBox(width: 6),

              Text(
                restaurant.distance,
                style: const TextStyle(color: Color(0xFF7C7C7C), fontSize: 10,fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}