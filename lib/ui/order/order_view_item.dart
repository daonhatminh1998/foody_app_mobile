// ignore_for_file: non_constant_identifier_names
import 'package:foody_app/model/order/details.dart';
import 'package:foody_app/model/order/order.dart';
import 'package:foody_app/model/order/order_request.dart';

import 'package:foody_app/ultils/app_variables.dart';
import 'package:scoped_model/scoped_model.dart';

class OrderViewModel extends Model {
  static final OrderViewModel _instance = OrderViewModel._internal();
  factory OrderViewModel() => _instance;

  List<Order> orders = [];

  OrderViewModel._internal() {
    updateList();
  }

  void updateList() async {
    final rs = await AppVariables.api.listOrder();
    orders = rs.data ?? [];
    notifyListeners();
  }

  Future<bool> order(int Re_Id, String note, List<Details> cart) async {
    var request = await AppVariables.api
        .order(OrderRequest(Re_Id: Re_Id, details: cart, ORD_CusNote: note));
    print(
        'errorCode: ${request.errorCode},message:${request.message},data:${request.data?.toJson()}');
    if (request.errorCode == 0) {
      updateList();
      print(
          'errorCode: ${request.errorCode},message:${request.message},data:${request.data?.toJson()}');
      return true;
    }
    return false;
  }
}
