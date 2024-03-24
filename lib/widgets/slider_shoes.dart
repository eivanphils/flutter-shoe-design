import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_shop_nike/models/shoe_info.dart';
import 'package:flutter_shop_nike/providers/store_provider.dart';

class SliderShoes extends StatelessWidget {
  const SliderShoes({super.key});

  @override
  Widget build(BuildContext context) {
    List<ShoeInfo> storeProducts =
        Provider.of<StoreProvider>(context).storeProducts;

    return SizedBox(
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: ((context, index) {
              final ShoeInfo product = storeProducts[index];
              return _Slide(product: product);
            })));
  }
}

class _Slide extends StatelessWidget {
  final ShoeInfo product;
  const _Slide({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final String cover =
        'assets/images/store/${product.slug}/${product.colors[0].colorName}/${product.colors[0].images[0]}';

    return Stack(
      children: [
        const _BackgroundCard(),
        Positioned(
          left: 10,
          top: 20,
          child: SizedBox(
            width: 220,
            child: Text(
              product.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 45,
          child: SizedBox(
            width: 220,
            child: Text(
              product.slug,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ),
        const Positioned(left: 10, bottom: 40, child: _Button()),
        Positioned(
          right: 20,
          bottom: 0,
          child: Transform.rotate(
            angle: -0.7,
            child: Image.asset(cover, width: 200),
          ),
        )
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
        onPressed: () {},
        child: const Text(
          'Shop now',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }
}

class _BackgroundCard extends StatelessWidget {
  const _BackgroundCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
      width: 350,
      height: 200,
      decoration: BoxDecoration(
          color: const Color(0xFFD9F8FB),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
