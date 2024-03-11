import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_shop_nike/screens/screens.dart';
import 'package:flutter_shop_nike/providers/product_provider.dart';

class ProductImage extends StatelessWidget {
  final bool isFullScreen;

  const ProductImage({super.key, this.isFullScreen = false});

  @override
  Widget build(BuildContext context) {
        print(isFullScreen);

    return GestureDetector(
      onTap: () {
        if (!isFullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProductDetailScreen()));
        }
      },
      child: Container(
        margin: isFullScreen
            ? const EdgeInsets.only(top: 10, left: 10, right: 10)
            : const EdgeInsets.symmetric(horizontal: 20),
        height: isFullScreen ? 390 : 430,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF8D468),
          borderRadius: BorderRadius.circular(40),
        ),
        child: const _ProductPreview(),
      ),
    );
  }
}

class _ProductPreview extends StatelessWidget {
  final bool isFullScreen;

  const _ProductPreview({
    super.key,
    this.isFullScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    print(isFullScreen);
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      const _ShoeImage(),
      if (isFullScreen)
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SizeCard(number: 7),
            _SizeCard(number: 7.5),
            _SizeCard(number: 8),
            _SizeCard(number: 8.5),
            _SizeCard(
              number: 9,
            ),
            _SizeCard(number: 9.5),
          ],
        )
    ]);
  }
}

class _ShoeImage extends StatelessWidget {
  const _ShoeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 20,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              width: 250,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(color: Color(0xFFEAA14E), blurRadius: 40)
                  ]),
            ),
          ),
        ),
        Image.asset(
          'assets/images/azul.png',
          width: 250,
        ),
      ],
    );
  }
}

class _SizeCard extends StatelessWidget {
  final double number;
  const _SizeCard({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      width: 45,
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Color(0xFFF1A23A), offset: Offset(0, 5), blurRadius: 10),
          ],
          color: productProvider.selectedSize == number ? Colors.orangeAccent : Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        number.toString(),
        style: TextStyle(
            color: productProvider.selectedSize == number ? Colors.white : Colors.orangeAccent,
            fontWeight: FontWeight.w700),
      )),
    );
  }
}
