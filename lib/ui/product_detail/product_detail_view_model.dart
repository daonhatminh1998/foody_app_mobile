import 'package:foody_app/model/cart/cart_detail.dart';
import 'package:foody_app/model/product/product_detail.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductDetailViewModel extends Model {
  static final ProductDetailViewModel _instance =
      ProductDetailViewModel._internal();
  factory ProductDetailViewModel() => _instance;

  // received cart from api
  List<CartDetail> carts = [];
  // cart item on client before add to order
  List<ProductDetail> itemsList = [];

  ProductDetailViewModel._internal() {
    updateList();
  }

  void add(ProductDetail productDetail) async {}

  // void save(Product product) async {
  //   product.ProDe_Id == 0
  //       ? await AppVariables.api.addProduct(product)
  //       : AppVariables.api.updateProduct(product.ProDe_Id, product);
  //   updateList();
  // }

  void updateList() async {
    // final rs = await AppVariables.api.getCarts();
    // carts = rs.data?.cartItem ?? [];
    // print(carts.map((e) => e.toJson()));
    // print(rs.data?.cartItem.map((e) => e.toJson()));
    notifyListeners();
  }
}
