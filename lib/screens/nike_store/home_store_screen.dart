import 'package:flutter/material.dart';

import 'package:flutter_shop_nike/screens/screens.dart';
import 'package:flutter_shop_nike/widgets/widgets.dart';

class HomeStoreScreen extends StatelessWidget {
  const HomeStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _Background(
        child: _Body(),
      ),
      floatingActionButton: CircleButton(
        onPress: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const StoreCatalogScreen())),
        child: const Center(
            child: Text(
          'Go',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Image.asset(
            'assets/images/nike-black.png',
            width: 100,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          const Text(
            'Nike',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            'Throwback future'.toUpperCase(),
            style: const TextStyle(fontSize: 20, letterSpacing: 5),
          ),
          SizedBox(
            height: size.height * 0.18,
          ),
          Transform.rotate(
            angle: -0.7,
            child: Image.asset(
              'assets/images/store/Nike-Air-Max-1-Premium/cover.png',
              width: size.width * 0.85,
            ),
          ),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  final Widget child;
  const _Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // color: Colors.purple[100],
      child: child,
    );
  }
}
