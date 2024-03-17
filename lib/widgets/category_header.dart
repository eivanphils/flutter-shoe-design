import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  const CategoryHeader(
      {super.key,
      required this.title,
      required this.subtitle,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey),
        ),
        Text(
          subtitle,
          style: TextStyle(color: isSelected ? Colors.red : Colors.grey),
        ),
      ],
    );
  }
}
