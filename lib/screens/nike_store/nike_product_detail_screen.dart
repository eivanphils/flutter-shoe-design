import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shop_nike/models/shoe_info.dart';
import 'package:flutter_shop_nike/providers/store_provider.dart';
import 'package:flutter_shop_nike/widgets/widgets.dart';

class NikeProductDetailScreen extends StatelessWidget {
  final ShoeInfo product;

  const NikeProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Se selecciona el color pro defecto

    final String baseUrl =
        'assets/images/store/${product.slug}/${product.colors[0].colorName}';

    final String cover =
        'assets/images/store/${product.slug}/${product.colors[0].colorName}/cover.webp';

    // debo saber cual es el color selecionado para mostrar sus imagenes
    List<Widget> images = product.colors[0].images
        .map(
          (item) => Center(
            child: Image.asset(
              '$baseUrl/$item',
              width: 500,
            ),
          ),
        )
        .toList();

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
            const SizedBox(
              height: 20,
            ),
            _Cover(
              product: product,
            ),

            ...images
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
  final ShoeInfo product;

  const _Cover({required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final String cover =
        'assets/images/store/${product.slug}/${product.colors[0].colorName}/${product.colors[0].images[0]}';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: size.height * 0.70,
      child: Stack(
        children: [
          const _Background(),
          const Positioned(right: 0, child: _FavoriteButton()),
          const Positioned(child: _SizeSelector()),
          Positioned.fill(
            left: -80,
            top: -60,
            child: ShoeImage(
              image: cover,
              width: size.width * 0.90,
            ),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: _ColorDot(
                product: product,
              )),
          const Positioned(left: 0, bottom: 0, child: _PriceText()),
          const Positioned.fill(
              bottom: 0,
              child: Align(
                  alignment: Alignment.bottomCenter, child: _SwipeButton()))
        ],
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Fav',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 5,
        ),
        ButtonOutline(
            child: const FaIcon(FontAwesomeIcons.heart), onPressed: () {})
      ],
    );
  }
}

class _SizeSelector extends StatelessWidget {
  const _SizeSelector();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Size',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        _SizeSelectorButton(
          size: 9,
        ),
        SizedBox(
          height: 10,
        ),
        _SizeSelectorButton(
          size: 9.5,
        ),
        SizedBox(
          height: 10,
        ),
        _SizeSelectorButton(
          size: 10,
        ),
        SizedBox(
          height: 10,
        ),
        _SizeSelectorButton(
          size: 10.5,
        ),
      ],
    );
  }
}

class _SizeSelectorButton extends StatelessWidget {
  final double size;

  const _SizeSelectorButton({required this.size});

  @override
  Widget build(BuildContext context) {
    final StoreProvider storeProvider = Provider.of<StoreProvider>(context);
    final bool isSelected = storeProvider.selectedSize == size;

    return InkWell(
      onTap: () => storeProvider.selectedSize = size,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 45,
        height: 45,
        decoration: _decoration(isSelected),
        child: Center(
            child: Text(
          size.toString(),
          style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w300,
              color: isSelected ? Colors.white : Colors.black),
        )),
      ),
    );
  }

  BoxDecoration _decoration(bool isSelected) {
    return BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        border: Border.all(
            width: 1, color: isSelected ? Colors.black : Colors.grey[350]!),
        borderRadius: BorderRadius.circular(10));
  }
}

class _ColorDot extends StatelessWidget {
  final ShoeInfo product;

  const _ColorDot({required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: (45 * product.colors.length).toDouble() +
          (10 * product.colors.length).toDouble(),
      child: ListView.builder(
          itemCount: product.colors.length,
          itemBuilder: (context, index) {
            final ColorInfo color = product.colors[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                  color: Color(color.color),
                  border: Border.all(width: 1, color: Colors.grey[350]!),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        blurRadius: 15,
                        spreadRadius: -1,
                        offset: Offset(-3, 0))
                  ],
                  borderRadius: BorderRadius.circular(10)),
            );
          }),
    );
  }
}

class _PriceText extends StatelessWidget {
  const _PriceText();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          '\$159',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          'Price',
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}

class _SwipeButton extends StatelessWidget {
  const _SwipeButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 40,
            height: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey[850]),
            child: const Center(
                child: FaIcon(
              FontAwesomeIcons.bagShopping,
              color: Colors.white,
              size: 18,
            )),
          ),
          FaIcon(
            FontAwesomeIcons.chevronDown,
            size: 13,
            color: Colors.white.withOpacity(0.5),
          ),
          FaIcon(
            FontAwesomeIcons.chevronDown,
            size: 13,
            color: Colors.white.withOpacity(0.8),
          ),
          const FaIcon(
            FontAwesomeIcons.chevronDown,
            size: 13,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
