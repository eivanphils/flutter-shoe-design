import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter_shop_nike/models/shoe_info.dart';
import 'package:flutter_shop_nike/models/shoes_data.dart';

class StoreProvider extends ChangeNotifier {
  double _selectedSize = 9.0;
  List<ShoeInfo> storeProducts = [];
  ShoeInfo _selectedShoe = ShoeInfo(name: '', slug: '', colors: []);

  set selectedSize(double size) {
    _selectedSize = size;
    notifyListeners();
  }

  double get selectedSize => _selectedSize;

  set selectedShow(ShoeInfo shoe) {
    _selectedShoe = shoe;
    notifyListeners();
  }

  ShoeInfo get selectedShoe => _selectedShoe;

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
