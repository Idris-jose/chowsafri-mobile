import 'package:flutter/material.dart';

class RestaurantHeader extends StatelessWidget {
  const RestaurantHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Banner Image
        SizedBox(
          height: 250,
          width: double.infinity,
          child: Image.network(
            'https://picsum.photos/800/600?random=100', // Placeholder for restaurant image
            fit: BoxFit.cover,
          ),
        ),
        
        // Transparent AppBar actions
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
                    ),
                  ),
                ),
                // Right actions
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.favorite_border, color: Colors.black, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.reply, color: Colors.black, size: 20), // Share icon
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // See photos button
        Positioned(
          bottom: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Icon(Icons.photo_library_outlined, color: Colors.white, size: 16),
                SizedBox(width: 8),
                Text('See photos', style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
        ),

        // Overlapping Logo
        Positioned(
          bottom: -40,
          left: 16,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 36,
              backgroundColor: const Color(0xFFDFF0B7),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/logo/logo.png', fit: BoxFit.contain),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
