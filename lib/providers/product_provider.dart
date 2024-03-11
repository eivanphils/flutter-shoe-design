import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  String _selectedShow = 'assets/images/azul.png';
  double _selectedSize = 9.0;

  set selectedShoe(String asset) {
    _selectedShow = asset;
    notifyListeners();
  }

  String get selectedShoe => _selectedShow;

  set selectedSize(double size) {
    _selectedSize = size;
    notifyListeners();
  }

  double get selectedSize => _selectedSize;
}
