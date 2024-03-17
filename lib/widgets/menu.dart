import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:flutter_shop_nike/screens/screens.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 100,
              child: SvgPicture.asset('assets/images/jordan.svg'),
            ),
            const Text(
              'Nike Store',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const ProductScreen())),
              title: const Text('First Design'),
            ),
            ListTile(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeStoreScreen())),
              title: const Text('Second Design'),
            )
          ],
        ),
      ),
    );
  }
}
