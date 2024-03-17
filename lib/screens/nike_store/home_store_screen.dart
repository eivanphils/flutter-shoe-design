import 'package:flutter/material.dart';

import 'package:flutter_shop_nike/screens/screens.dart';
import 'package:flutter_shop_nike/widgets/widgets.dart';

class HomeStoreScreen extends StatelessWidget {
  const HomeStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _Background(
        child: _Body(),
      ),
      floatingActionButton: CircleButton(
        onPress: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const StoreCatalogScreen())),
        child: const Center(
            child: Text(
          'Go',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Image.asset(
              'assets/images/nike-black.png',
              width: 100,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
              'Nike',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Throwback future'.toUpperCase(),
              style: const TextStyle(fontSize: 20, letterSpacing: 5),
            ),
            SizedBox(
              height: size.height * 0.18,
            ),
            Transform.rotate(
              angle: -0.7,
              child: Image.asset(
                'assets/images/store/Nike-Air-Max-1-Premium/cover.png',
                width: size.width * 0.85,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  final Widget child;
  const _Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _PaintLines(),
          ),
        ),
        child,

// first line
        Positioned(
            left: 0,
            top: size.height * 0.5,
            child: Container(
              width: 5,
              height: 5,
              color: Colors.red,
            )),

        Positioned(
            right: 0,
            top: size.height * 0.40,
            child: Container(
              width: 5,
              height: 5,
              color: Colors.blue,
            )),

        Positioned(
            left: 0,
            top: size.height * 0.62,
            child: Container(
              width: 5,
              height: 5,
              color: Colors.green,
            )),

        Positioned(
            right: 0,
            top: size.height * 0.50,
            child: Container(
              width: 5,
              height: 5,
              color: Colors.blue,
            )),
      ],
    );
  }
}

class _PaintLines extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final firstLine = Paint()
      ..color = const Color(0xFF3A2EFE)
      ..style = PaintingStyle.fill;

    final firstPath = Path();
    firstPath.moveTo(0, size.height * 0.4);
    firstPath.lineTo(size.width, size.height * 0.3);
    firstPath.lineTo(size.width, size.height * 0.4);
    firstPath.lineTo(0, size.height * 0.5);
    firstPath.lineTo(0, size.height * 0.4);
    canvas.drawPath(firstPath, firstLine);

    final secondLine = Paint()
      ..color = const Color(0xFFEE7964)
      ..style = PaintingStyle.fill;

    final secondPath = Path();
    secondPath.moveTo(0, size.height * 0.5);
    secondPath.lineTo(size.width, size.height * 0.4);
    secondPath.lineTo(size.width, size.height * 0.5);
    secondPath.lineTo(0, size.height * 0.6);
    secondPath.lineTo(0, size.height * 0.5);
    canvas.drawPath(secondPath, secondLine);


    final thirdLine = Paint()
      ..color = const Color(0xFF3ABBBF)
      ..style = PaintingStyle.fill;

    final thirdPath = Path();
    thirdPath.moveTo(0, size.height * 0.6);
    thirdPath.lineTo(size.width, size.height * 0.5);
    thirdPath.lineTo(size.width, size.height * 0.6);
    thirdPath.lineTo(0, size.height * 0.7);
    thirdPath.lineTo(0, size.height * 0.6);
    canvas.drawPath(thirdPath, thirdLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _DiagonalHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // paint properties
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.26);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
