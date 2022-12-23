import 'package:flutter/material.dart';
import 'package:foody_app/model/product/product_detail.dart';
import 'package:foody_app/ui/cart/cart_view_model.dart';
import 'package:provider/provider.dart';

class CartOrderItem extends StatefulWidget {
  const CartOrderItem({
    super.key,
    required this.productInfo,
  });
  final ProductDetail productInfo;

  @override
  State<CartOrderItem> createState() => _CartOrderItemState();
}

class _CartOrderItemState extends State<CartOrderItem> {
  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartViewModel>(context);
    // print(cart.cart.map((e) => e.toJson()));
    return Card(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              widget.productInfo.img,
              width: 80,
              height: 80,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: widget.productInfo.name,
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ]),
                  ),
                  RichText(
                    text: TextSpan(
                        // text: "Price: ",
                        // style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: '\$ ${widget.productInfo.price}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    text: TextSpan(
                        text: "Total: ",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        // style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  ('\$ ${(widget.productInfo.quantity * widget.productInfo.price).toStringAsFixed(2)}'),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                ],
              ),
            ),
            ReuseableButtonWidget(
              productInfo: widget.productInfo,
            ),
          ],
        ),
      ),
    );
  }
}

//component
class ReuseableButtonWidget extends StatelessWidget {
  const ReuseableButtonWidget({super.key, required this.productInfo});
  final ProductDetail productInfo;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
        builder: (context, model, child) => Container(
              // width: MediaQuery.of(context).size.width * 0.35,
              // padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              // color: Theme.of(context).accentColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                    child: Center(
                      child: Text('X ${productInfo.quantity}',
                          style: const TextStyle(
                              color: Color.fromRGBO(246, 80, 5, 1),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ));
  }
}
