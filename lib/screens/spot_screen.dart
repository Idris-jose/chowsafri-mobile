import 'package:flutter/material.dart';
import '../widgets/navigation/custom_nav_bar.dart';
import '../widgets/common/filters/filter_bar.dart';
import '../widgets/common/header.dart';
import '../widgets/restaurant/restaurantcard/restaurant_card.dart';
import '../data/restaurant_data.dart';
import './explore_screen.dart';

class SpotScreen extends StatefulWidget {
  const SpotScreen({super.key});

  @override
  State<SpotScreen> createState() => _SpotScreenState();
}

class _SpotScreenState extends State<SpotScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
  backgroundColor: const Color(0xFFEBEBEB),
  body: SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExploreScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.search, color: Color(0xFF7C7C7C), size: 20),
                label: const Text(
                  'Explore',
                  style: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 16),
          const AppHeader(
            title: "Spot",
            subtitle: "See best spots around you",
            showWelcome: false,
          ),
          const SizedBox(height: 0),

          const FilterBar(),

          const SizedBox(height: 12),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantCard(restaurant: restaurants[index]);
            },
          ),
        ],
      ),
    ),
  ),
);
  }
}
