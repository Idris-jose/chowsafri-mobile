import 'package:flutter/material.dart';

class RatingSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// LEFT: rating bars
        Expanded(
          child: Column(
            children: List.generate(5, (index) {
              return Row(
                children: [
                  Text('${5 - index}',style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF7C7C7C))),
                  SizedBox(width: 8),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0.6, // change per rating
                      backgroundColor: Colors.grey[300],
                      color: Color(0xFF92AD1A),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),

        const SizedBox(width: 16),

        /// RIGHT: overall rating
        Column(
          children: [
            Text(
              '4.5',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < 4 ? Icons.star : Icons.star_border,
                  color: Color(0xFF92AD1A),
                  size: 16,
                );
              }),
            ),
            Text('Based on 156 reviews',style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color:Color(0xFF7C7C7C))),
          ],
        )
      ],
    );
  }
}