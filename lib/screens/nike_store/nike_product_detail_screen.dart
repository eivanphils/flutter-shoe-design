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
          title: Image.asset(
            'assets/images/nike-red.png',
            width: 80,
          )),
      body: Center(
        child: ShoeImage(
          image: cover,
          width: 500,
        ),
      ),
    );
  }
}
