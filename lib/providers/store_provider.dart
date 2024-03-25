import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter_shop_nike/models/shoe_info.dart';
import 'package:flutter_shop_nike/models/shoes_data.dart';

class StoreProvider extends ChangeNotifier {
  double _selectedSize = 9.0;
  List<ShoeInfo> storeProducts = [];
  late ColorInfo _selectedColor;

  set selectedSize(double size) {
    _selectedSize = size;
    notifyListeners();
  }

  double get selectedSize => _selectedSize;

  set selectedColor(ColorInfo color) {
    _selectedColor = color;
    notifyListeners();
  }

  ColorInfo get selectedColor => _selectedColor;

  StoreProvider() {
    loadData();
  }

  Future<void> loadData() async {
 
    final String response =
        await rootBundle.loadString('assets/data.json');

    storeProducts = shoesDataFromJson(response).items;

    notifyListeners();
  }
}
