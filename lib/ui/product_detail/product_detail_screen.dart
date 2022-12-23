import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foody_app/model/product/product.dart';
import 'package:foody_app/model/product/product_detail.dart';
import 'package:foody_app/ui/cart/cart_screen.dart';
import 'package:foody_app/ui/cart/cart_view_model.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final img = ['p11', 'p11-1', 'p11-2'];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.productName),
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
              animationDuration: const Duration(milliseconds: 1000),
              position: BadgePosition.topEnd(top: 4, end: -5),
              child: const Icon(Icons.shopping_cart),
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        items: img
                            .map(
                              (item) => Image.network(
                                widget.product.image,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            )
                            .toList(),
                        carouselController: _controller,
                        options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.3,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: img.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.product.productName,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 107, 148, 72),
                                  fontWeight: FontWeight.bold)),
                          Text('\$ ${widget.product.productPrice}',
                              style: const TextStyle(
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 107, 148, 72),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  color: Colors.white,
                  // elevation: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Product short ",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 107, 148, 72),
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(widget.product.shortDescription),
                      // Text(
                      //     'Tinh Chất Chống Nắng Hiệu Chỉnh Sắc Da Sunplay Skin Aqua Tone Up UV Essence là dòng sản phẩm chống nắng da mặt đến từ thương hiệu Sunplay - nhãn hàng chống nắng dưỡng da nổi tiếng xuất xứ Nhật Bản, với 3 tác dụng chỉ trong 1 sản phẩm: khả năng chống nắng cực đỉnh (SPF 50+ PA++++), giữ ẩm và dưỡng sáng da tối ưu (nhờ thành phần dưỡng ẩm Hyaluronic Acid và Vitamin C), khả năng hiệu chỉnh sắc da và nâng tone da rạng rỡ. Kết cấu dạng tinh chất mỏng nhẹ, không nhờn rít giúp da luôn ẩm mượt.')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Long Description',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 107, 148, 72),
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(widget.product.longDescription)
                      // Text(
                      //     'Water, Ethylhexyl Methoxycinnamate, Butylene Glycol, Talc, Triethylhexanoin, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Methyl Methacrylate Crosspolymer, Bis-Isobutyl PEG/PPG-10/7/Dimethicone Copolymer, Bis-PEG-18 Methyl Ether Dimethyl Silane, PEG-40 Stearate, Synthetic Fluorphlogopite, Tin Oxide, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Silica, Alumina, Mica, Ammonium Acryloyldimethyltaurate/VP Copolymer, Triethanolamine, Sodium Hyaluronate (HA), Magnesium Ascorbyl Phosphate, Xanthan Gum, Disodium EDTA, Ethylhexylglycerin, Pearl Powder, Methylene Bis-Benzotriazolyl Tetramethylbutylphenol, Glycol Dimethacrylate Crosspolymer, Decyl Glucoside, Polystyrene, Polyvinyl Alcohol, Propylene Glycol, Phenoxyethanol, Fragrance, CI 77491, CI 77492, CI 77499, CI 77891.')
                    ],
                  ),
                ),
              ],
            ),
          )),
          // const Spacer(),
          //     ProductDetail productInfo = ProductDetail(
          // productDetailId: widget.product.productID,
          // name: widget.product.productName,
          // quantity: 1,
          // price: widget.product.productPrice,
          // img: widget.product.image);
          _bottomButtonWidget(widget.product),
        ],
      ),
    );
  }
}

Widget _bottomButtonWidget(Product product) => Consumer<CartViewModel>(
      builder: (context, model, child) {
        ProductDetail productInfo = ProductDetail(
            productDetailId: product.productID,
            name: product.productName,
            quantity: 1,
            price: product.productPrice,
            img: product.image);
        int index = model.cart.indexWhere(
            (e) => e.productDetailId == productInfo.productDetailId);
        // print(index);
        if (index == -1) {
          return Container(
            color: Colors.amber,
            width: MediaQuery.of(context).size.width * 1,
            child: TextButton(
              onPressed: () {
                model.incrementCounter(productInfo);
              },
              child: const Text(
                'Add to cart',
                style: TextStyle(color: Colors.white),
              ),
            ),

            // Row(
            //   children: [
            //     Container(
            //       color: Colors.amber,
            //       width: MediaQuery.of(context).size.width * 1,
            //       child: TextButton(
            //         onPressed: () {
            //           model.incrementCounter(productInfo);
            //         },
            //         child: const Text(
            //           'Add to cart',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ),
            //   ],
          );
        } else {
          return Row(
            children: [
              Container(
                color: Colors.amber,
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextButton(
                  onPressed: () {
                    model.incrementCounter(productInfo);
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Center(
                    child: Text(
                      context
                          .read<CartViewModel>()
                          .cart[index]
                          .quantity
                          .toString(),
                      // model.cart[index].quantity.toString(),
                      style: const TextStyle(
                          color: Color.fromRGBO(60, 184, 21, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                color: Colors.red,
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextButton(
                  onPressed: () {
                    print(productInfo.toJson());
                    model.decrementCounter(productInfo);
                  },
                  child: const Text(
                    '-',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
