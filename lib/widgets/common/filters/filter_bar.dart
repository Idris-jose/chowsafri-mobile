import 'package:flutter/material.dart';
import 'filter_chip.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  String sortBy = "Sort by";
  String cuisine = "Cuisine";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const Icon(Icons.tune, size: 16),
          const SizedBox(width: 4),
          FilterChipButton(
            label: sortBy,
            hasDropdown: true,
            dropdownOptions: const ["Distance", "Rating", "Popularity"],
            onSelected: (value) {
              setState(() => sortBy = value);
            },
          ),
          const FilterChipButton(label: "Open now"),
          FilterChipButton(
            label: cuisine,
            hasDropdown: true,
            dropdownOptions: const ["African", "Continental", "Fast Food", "Drinks"],
            onSelected: (value) {
              setState(() => cuisine = value);
            },
          ),
          const FilterChipButton(label: "Top rated"),
        ],
      ),
    );
  }
}
