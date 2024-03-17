import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  final double radio;

  const CircleButton({
    super.key,
    required this.child,
    required this.onPress,
    this.radio = 100
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: radio,
        height: radio,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        child: child,
      ),
    );
  }
}
