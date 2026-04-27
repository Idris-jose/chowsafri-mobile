import 'package:flutter/material.dart';

class ServiceOptionsPill extends StatelessWidget {
  final Color primaryGreen;

  const ServiceOptionsPill({super.key, required this.primaryGreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildServiceOption(Icons.restaurant, 'Dine-in', primaryGreen),
          _buildServiceOption(Icons.shopping_bag_outlined, 'Takeaway', primaryGreen),
          _buildServiceOption(Icons.directions_bike_outlined, 'Delivery', Colors.grey.shade300, textColor: Colors.grey.shade400),
        ],
      ),
    );
  }

  Widget _buildServiceOption(IconData icon, String text, Color iconColor, {Color textColor = Colors.black87}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor, size: 18),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
