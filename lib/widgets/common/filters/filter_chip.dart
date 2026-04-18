import 'package:flutter/material.dart';

class FilterChipButton extends StatelessWidget {
  final String label;
  final bool hasDropdown;
  final List<String>? dropdownOptions;
  final Function(String)? onSelected;

  const FilterChipButton({
    super.key,
    required this.label,
    this.hasDropdown = false,
    this.dropdownOptions,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    Widget chip = Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF7C7C7C),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (hasDropdown) ...[
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, size: 16, color: Color(0xFF7C7C7C)),
          ],
        ],
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(color: Color(0xFFE3E3E3), width: 1),
      ),
    );

    if (hasDropdown && dropdownOptions != null && dropdownOptions!.isNotEmpty) {
      return PopupMenuButton<String>(
        onSelected: onSelected,
        offset: const Offset(0, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        itemBuilder: (BuildContext context) {
          return dropdownOptions!.map((String option) {
            return PopupMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF12190B),
                ),
              ),
            );
          }).toList();
        },
        child: chip,
      );
    }

    return chip;
  }
}