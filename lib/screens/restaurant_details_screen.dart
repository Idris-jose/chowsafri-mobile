import 'package:flutter/material.dart';
import '../widgets/restaurant/details/restaurant_header.dart';
import '../widgets/restaurant/details/restaurant_tab_bar.dart';
import '../widgets/restaurant/details/tabs/overview_tab.dart';
import '../widgets/restaurant/details/tabs/Reviews_tab.dart';
import '../widgets/restaurant/details/tabs/about_tab.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  State<RestaurantDetailsScreen> createState() => _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  int _selectedTabIndex = 0; 
  final Color primaryGreen = const Color(0xFF448A10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB), 
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RestaurantHeader(),
            const SizedBox(height: 56), 
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'OtegaPlus Kitchen',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 16),
            
            RestaurantTabBar(
              selectedIndex: _selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              primaryGreen: primaryGreen,
            ),
            const SizedBox(height: 20),
            
            if (_selectedTabIndex == 0) OverviewTab(primaryGreen: primaryGreen),
            if (_selectedTabIndex == 1) ReviewsTab(primaryGreen: primaryGreen),
            if (_selectedTabIndex == 2) AboutTab(primaryGreen: primaryGreen),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      color: const Color(0xFFEBEBEB),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 12),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Make reservation',
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
