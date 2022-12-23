import 'package:flutter/material.dart';
import 'package:foody_app/components/background-image.dart';
import 'package:foody_app/ui/order/order_item.dart';
import 'package:foody_app/ui/order/order_view_item.dart';

import 'package:scoped_model/scoped_model.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final _orderViewModel = OrderViewModel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/carousel-2.jpg'),
        ScopedModel(
          model: _orderViewModel,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(title: const Text("My Order")),
            body: _listOrder(),
          ),
        ),
      ],
    );
  }

  Widget _listOrder() => ScopedModelDescendant<OrderViewModel>(
          builder: (BuildContext context, Widget? child, OrderViewModel model) {
        _orderViewModel.updateList();
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model.orders.length,
                      itemBuilder: (context, index) {
                        return OrderDetail(
                          order: model.orders[index],
                          onClick: (order) => {
                            // //   // Navigator.push(
                            // //   //   context,
                            // //   //   MaterialPageRoute(
                            // //   //     builder: (context) =>
                            // //   //         UpdateReceiver(order: order),
                            // //   //   ),
                            // //   // ),
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      });
}
