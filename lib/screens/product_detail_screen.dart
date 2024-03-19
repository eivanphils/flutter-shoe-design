import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shop_nike/helpers/helpers.dart';
import 'package:flutter_shop_nike/providers/product_provider.dart';
import 'package:flutter_shop_nike/widgets/widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusBarLight();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'product-card',
                child: ProductImage(
                  isFullScreen: true,
                ),
              ),
              Positioned(
                  left: 20,
                  top: 80,
                  child: FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      onPressed: () {
                        setStatusBarDark();
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 30,
                      )))
            ],
          ),
          const Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ProductDescription(
                  title: 'Nike Air Max 720',
                  description:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '\$ ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '180.0',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    _CartButton(),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                _Buttons(),
                _FooterButtons()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _CartButton extends StatelessWidget {
  const _CartButton();

  @override
  Widget build(BuildContext context) {
    return Bounce(
      delay: const Duration(milliseconds: 500),
      from: 8,
      child: const CustomButton(
          backgroundColor: Color(0xFFFFA000),
          width: 130,
          height: 40,
          child: Center(
              child: Text(
            'Buy now',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ))),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 20,
        ),
        const Expanded(
            child: Stack(
          children: [
            _CircleButton(
              color: Color(0xFF364D56),
              asset: 'assets/images/negro.png',
              index: 1,
            ),
            Positioned(
              left: 30,
              child: _CircleButton(
                color: Color(0xFFC6D642),
                asset: 'assets/images/verde.png',
                index: 2,
              ),
            ),
            Positioned(
              left: 60,
              child: _CircleButton(
                color: Color(0xFFFFAD29),
                asset: 'assets/images/amarillo.png',
                index: 3,
              ),
            ),
            Positioned(
                left: 90,
                child: _CircleButton(
                  color: Color(0xFF2099F1),
                  asset: 'assets/images/azul.png',
                  index: 4,
                )),
          ],
        )),
        // const Spacer(),
        Bounce(
          delay: const Duration(milliseconds: 500),
          from: 8,
          child: CustomButton(
              backgroundColor: const Color(0xFFFFA000).withOpacity(0.4),
              width: 150,
              height: 30,
              child: const Center(
                  child: Text(
                'More related items',
                style: TextStyle(color: Colors.white),
              ))),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  final Color color;
  final int index;
  final String asset;
  const _CircleButton(
      {required this.color,
      required this.index,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () => productProvider.selectedShoe = asset,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _FooterButtons extends StatelessWidget {
  const _FooterButtons();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const _Button(
          icon: Icons.heart_broken,
          color: Colors.red,
        ),
        _Button(icon: Icons.shopping_bag, color: Colors.grey.withOpacity(0.4)),
        _Button(
          icon: Icons.settings,
          color: Colors.grey.withOpacity(0.4),
        ),
      ]),
    );
  }
}

class _Button extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _Button({
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: -4,
                blurRadius: 20,
                offset: Offset(0, 10))
          ],
          shape: BoxShape.circle),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
