import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final double rating;
  final String review;
  final String time;

  const ReviewCard({
    required this.name,
    required this.rating,
    required this.review,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 8),
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Text(time, style: TextStyle(fontSize: 12)),
            ],
          ),

          SizedBox(height: 8),

          /// Stars + rating
          Row(
            children: [
              ...List.generate(5, (index) {
                return Icon(
                  index < rating.floor()
                      ? Icons.star
                      : Icons.star_border,
                  color: Color(0xFF92AD1A),
                  size: 16,
                );
              }),
              SizedBox(width: 8),
              Text('$rating',style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ),

          SizedBox(height: 8),

          /// Review text
          Text(review),
        ],
      ),
    );
  }
}