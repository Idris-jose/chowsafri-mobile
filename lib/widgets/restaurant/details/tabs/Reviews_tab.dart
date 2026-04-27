import 'package:flutter/material.dart';
import 'package:chowsafari_mobile/widgets/common/Rating_summary.dart';
import 'package:chowsafari_mobile/widgets/common/Review_list.dart';

class ReviewsTab extends StatelessWidget {
  final Color primaryGreen;

  const ReviewsTab({super.key, required this.primaryGreen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingSummary(),
          const SizedBox(height: 16),
          ReviewsList(),
        ],
      ),
    );
  }
}
