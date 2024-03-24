import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_shop_nike/models/shoe_info.dart';
import 'package:flutter_shop_nike/models/shoes_data.dart';

class StoreProvider extends ChangeNotifier {
  double _selectedSize = 9.0;
  late ShoesData storeProducts;
  late ShoeInfo _selectedShoe;

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

    print(response);
    storeProducts = shoesDataFromJson(response);

    print(storeProducts.items[0].name);
    notifyListeners();
  }
}
