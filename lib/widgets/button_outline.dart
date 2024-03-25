import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const ButtonOutline({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.grey[350]!)),
        child: Center(child: child),
      ),
    );
  }
}
