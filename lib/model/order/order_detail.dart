// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:foody_app/model/order/order.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_detail.g.dart';

@JsonSerializable()
class OrderDetail {
  @JsonKey(name: 'ORDe_Id')
  int id;
  @JsonKey(name: 'ORDe_Quantity')
  int quantity;
  @JsonKey(name: 'ORDe_Price')
  double price;
  @JsonKey(name: 'ProDe_Id')
  int productDetailID;
  @JsonKey(name: 'ORD_Id')
  int orderId;

  OrderDetail(
      {this.id = 0,
      required this.quantity,
      required this.price,
      required this.productDetailID,
      required this.orderId});

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}
