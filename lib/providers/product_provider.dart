import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  String _selectedShow = 'azul.png';
  double _selectedSize = 9.0;

  set selectedShow(String asset) {
    _selectedShow = asset;
    notifyListeners();
  }

  String get selectedShow => _selectedShow;

  set selectedSize(double size) {
    _selectedSize = size;
    notifyListeners();
  }

  double get selectedSize => _selectedSize;
}
