import 'package:flutter/material.dart';
import 'package:flutter_shop_nike/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardShoes extends StatelessWidget {
  const CardShoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 20),
      width: 200,
      decoration: BoxDecoration(
          color: const Color(0xFFD9F8FB),
          borderRadius: BorderRadius.circular(10)),
      child: const Stack(
        children: [
          Positioned(
            left: 10,
            top: 10,
            child: _Title()),

          Positioned(
            left: 10,
            top: 50,
            child: _Colors()),

          Positioned.fill(
            child: _ShoeImage(),
          ),

          Positioned(
            left: 10,
            bottom: 30,
            child: Text('\$159', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
          Positioned(
            left: 10,
            bottom: 10,
            child: Text('Price', style: TextStyle(fontSize: 18 ,color: Colors.grey),)),
          Positioned(
            right: 20,
            bottom: 20,
            child: ButtonOutline(child: FaIcon(FontAwesomeIcons.arrowRight,))),


        ],
      ),
    );
  }
}

class _ShoeImage extends StatelessWidget {
  const _ShoeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Transform.rotate(
        angle: -0.7,
        child: Image.asset(
          'assets/images/store/Nike-Air-Max-1-Premium/cover.png',
          width: 180,
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Nike Waffle',
      maxLines: 2,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class _Colors extends StatelessWidget {
  const _Colors();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.red,
          radius: 8,
        ),
        SizedBox(
          width: 10,
        ),
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 8,
        ),
        SizedBox(
          width: 10,
        ),
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 8,
        ),
      ],
    );
  }
}
