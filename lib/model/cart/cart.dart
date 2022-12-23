// ignore_for_file: depend_on_referenced_packages

import 'package:foody_app/model/cart/cart_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(name: 'Cart_Id')
  int id;
  @JsonKey(name: 'Mem_Id')
  int memberId;
  @JsonKey(name: 'cart_detail')
  List<CartDetail> cartItem = [];

  Cart({this.id = 0, required this.cartItem, required this.memberId});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
