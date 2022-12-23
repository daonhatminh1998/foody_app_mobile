import 'package:foody_app/model/product/product.dart';
import 'package:foody_app/ultils/app_variables.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductViewModel extends Model {
  static final ProductViewModel _instance = ProductViewModel._internal();
  factory ProductViewModel() => _instance;

  List<Product> products = [];

  ProductViewModel._internal() {
    updateList();
  }
  //get product list from api
  void updateList() async {
    print("update productList");
    final rs = await AppVariables.api.getProducts();
    products = rs.data ?? [];
    notifyListeners();
  }
}
