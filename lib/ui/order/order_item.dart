import 'package:flutter/material.dart';
import 'package:foody_app/model/order/order.dart';
import 'package:foody_app/ui/order/order_view_item.dart';

class OrderDetail extends StatefulWidget {
  final Order order;
  final Function(Order order) onClick;

  const OrderDetail({super.key, required this.order, required this.onClick});
  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  OrderViewModel model = OrderViewModel();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.125,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '${widget.order.address} | ',
                              ),
                              TextSpan(
                                text: widget.order.phone,
                              )
                            ]),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: widget.order.address,
                              )
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      )),
      onTap: () => widget.onClick(widget.order),
      // onTap: () {
      //   print("tapped ${widget.order.toJson()}");
      // },
    );
  }
}
