import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_shop_nike/models/shoe_info.dart';
import 'package:flutter_shop_nike/screens/nike_store/nike_product_detail_screen.dart';
import 'package:flutter_shop_nike/widgets/widgets.dart';

class CardShoes extends StatelessWidget {
  final ShoeInfo product;
  const CardShoes({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final String cover =
        'assets/images/store/${product.slug}/${product.colors[0].colorName}/cover.webp';

    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 20),
      width: 200,
      decoration: BoxDecoration(
          color: const Color(0xFFD9F8FB),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Positioned(left: 10, top: 10, child: _Title(product.name)),
          Positioned(left: 10, top: 100, child: _Colors(product.colors)),
          Positioned.fill(
            child: ShoeImage(
              image: cover,
              width: 180,
            ),
          ),
          const Positioned(
              left: 10,
              bottom: 30,
              child: Text(
                '\$159',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
          const Positioned(
              left: 10,
              bottom: 10,
              child: Text(
                'Price',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              )),
          Positioned(
              right: 20,
              bottom: 20,
              child: ButtonOutline(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NikeProductDetailScreen(
                                product: product,
                              ))),
                  child: const FaIcon(
                    FontAwesomeIcons.arrowRight,
                  ))),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title(this.title);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
      child: Text(
        title,
        maxLines: 2,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _Colors extends StatelessWidget {
  final List<ColorInfo> colors;
  const _Colors(this.colors);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 120,
      child: ListView.builder(
          itemCount: colors.length,
          itemBuilder: (context, index) {
            final ColorInfo color = colors[index];
            return Column(children: [
              CircleAvatar(
                backgroundColor: Color(color.color),
                radius: 8,
              ),
              const SizedBox(
                height: 10,
              ),
            ]);
          }),
    );
  }
}
