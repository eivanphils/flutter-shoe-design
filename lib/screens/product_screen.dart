import 'package:flutter/material.dart';

import 'package:flutter_shop_nike/screens/screens.dart';
import 'package:flutter_shop_nike/helpers/helpers.dart';
import 'package:flutter_shop_nike/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusBarDark();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: HeaderAppBar(
          scaffoldKey: scaffoldKey,
          title: const Text(
            'For you',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          )),
      drawer: const Menu(),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                Hero(
                    tag: 'product-card',
                    child: ProductImage(
                      isFullScreen: false,
                    )),
                ProductDescription(
                  title: 'Nike Air Max 720',
                  description:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
              ],
            ))),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductDetailScreen())),
              child: CustomButton(
                  backgroundColor: Colors.grey.withOpacity(0.20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: size.width * 0.90,
                  height: 80,
                  child: const Row(
                    children: [
                      Text(
                        '\$ ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '180.0',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      _AddCartButton(),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class _AddCartButton extends StatelessWidget {
  const _AddCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomButton(
        backgroundColor: Color(0xFFFFA000),
        width: 130,
        height: 40,
        child: Center(
            child: Text(
          'Add to cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )));
  }
}
