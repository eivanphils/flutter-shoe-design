import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_shop_nike/widgets/widgets.dart';

class StoreCatalogScreen extends StatelessWidget {
  const StoreCatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: HeaderAppBar(
          title: Image.asset(
            'assets/images/nike-red.png',
            width: 80,
          ),
          scaffoldKey: scaffoldKey),
      drawer: const Menu(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'New Collection',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Nike original 2024',
                style: TextStyle(color: Colors.red),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 180,
                child: SliderShoes(),
              ),
              const SizedBox(
                height: 30,
              ),

              // Category
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryHeader(
                    title: 'LifeStyle',
                    subtitle: '35 Items',
                    isSelected: true,
                  ),
                  CategoryHeader(title: 'Running', subtitle: '41 Items'),
                  CategoryHeader(title: 'Tennis', subtitle: '118 Items'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              SizedBox(
                width: double.infinity,
                height: 350,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return const CardShoes();
                    }),
              ),

              SizedBox(
                width: double.infinity,
                height: 350,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const CardShoes();
                    }),
              ),

              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const _FloatingButtons(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _FloatingButtons extends StatelessWidget {
  const _FloatingButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
              color: Colors.black,
            )),
        CircleButton(
            radio: 70,
            child: const Center(
                child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.white,
            )),
            onPress: () {}),
        IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.heart,
              color: Colors.black,
            )),
      ],
    );
  }
}
