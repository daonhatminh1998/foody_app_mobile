import 'package:flutter/material.dart';
import 'package:foody_app/model/product/product_detail.dart';

class ProductDetailItem extends StatefulWidget {
  const ProductDetailItem(
      {super.key,
      required this.productInfo,
      required this.onIncrese,
      required this.onDecrease,
      required this.onRemove});
  // final CartDetail detail;
  final ProductDetail productInfo;
  final Function onIncrese;
  final Function onDecrease;
  final Function onRemove;

  @override
  State<ProductDetailItem> createState() => _ProductDetailItemState();
}

class _ProductDetailItemState extends State<ProductDetailItem> {
  // final items = ProductDetailViewModel().itemsList;
  @override
  Widget build(BuildContext context) {
    // print('product detailt item :$_items');
    return Container(
      padding: EdgeInsets.zero,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) => Card(
                color: Colors.amber,
                elevation: 4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.network(
                          widget.productInfo.img,
                          width: 40,
                          height: 40,
                        )
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}
