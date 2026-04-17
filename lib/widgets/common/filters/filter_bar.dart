import 'package:flutter/material.dart';
import 'filter_chip.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          Icon(Icons.tune, size: 16),
          SizedBox(width: 4),
          FilterChipButton(label: "Sort by", hasDropdown: true),
          FilterChipButton(label: "Open now"),
          FilterChipButton(label: "Cuisine", hasDropdown: true),
          FilterChipButton(label: "Top rated"),
        ],
      ),
    );
  }
}

