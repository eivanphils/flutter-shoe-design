import 'package:flutter/material.dart';

class SliderShoes extends StatelessWidget {
  const SliderShoes({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        // color: Colors.blue[100],
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: ((context, index) {
              return const _Slide();
            })));
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _BackgroundCard(),
        const Positioned(
          left: 10,
          top: 20,
          child: Text('Nike Air Max 270',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
        ),
        const Positioned(
          left: 10,
          top: 45,
          child: Text('Mens shoes',
                  style: TextStyle(fontSize: 23, color: Colors.grey),),
        ),

        const Positioned(
          left: 10,
          bottom: 40,
          child: _Button()),

        Positioned(
          right: 20,
          bottom: -20,
          child: Image.asset(
            'assets/images/azul.png',
            width: 200,
          ))
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
                    borderRadius: BorderRadius.circular(10)))
      ),
      onPressed: () {},
      child: const Text('Shop now', style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white),));
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
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
