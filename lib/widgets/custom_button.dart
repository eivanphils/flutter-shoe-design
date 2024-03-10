import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double width;
  final double height;
  final EdgeInsets? padding;

  const CustomButton(
      {super.key,
      required this.child,
      required this.backgroundColor,
      required this.width,
      required this.height, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(40)),
      child: child,
    );
  }
}
