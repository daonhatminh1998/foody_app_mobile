import 'package:flutter/cupertino.dart';
import 'package:foody_app/model/product/product_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartViewModel with ChangeNotifier {
  int _counter = 0;
  int _quantity = 1;
  int get counter => _counter;
  int get quantity => _quantity;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  List<ProductDetail> cart = [];
  List<ProductDetail> get _cart => cart;

  void incrementCounter(ProductDetail productInfo) {
    // productInfo.quantity == 0 ? productInfo.quantity = 1 : productInfo.quantity;
    int index = cart
        .indexWhere((e) => e.productDetailId == productInfo.productDetailId);
    print(productInfo.quantity);
    // if (cart.isEmpty) {
    //   print('cart empty --> add');
    //   cart.add(productInfo); //quantity = 1
    //   increaseCounter();
    //   _totalPrice += productInfo.price;
    //   // print(cart.map((e) => e.toJson()));
    // }
    if (cart.isNotEmpty) {
      print('cart is not empty --> check idex: $index');
      // int index = cart
      //     .indexWhere((e) => e.productDetailId == productInfo.productDetailId);
      if (index == -1) {
        print('item does exist --> add item');
        cart.add(productInfo); //quantity =1
        increaseCounter();
        _totalPrice += productInfo.price;
      }
      if (index != -1) {
        print('item existed --> increase quantity');
        cart[index].quantity += 1;
        _totalPrice += productInfo.price;
        increaseCounter();
      }
    } else {
      print('cart empty --> add');
      cart.add(productInfo); //quantity = 1
      increaseCounter();
      _totalPrice += productInfo.price;
      // print(cart.map((e) => e.toJson()));

    }
    // print(cart.map((e) => e.toJson()));
    _setPrefsItems();
    notifyListeners();
  }

  void decrementCounter(ProductDetail productInfo) {
    //index in cart
    var item =
        cart.where((e) => e.productDetailId == productInfo.productDetailId);
    print(
        'index of item in cart: \n------------  ${item.map((e) => e.toJson())}');
    // exist --> !=-1
    if (item.isNotEmpty) {
      int index = cart
          .indexWhere((e) => e.productDetailId == productInfo.productDetailId);
      print('not empty index: $index');
      // check quantity
      if (cart[index].quantity >= 1) {
        cart[index].quantity--;
        _totalPrice -= productInfo.price;
        decreaseCounter();
      }
      if (cart[index].quantity < 1) {
        // print(cart[index].quantity);
        // print(productInfo.toJson());
        deleteProduct(productInfo);
        print("product deleted -- cart:${cart.map((e) => e.toJson())}");
      }
      // // print(cart[index].toJson());
    }
    _setPrefsItems();
    notifyListeners();
  }

  void deleteProduct(ProductDetail productInfo) {
    // print("info: ${productInfo.toJson()}");
    print('remove product of cart');
    final index = cart
        .indexWhere((e) => e.productDetailId == productInfo.productDetailId);
    if (index != -1) {
      if (cart[index].quantity >= 1) {
        _counter = counter - productInfo.quantity;
        _totalPrice -= productInfo.price * productInfo.quantity;
        cart.removeAt(index);
        // decreaseCounter();
      } else {
        cart.removeAt(index);
        // decreaseCounter();
      }
    }
    _setPrefsItems();
    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    _counter = 0;
    _totalPrice = 0;
    print("Cart has been clear");
  }

//  void addQuantity(int id) {
//    final index = cart.indexWhere((element) => element.id == id);
//    cart[index].quantity!.value = cart[index].quantity!.value + 1;
//    _setPrefsItems();
//    notifyListeners();
//  }

//  void deleteQuantity(int id) {
//    final index = cart.indexWhere((element) => element.id == id);
//    final currentQuantity = cart[index].quantity!.value;
//    if (currentQuantity <= 1) {
//      currentQuantity == 1;
//    } else {
//      cart[index].quantity!.value = currentQuantity - 1;
//    }
//    _setPrefsItems();
//    notifyListeners();
//  }

//  void removeItem(int id) {
//    final index = cart.indexWhere((element) => element.id == id);
//    cart.removeAt(index);
//    _setPrefsItems();
//    notifyListeners();
//  }

  void _setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_items', _counter);
    prefs.setInt('item_quantity', _quantity);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_items') ?? 0;
    _quantity = prefs.getInt('item_quantity') ?? 1;
    _totalPrice = prefs.getDouble('total_price') ?? 0;
  }

  void increaseCounter() {
    _counter++;
    _setPrefsItems();
    notifyListeners();
  }

  void decreaseCounter() {
    _counter--;
    // _counter <= 0 ? 0 : _counter;
    _setPrefsItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefsItems();
    return _counter;
  }

  int getQuantity(int quantity) {
    _getPrefsItems();
    return _quantity;
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
}

  //code for button UI
  // Container(
  //                 padding: EdgeInsets.all(3),
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(5),
  //                     color: Theme.of(context).accentColor),
  //                 child: Row(
  //                   children: [
  //                     InkWell(
  //                         onTap: () {},
  //                         child: Icon(
  //                           Icons.remove,
  //                           color: Colors.white,
  //                           size: 16,
  //                         )),
  //                     Container(
  //                       margin: EdgeInsets.symmetric(horizontal: 3),
  //                       padding:
  //                           EdgeInsets.symmetric(horizontal: 3, vertical: 2),
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(3),
  //                           color: Colors.white),
  //                       child: Text(
  //                         '3',
  //                         style: TextStyle(color: Colors.black, fontSize: 16),
  //                       ),
  //                     ),
  //                     InkWell(
  //                         onTap: () {},
  //                         child: Icon(
  //                           Icons.add,
  //                           color: Colors.white,
  //                           size: 16,
  //                         )),
  //                   ],
  //                 ),
  //               ),