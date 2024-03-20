import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  final Widget child;
  const ButtonOutline({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Colors.grey[350]!)),
      child: Center(child: child),
    );
  }
}
