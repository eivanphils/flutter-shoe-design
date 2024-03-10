import 'package:flutter/material.dart';

class HeaderAppBar extends StatelessWidget {
  final String title;
  const HeaderAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            const Icon(Icons.search)
          ]),
      ),
    );
  }
}
