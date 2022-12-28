// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:foody_app/model/product/product_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartModel with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  List<ProductDetail> _cart = [];
  List<ProductDetail> get cart => _cart;

  Future<List<ProductDetail>> getData() async {
    return _cart;
  }

  List<ProductDetail> addProduct(ProductDetail productDetail) {
    if (checkItem(productDetail)) {
      for (var x in cart) {
        x.productDetailId == productDetail.productDetailId
            ? x.quantity++
            : null;
      }
    }
    if (!checkItem(productDetail)) {
      cart.add(productDetail);
    }
    return cart;
  }

  bool checkItem(ProductDetail productDetail) {
    for (var x in cart) {
      if (x.productDetailId == productDetail.productDetailId) {
        return true;
      }
    }
    return false;
  }

  void _setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_items', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_items') ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefsItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefsItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefsItems();
    return _totalPrice;
  }

  void addCounter() {
    _counter++;
    _setPrefsItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPrefsItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefsItems();
    return _counter;
  }
}
