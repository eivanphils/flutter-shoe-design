import 'package:flutter/material.dart';

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
              Container(
                height: 180,
                color: Colors.red,
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
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return const CardShoes();
                  }
                ),
              ),

              
              SizedBox(
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                  
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const CardShoes();
                  }
                ),
              ),

              const SizedBox(
                height: 40,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
