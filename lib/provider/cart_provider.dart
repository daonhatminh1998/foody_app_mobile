import 'package:foody_app/model/product/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  List<ProductDetail> cart = [];

  int _totalQuantity = 0;
  int get totalQuantity => _totalQuantity;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  void _setPrefsItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('total_item', _totalQuantity);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefsItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _totalPrice = prefs.getDouble('total_price') ?? 0;
    _totalQuantity = prefs.getInt('total_item') ?? 0;
    notifyListeners();
  }

  void addProductCounter(ProductDetail product) {
    print('product Counter');
    var checkId =
        cart.where((e) => e.productDetailId == product.productDetailId);
    if (cart.isEmpty) {
      print('empty list --> add');
      cart.add(product);
    } else if (cart.isNotEmpty) {
      // print("has item");
      // print(cart.map((e) => e.toJson()));
      // print(cart.where((e) => e.productDetailId == product.productDetailId));
      if (checkId.isNotEmpty) {
        print('product existed --> +quantity');
        for (ProductDetail x in cart) {
          if (x.productDetailId == product.productDetailId) {
            x.quantity++;
          }
        }
      } else {
        print('product not exist --> add');
        cart.add(product);
      }
    }
    _setPrefsItem();
    notifyListeners();
  }

  void incrementCounter(ProductDetail product) {
    // _quantity++;
    // _totalQuantity = _totalQuantity++;
    // _setPrefsItem();
    // notifyListeners();
  }

  void decrementCounter(double productPrice) {
    // if (_quantity < 0) {
    //   _quantity = 0;
    // }
    // _totalPrice = _totalPrice - productPrice;
    // _quantity--;
    // _totalQuantity = _totalQuantity - 1;
    // _setPrefsItem();
    // notifyListeners();
  }

  int getTotalQuantity() {
    int temp = 0;
    for (var e in cart) {
      temp += e.quantity;
    }
    _totalQuantity = temp;
    return _totalQuantity;
  }
}
