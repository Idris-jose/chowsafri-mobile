import 'package:flutter/material.dart';
import 'restaurant_details_screen.dart';

class PostScreen extends StatelessWidget {
  final String imageUrl;

  const PostScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// IMAGE
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),

          /// TOP BAR
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// ✅ BACK BUTTON (fixed)
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3E3E3),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 2.0),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(), // keeps spacing balanced
              ],
            ),
          ),

          /// BOTTOM CONTENT
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// LEFT (caption/user)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          /// ✅ NAVIGATE TO RESTAURANT
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const RestaurantDetailsScreen(),
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.store, color: Colors.green),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "OtegaPlus Kitchen",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Here’s a beautiful view for our restaurant thing...",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),

                /// RIGHT (actions)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.favorite_border, color: Colors.white),
                    SizedBox(height: 16),
                    Icon(Icons.chat_bubble_outline, color: Colors.white),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}