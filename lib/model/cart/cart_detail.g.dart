// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDetail _$CartDetailFromJson(Map<String, dynamic> json) => CartDetail(
      cartDetailId: json['CartDe_Id'] as int? ?? 0,
      productId: json['ProDe_Id'] as int,
      quantity: json['CartDe_Quantity'] as int,
      cartId: json['Cart_Id'] as int,
    );

Map<String, dynamic> _$CartDetailToJson(CartDetail instance) =>
    <String, dynamic>{
      'CartDe_Id': instance.cartDetailId,
      'CartDe_Quantity': instance.quantity,
      'ProDe_Id': instance.productId,
      'Cart_Id': instance.cartId,
    };
