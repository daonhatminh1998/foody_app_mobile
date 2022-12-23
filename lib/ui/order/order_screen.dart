import 'package:flutter/material.dart';
import 'package:foody_app/components/navigation_bar.dart';
import 'package:foody_app/model/order/details.dart';
import 'package:foody_app/ui/product_detail/product_detail_view_model.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:foody_app/ui/cart/cart_view_model.dart';
import 'package:foody_app/ui/order/cart_order_item.dart';
import 'package:foody_app/ui/order/order_view_item.dart';
import 'package:foody_app/ui/receiver/receiver_item.dart';
import 'package:foody_app/ui/receiver/receiver_screen.dart';
import 'package:foody_app/ui/receiver/receiver_update_screen.dart';
import 'package:foody_app/ui/receiver/receiver_view_model.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _orderViewModel = OrderViewModel();
  final _receiverViewModel = ReceiverViewModel();
  // final _cartViewModel = CartViewModel();
  // final _model = ProductDetailViewModel();

  Future<void> order(var context, OrderViewModel model) async {
    print("Order (screen)");
    int index =
        _receiverViewModel.receivers.indexWhere((e) => e.is_Chosen == 1);
    int Re_Id = _receiverViewModel.receivers[index].Re_Id;
    const note = "";

    List<Details> details = [];
    final orders = Provider.of<CartViewModel>(context, listen: false)
        .cart
        .map((e) => Details(id: e.productDetailId, quantity: e.quantity));

    orders.forEach(((e) => details.add(e)));

    final request = await model.order(Re_Id, note, details);
    if (request) {
      print("order successful (screen)");
      Provider.of<CartViewModel>(context, listen: false).clearCart();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NavigationBarDisplay()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Order Fail!!!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: _receiverViewModel,
      child: Scaffold(
        appBar: AppBar(title: const Text("My Order")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _receiver(),
            _cartItemList(),
          ],
        ),
        bottomNavigationBar: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .5,
              color: Colors.red,
              height: kBottomNavigationBarHeight,
              child: Consumer<CartViewModel>(
                builder: (context, value, child) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          " TOTAL",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$${value.totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]);
                },
              ),
            ),
            Container(
              color: const Color.fromRGBO(60, 184, 21, 1),
              width: MediaQuery.of(context).size.width * .5,
              height: kBottomNavigationBarHeight,
              child: TextButton(
                  onPressed: () => order(context, _orderViewModel),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartItemList() => Expanded(
        child: Consumer<CartViewModel>(
          builder: (context, model, child) {
            return ListView.builder(
                // shrinkWrap: true,
                itemCount: model.cart.length,
                itemBuilder: ((context, index) {
                  return CartOrderItem(
                    productInfo: model.cart[index],
                  );
                }));
          },
        ),
      );

  Widget _receiver() => ScopedModelDescendant<ReceiverViewModel>(builder: (
        BuildContext context,
        Widget? child,
        ReceiverViewModel model,
      ) {
        int index = model.receivers.indexWhere((e) => e.is_Chosen == 1);
        // print(model.receivers
        //     .where((e) => e.is_Chosen == 1)
        //     .map((e) => e.toJson()));
        if (index == -1) {
          return Column(
            children: [
              InkWell(
                child: Card(
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height * 0.05,
                      color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.add,
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Add More',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReceiverScreen()));
                },
              ),
            ],
          );
        } else {
          return Column(
            children: [
              ReceiverItem(
                receiver: model.receivers[index],
                onTap: (receiver) => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateReceiver(receiver: receiver),
                    ),
                  ),
                },
                onClick: (receiver) => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReceiverScreen(index: 1),
                    ),
                  ),
                },
              ),
            ],
          );
        }
      });
}
