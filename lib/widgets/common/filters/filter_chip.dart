import 'package:flutter/material.dart';

class FilterChipButton extends StatelessWidget {
  final String label;
  final bool hasDropdown;

  const FilterChipButton({
    super.key,
    required this.label,
    this.hasDropdown = false,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label,style: TextStyle(
                        color: Color(0xFF7C7C7C),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),),
          if (hasDropdown) ...[
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, size: 16),
          ],
        ],
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(color: Color(0xFFE3E3E3), width: 1),
      ),
    );
  }
}