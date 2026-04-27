import 'package:flutter/material.dart';

class RestaurantTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final Color primaryGreen;

  const RestaurantTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.primaryGreen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            _buildTabItem(0, 'Overview', Icons.list_alt),
            _buildTabItem(1, 'Reviews', Icons.star_border),
            _buildTabItem(2, 'About', Icons.info_outline),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(int index, String title, IconData icon) {
    bool isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabSelected(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? primaryGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: isSelected ? Colors.white : Colors.grey),
              const SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
