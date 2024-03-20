import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_shop_nike/screens/screens.dart';
import 'package:flutter_shop_nike/providers/product_provider.dart';

void main() => runApp(MultiProvider(
  providers: [ChangeNotifierProvider(create: (_) => ProductProvider())],
  child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: ProductScreen(),
    );
  }
}