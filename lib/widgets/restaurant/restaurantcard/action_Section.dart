import 'package:flutter/material.dart';

class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE3E3E3)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _actionButton("Make reservation", isPrimary: true),
                _divider(),
                _actionButton("Get directions"),
                _divider(),
                _actionButton("Call"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _actionButton(String text, {bool isPrimary = false}) {
    return Expanded(
      child: Container(
        color: isPrimary ? const Color(0xFFEDFDEB) : Colors.transparent,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 10,
                color: isPrimary ? const Color(0xFF448A10) : const Color(0xFF7C7C7C),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1,
      color: const Color(0xFFE3E3E3),
    );
  }
}