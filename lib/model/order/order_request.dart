// ignore_for_file: unused_import, depend_on_referenced_packages, non_constant_identifier_names

import 'package:foody_app/model/cart/cart_detail.dart';
import 'package:foody_app/model/order/details.dart';
import 'package:foody_app/model/order/order.dart';
import 'package:foody_app/model/product/product_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_request.g.dart';

@JsonSerializable()
class OrderRequest {
  int Re_Id;
  String ORD_CusNote;
  List<Details> details = [];

  OrderRequest(
      {required this.Re_Id, this.ORD_CusNote = "", required this.details});

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}
