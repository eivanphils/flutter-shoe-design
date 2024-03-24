import 'package:flutter/material.dart';

class ShoeImage extends StatelessWidget {
  final String image;
  final double width;
  const ShoeImage({
    super.key, required this.image, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Transform.rotate(
        angle: -0.7,
        child: Image.asset(
          image,
          width: width,
        ),
      ),
    );
  }
}
