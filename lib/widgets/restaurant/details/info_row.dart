import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final IconData? trailingIcon;
  final Widget? trailingWidget;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
    this.trailingIcon,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black87, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ),
          if (trailingIcon != null) Icon(trailingIcon, color: Colors.black87, size: 18),
          if (trailingWidget != null) trailingWidget!,
        ],
      ),
    );
  }
}
