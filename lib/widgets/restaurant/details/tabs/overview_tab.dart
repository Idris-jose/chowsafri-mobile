import 'package:flutter/material.dart';
import '../info_row.dart';
import '../service_options_pill.dart';

class OverviewTab extends StatelessWidget {
  final Color primaryGreen;

  const OverviewTab({super.key, required this.primaryGreen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: primaryGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text('Open', style: TextStyle(color: primaryGreen, fontSize: 12, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(width: 12),
              const Text('10.3km Away', style: TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(width: 12),
              const Text('Closes 11pm', style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 24),
          
          const InfoRow(
            icon: Icons.location_on_outlined, 
            text: '92 Aminu Kano Cres, Wuse, Abuja\n904101, Federal Capital Territory', 
            trailingIcon: Icons.copy,
          ),
          const InfoRow(icon: Icons.star_border, text: '4.5 (160+ ratings)'),
          const InfoRow(icon: Icons.access_time, text: 'Open hours', trailingIcon: Icons.keyboard_arrow_down),
          const InfoRow(icon: Icons.call_outlined, text: '07012345678', trailingIcon: Icons.copy),
          InfoRow(
            icon: Icons.public, 
            text: 'www.otegaplus.com', 
            trailingWidget: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.delivery_dining_outlined, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text('Place an order', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          ServiceOptionsPill(primaryGreen: primaryGreen),
        ],
      ),
    );
  }
}
