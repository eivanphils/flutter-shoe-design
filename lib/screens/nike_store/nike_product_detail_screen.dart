import 'package:flutter/material.dart';

import 'package:flutter_shop_nike/models/shoe_info.dart';
import 'package:flutter_shop_nike/widgets/widgets.dart';

class NikeProductDetailScreen extends StatelessWidget {
  final ShoeInfo product;

  const NikeProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String cover =
        'assets/images/store/${product.slug}/${product.colors[0].colorName}/${product.colors[0].images[0]}';

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/images/nike-red.png',
            width: 80,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            _Title(product.name),
            _Subtitle(product.slug),
            _Cover(),
            Center(
              child: ShoeImage(
                image: cover,
                width: 500,
              ),
            ),
            Center(
              child: ShoeImage(
                image: cover,
                width: 500,
              ),
            ),
            Center(
              child: ShoeImage(
                image: cover,
                width: 500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class _Subtitle extends StatelessWidget {
  final String subtitle;
  const _Subtitle(this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
    );
  }
}

class _Cover extends StatelessWidget {
  const _Cover();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: size.height * 0.70,
      color: Colors.red[200],
      child: Stack(
        children: [_Background()],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
          child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                'Nike'.toUpperCase(),
                style: TextStyle(
                    fontSize: size.width * 0.50,
                    color: const Color(0xFFECF2F4),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ))),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _SizeSelector extends StatelessWidget {
  const _SizeSelector();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _ColorDot extends StatelessWidget {
  const _ColorDot();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _SwipeButton extends StatelessWidget {
  const _SwipeButton();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
