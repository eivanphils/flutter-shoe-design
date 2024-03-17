import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  const CircleButton({
    super.key,
    required this.child,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 100,
        height: 100,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        child: child,
      ),
    );
  }
}
