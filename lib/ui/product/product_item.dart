import 'package:flutter/material.dart';
import 'package:foody_app/ui/cart/cart_view_model.dart';
import 'package:foody_app/model/product/product.dart';
import 'package:foody_app/model/product/product_detail.dart';
import 'package:foody_app/ui/product_detail/product_detail_view_model.dart';
import 'package:foody_app/db/product_model_DAO.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product, required this.onTap});
  final Product product;
  final Function(Product product) onTap; //funtion move to detail page
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  ProductDetailViewModel model = ProductDetailViewModel();
  ProductModelDAO dbHelper = ProductModelDAO();

  @override
  Widget build(BuildContext context) {
    print("product item in product screen");
    // print('total products: ${model.products.length}');
    // call Provider.of to update quantity ui
    var cart = Provider.of<CartViewModel>(context);
    // ProductDetailViewModel productDetailModel = ProductDetailViewModel();

    return ListView.builder(
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemCount: 1,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: ((context, index) => Card(
            color: Colors.amber,
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            widget.product.image,
                            width: 80,
                            height: 80,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
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
                                      text: widget.product.productName,
                                    )
                                  ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                      // text: "Price: ",
                                      // style: TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text:
                                              '\$ ${widget.product.productPrice}',
                                        )
                                      ]),
                                ),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  text: TextSpan(text: "Unit: ",
                                      // style: TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: widget.product.unit,
                                        )
                                      ]),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                // add product to cart code
                                // print(
                                //     'add product to cart ${widget.product.toJson()}');
                                ProductDetail productInCart = ProductDetail(
                                    productDetailId: widget.product.productID,
                                    name: widget.product.productName,
                                    quantity: 1,
                                    price: widget.product.productPrice,
                                    img: widget.product.image);
                                // print(productInCart.toJson());
                                cart.incrementCounter(productInCart);
                                ////check cart
                                print(cart.cart.map((e) => e.toJson()));
                              },
                              child: Container(
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text(
                                    'Add to cart',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Column(
                          //   children: [
                          //     ElevatedButton(
                          //       style: ElevatedButton.styleFrom(
                          //         elevation: 3,
                          //         shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(32)),
                          //       ),
                          //       onPressed: () {
                          //         // print(widget.product.toJson());
                          //         ProductDetail productInfo = ProductDetail(
                          //             name: widget.product.Pro_Name,
                          //             img: widget.product.Pro_Avatar,
                          //             productDetailId: widget.product.ProDe_Id,
                          //             quantity: 1,
                          //             price: widget.product.Pro_Price);
                          //         // cart.incrementCounter(productInfo);
                          //         // cart.decrementCounter(productInfo);
                          //         // productDetailModel.add(productInfo);
                          //         // print(cart.cartData.map((e) => e.toJson()));
                          //       },
                          //       child: const Text("Add to cart"),
                          //     ),
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //     elevation: 3,
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(32)),
                          //   ),
                          //   onPressed: () {
                          //     // print(widget.product.toJson());
                          //
                          //     ProductDetail productInfo = ProductDetail(
                          //         name: widget.product.Pro_Name,
                          //         img: widget.product.Pro_Avatar,
                          //         productDetailId: widget.product.ProDe_Id,
                          //         quantity: 1,
                          //         price: widget.product.Pro_Price);
                          //     // cart.incrementCounter(productInfo);
                          //     // cart.decrementCounter(productInfo);
                          //     // productDetailModel.add(productInfo);
                          //     // print(cart.cartData.map((e) => e.toJson()));
                          //   },
                          //   child: const Text("-"),
                          // ),
                          // ],
                          // )
                        ]),
                  ],
                ),
                onTap: () => widget.onTap(widget.product),
              ),
            ),
          )),
    );
  }
}
