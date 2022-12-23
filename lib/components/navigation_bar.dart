import 'package:badges/badges.dart';

import 'package:flutter/material.dart';
import 'package:foody_app/ui/cart/cart_screen.dart';
import 'package:foody_app/ui/cart/cart_view_model.dart';
import 'package:foody_app/ui/home/home_screen.dart';
import 'package:foody_app/ui/member/profile_screen.dart';
import 'package:foody_app/ui/order/order_view_item.dart';
import 'package:foody_app/ui/product/product_screen.dart';
import 'package:foody_app/ui/product/product_view_model.dart';
import 'package:foody_app/ui/receiver/receiver_view_model.dart';

import 'package:provider/provider.dart';

class NavigationBarDisplay extends StatefulWidget {
  const NavigationBarDisplay({super.key, this.index = 0});
  final int index;

  @override
  State<NavigationBarDisplay> createState() => _NavigationBarDisplayState();
}

class _NavigationBarDisplayState extends State<NavigationBarDisplay> {
  //bottom navigation bar
  int _selectedIndex = 0;

  _NavigationBarDisplayState();

  final receiverViewModel = ReceiverViewModel();
  final orderViewModel = OrderViewModel();
  final productViewModel = ProductViewModel();

  static const List<Widget> _widgesOption = <Widget>[
    HomeScreen(),
    ProductScreen(),
    ProfileScreen(),
  ];

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    productViewModel.updateList();
    receiverViewModel.updateList();
    orderViewModel.updateList();
    // setState(() {
    //   _selectedIndex = widget.index;
    // });
    return Scaffold(
      // endDrawer: const CartScreenDrawer(),
      appBar: AppBar(
        // backgroundColor: Colors.green,
        title: const Text("Home Page"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            child: Badge(
              badgeContent: Consumer<CartViewModel>(
                builder: (context, value, child) {
                  return Text(
                    // '${value.totalItems}',
                    '${value.counter}',
                    style: const TextStyle(color: Colors.white),
                  );
                },
              ),
              animationDuration: const Duration(milliseconds: 200),
              position: BadgePosition.topEnd(top: 4, end: -5),
              child: const Icon(Icons.shopping_cart),
              // position: BadgePosition.topEnd(top: 4, end: 2),
              // child: Builder(
              //   builder: (context) => IconButton(
              //     onPressed: () => Scaffold.of(context).openEndDrawer(),
              //     icon: const Icon(Icons.shopping_cart),
              //   ),
              // ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
      ),
      extendBody: true,
      body: Container(
        // padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        child: _widgesOption.elementAt(_selectedIndex),
      ),
    );
  }
}
