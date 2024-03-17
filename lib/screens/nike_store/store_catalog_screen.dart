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
            'assets/images/nike-grey.png',
            width: 70,
            color: Colors.red,
          ),
          scaffoldKey: scaffoldKey),
      drawer: const Menu(),
      body: const Center(
        child: Text('CatalogStoreScreen'),
      ),
    );
  }
}
