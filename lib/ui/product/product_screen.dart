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

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  final _productViewModel = ProductViewModel();
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
        return (model.products.isEmpty)
            ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Loading Products',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 107, 148, 72)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CircularProgressIndicator(
                        value: controller.value,
                        semanticsLabel: 'Circular progress indicator',
                        color: const Color.fromARGB(255, 107, 148, 72),
                      ),
                    ]),
              )
            : ListView.builder(
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
