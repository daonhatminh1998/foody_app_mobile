// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:badges/badges.dart';
import 'package:foody_app/ui/cart/cart_item.dart';

import 'package:foody_app/ui/cart/cart_view_model.dart';

import 'package:flutter/material.dart';
import 'package:foody_app/ui/order/order_screen.dart';
import 'package:foody_app/ui/receiver/receiver_view_model.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _receiverViewModel = ReceiverViewModel();

  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartViewModel>(context).cart;
    print(_cart);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(60, 184, 21, 1),
        title: const Text("My Products"),
        centerTitle: true,
        actions: [
          Badge(
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
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: _itemsInCart(),
      bottomNavigationBar: InkWell(
        onTap: _cart.isEmpty
            ? () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Your cart is empty")))
            : () => {
                  _receiverViewModel.reset(),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderScreen(),
                    ),
                  )
                },
        child: Container(
          color: Colors.amber,
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * .06,
          child: const Text(
            'Check Out',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _itemsInCart() => Column(
        children: [
          Expanded(
            child: Consumer<CartViewModel>(
              builder: (context, model, child) {
                // print(model.cart.map((e) => e.toJson()));
                if (model.cart.isEmpty) {
                  return const Center(
                    child: Text("Your Cart Is Empty"),
                  );
                } else {
                  return ListView.builder(
                      // shrinkWrap: true,
                      itemCount: model.cart.length,
                      itemBuilder: ((context, index) {
                        return CartItem(
                          productInfo: model.cart[index],
                        );
                      }));
                }
              },
            ),
          ),
          Consumer<CartViewModel>(
            builder: (context, value, child) {
              return ReusableSubTotalWidget(
                title: "SUB TOTAL",
                value: '\$${value.totalPrice.toStringAsFixed(2)}',
              );
            },
          ),
        ],
      );
}

// customer widget display subtotal value
class ReusableSubTotalWidget extends StatelessWidget {
  final String title, value;
  const ReusableSubTotalWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}
