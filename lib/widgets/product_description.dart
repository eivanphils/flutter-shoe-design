import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String title;
  final String description;

  const ProductDescription({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: const TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
          )
        ],
      ),
    );
  }
}
