import 'package:flutter/material.dart';

class CardShoes extends StatelessWidget {
  const CardShoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 20),
      width: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFD9F8FB),
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}