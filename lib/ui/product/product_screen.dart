import 'package:flutter/material.dart';
import 'package:foody_app/ui/product/product_item.dart';
import 'package:foody_app/ui/product/product_view_model.dart';
import 'package:foody_app/ui/product_detail/product_detail_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _productViewModel = ProductViewModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: _productViewModel,
      child: Scaffold(
        body: _listProducts(),
      ),
    );
  }

  Widget _listProducts() => ScopedModelDescendant<ProductViewModel>(builder:
          (BuildContext context, Widget? child, ProductViewModel model) {
        return ListView.builder(
            itemCount: model.products.length,
            itemBuilder: (context, index) {
              // ProductDetail productInfo = ProductDetail(
              //     productDetailId: model.products[index].productID,
              //     name: model.products[index].productName,
              //     quantity: 1,
              //     price: model.products[index].productPrice,
              //     img: model.products[index].image);
              return ProductItem(
                  product: model.products[index],
                  onTap: (product) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ProductDetailScreen(
                                product: model.products[index],
                              ))))
                  // print("on tap ${product.toJson()}");
                  );
            });
      });
}
