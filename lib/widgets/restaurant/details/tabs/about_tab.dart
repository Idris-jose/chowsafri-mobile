import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  final Color primaryGreen;

  const AboutTab({super.key, required this.primaryGreen});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text('About Content'),
      ),
    );
  }
}
