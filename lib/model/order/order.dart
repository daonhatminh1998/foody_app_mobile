// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:foody_app/model/order/order_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: 'ORD_Id')
  int orderId;
  @JsonKey(name: 'ORD_Code')
  String orderCode;
  @JsonKey(name: 'ORD_DateTime')
  String date;
  @JsonKey(name: 'ORD_Name')
  String name;
  @JsonKey(name: 'ORD_Phone')
  String phone;
  @JsonKey(name: 'ORD_Address')
  String address;
  @JsonKey(name: 'ORD_AdNote')
  String adNote;
  @JsonKey(name: 'ORD_CusNote')
  String cusNote;
  @JsonKey(name: 'Mem_Id')
  int memberID;

  Order({
    this.orderId = 0,
    required this.orderCode,
    required this.date,
    required this.name,
    required this.phone,
    required this.address,
    required this.memberID,
    this.adNote = "",
    this.cusNote = "",
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
