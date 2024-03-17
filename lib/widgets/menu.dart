import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            Text('homele'),
            Text('homele'),
            Text('homele'),
            Text('homele'),
            Text('homele'),
            Text('homele'),
            Text('homele2222'),
          ],
        ),
      ),
    );
  }
}
