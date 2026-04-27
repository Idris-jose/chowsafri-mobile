import 'package:flutter/material.dart';
import 'Review_card.dart';

class ReviewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReviewCard(
          name: 'Oghene Joan',
          rating: 3.5,
          review: 'The food is nice and cheap. Beautiful outfit with good and excellent service',
          time: '2 months ago',
        ),
        ReviewCard(
          name: 'User',
          rating: 3.5,
          review: 'The food is nice and cheap. Beautiful outfit with good and excellent service',
          time: '2 minutes ago',
        ),
      ],
    );
  }
}